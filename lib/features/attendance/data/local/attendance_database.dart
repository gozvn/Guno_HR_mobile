import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'attendance_database.g.dart';

// ---------------------------------------------------------------------------
// Tables

/// Offline queue — rows survive app kill and device reboot.
class PendingCheckins extends Table {
  /// Client-generated UUID — used as idempotency key.
  TextColumn get id => text()();

  /// 'checkin' | 'checkout' | 'wfh_checkin' | 'wfh_checkout'
  TextColumn get type => text()();

  RealColumn get gpsLat => real().nullable()();
  RealColumn get gpsLng => real().nullable()();
  TextColumn get locationCode => text().nullable()();

  /// Absolute path to compressed JPEG in temp dir.
  TextColumn get photoPath => text().nullable()();
  TextColumn get note => text().nullable()();

  /// When the user triggered check-in (local clock — server timestamps on receive).
  DateTimeColumn get occurredAt => dateTime()();

  IntColumn get retryCount =>
      integer().withDefault(const Constant(0))();

  /// Last error message (no stack traces — security).
  TextColumn get lastError => text().nullable()();

  /// Null = retry immediately on next connectivity event.
  DateTimeColumn get nextRetryAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Local cache for office locations — survives restart, refreshed every 24h.
class LocationsCache extends Table {
  IntColumn get id => integer()();
  TextColumn get code => text()();
  TextColumn get name => text()();
  RealColumn get gpsLat => real().nullable()();
  RealColumn get gpsLng => real().nullable()();
  IntColumn get gpsRadiusM =>
      integer().withDefault(const Constant(500))();
  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Database root

@DriftDatabase(tables: [PendingCheckins, LocationsCache])
class AttendanceDatabase extends _$AttendanceDatabase {
  AttendanceDatabase(super.e);

  @override
  int get schemaVersion => 1;

  /// Opens a background-isolate SQLite database at the documents dir.
  static Future<AttendanceDatabase> open() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'attendance.sqlite');
    return AttendanceDatabase(
      NativeDatabase.createInBackground(File(path)),
    );
  }
}
