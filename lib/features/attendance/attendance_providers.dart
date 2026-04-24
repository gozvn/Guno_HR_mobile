import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers.dart';
import '../auth/domain/auth_state.dart';
import '../auth/presentation/auth_notifier.dart';
import 'data/attendance_api.dart';
import 'data/dto/attendance_record_dto.dart';
import 'data/dto/location_dto.dart';
import 'data/dto/monthly_attendance_dto.dart';
import 'data/local/attendance_database.dart';
import 'data/local/locations_cache_dao.dart';
import 'data/local/pending_checkins_dao.dart';
import 'data/locations_api.dart';
import 'services/camera_service.dart';
import 'services/check_in_submitter.dart';
import 'services/geolocation_service.dart';
import 'services/offline_retry_worker.dart';
import 'services/photo_compressor.dart';

// Re-export controller so feature files can import a single providers file.
export 'presentation/check_in_flow/check_in_flow_controller.dart';

part 'attendance_providers.g.dart';

// ---------------------------------------------------------------------------
// Database — async open, kept alive for app lifetime.

final attendanceDatabaseProvider =
    FutureProvider<AttendanceDatabase>((ref) async {
  final db = await AttendanceDatabase.open();
  ref.onDispose(db.close);
  return db;
});

// ---------------------------------------------------------------------------
// DAOs — only created once the DB future resolves.

final pendingCheckinsDaoProvider = Provider<PendingCheckinsDao>((ref) {
  final db = ref.watch(attendanceDatabaseProvider).requireValue;
  return PendingCheckinsDao(db);
});

final locationsCacheDaoProvider = Provider<LocationsCacheDao>((ref) {
  final db = ref.watch(attendanceDatabaseProvider).requireValue;
  return LocationsCacheDao(db);
});

// ---------------------------------------------------------------------------
// APIs

@riverpod
AttendanceApi attendanceApi(Ref ref) => AttendanceApi(ref.watch(dioProvider));

@riverpod
LocationsApi locationsApi(Ref ref) => LocationsApi(ref.watch(dioProvider));

// ---------------------------------------------------------------------------
// Services

@riverpod
GeolocationService geolocationService(Ref ref) => GeolocationService();

@riverpod
PhotoCompressor photoCompressor(Ref ref) => PhotoCompressor();

@riverpod
CameraService cameraService(Ref ref) {
  final svc = CameraService();
  ref.onDispose(svc.dispose);
  return svc;
}

@riverpod
CheckInSubmitter checkInSubmitter(Ref ref) {
  final db = ref.watch(attendanceDatabaseProvider).requireValue;
  return CheckInSubmitter(
    api: ref.watch(attendanceApiProvider),
    dao: PendingCheckinsDao(db),
  );
}

@riverpod
OfflineRetryWorker offlineRetryWorker(Ref ref) {
  final db = ref.watch(attendanceDatabaseProvider).requireValue;
  final worker = OfflineRetryWorker(
    api: ref.watch(attendanceApiProvider),
    dao: PendingCheckinsDao(db),
    connectivity: Connectivity().onConnectivityChanged,
    onForceLogout: () =>
        ref.read(authNotifierProvider.notifier).forceLogout(),
  );
  worker.start();
  ref.onDispose(worker.stop);
  return worker;
}

// ---------------------------------------------------------------------------
// Stream providers — UI observes these reactively.

/// Live count of offline-queued items for the badge chip.
final pendingCheckinCountProvider = StreamProvider<int>((ref) async* {
  final db = await ref.watch(attendanceDatabaseProvider.future);
  yield* PendingCheckinsDao(db).watchAll().map((list) => list.length);
});

/// All pending rows — for the retry list sheet.
final pendingCheckinsListProvider =
    StreamProvider<List<PendingCheckin>>((ref) async* {
  final db = await ref.watch(attendanceDatabaseProvider.future);
  yield* PendingCheckinsDao(db).watchAll();
});

// ---------------------------------------------------------------------------
// Attendance data

/// Today's record for the authenticated user.
/// Server requires explicit employee_id (numeric); resolve from JWT-backed user.
@riverpod
Future<AttendanceRecordDto?> todayAttendance(Ref ref) async {
  final authState = ref.watch(authNotifierProvider);
  final employeeId = switch (authState) {
    AuthAuthenticated(:final user) => user.id,
    _ => null,
  };
  if (employeeId == null) return null;
  final records = await ref.watch(attendanceApiProvider).fetchToday(employeeId);
  return records.isEmpty ? null : records.first;
}

/// Monthly attendance for [year]/[month] — family provider.
@riverpod
Future<MonthlyAttendanceDto> monthlyAttendance(
  Ref ref,
  int year,
  int month,
) =>
    ref.watch(attendanceApiProvider).fetchMonthly(year, month);

// ---------------------------------------------------------------------------
// Locations with 24h drift cache

final locationsProvider = FutureProvider<List<LocationDto>>((ref) async {
  final db = await ref.watch(attendanceDatabaseProvider.future);
  final cacheDao = LocationsCacheDao(db);
  final api = ref.watch(locationsApiProvider);

  final cached = await cacheDao.getFreshOrNull();
  if (cached != null) {
    return cached
        .map(
          (r) => LocationDto(
            id: r.id,
            code: r.code,
            name: r.name,
            gpsLat: r.gpsLat,
            gpsLng: r.gpsLng,
            gpsRadiusM: r.gpsRadiusM,
            isActive: r.isActive,
          ),
        )
        .toList();
  }

  final fresh = await api.fetchAll();
  await cacheDao.replaceAll(
    fresh
        .map(
          (dto) => LocationsCacheCompanion.insert(
            id: Value(dto.id),
            code: dto.code,
            name: dto.name,
            gpsLat: Value(dto.gpsLat),
            gpsLng: Value(dto.gpsLng),
            gpsRadiusM: Value(dto.gpsRadiusM),
            isActive: Value(dto.isActive),
            cachedAt: DateTime.now(),
          ),
        )
        .toList(),
  );
  return fresh;
});

// CheckInFlowController lives in:
// presentation/check_in_flow/check_in_flow_controller.dart
