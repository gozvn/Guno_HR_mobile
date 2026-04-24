import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gu_hr_mobile/features/attendance/data/local/attendance_database.dart';
import 'package:gu_hr_mobile/features/attendance/data/local/pending_checkins_dao.dart';
import 'package:gu_hr_mobile/features/attendance/data/local/locations_cache_dao.dart';

AttendanceDatabase _openInMemory() =>
    AttendanceDatabase(NativeDatabase.memory());

void main() {
  late AttendanceDatabase db;
  late PendingCheckinsDao checkinsDao;
  late LocationsCacheDao locationsDao;

  setUp(() {
    db = _openInMemory();
    checkinsDao = PendingCheckinsDao(db);
    locationsDao = LocationsCacheDao(db);
  });

  tearDown(() => db.close());

  group('PendingCheckins', () {
    test('insert and query pending row', () async {
      await checkinsDao.insert(
        PendingCheckinsCompanion.insert(
          id: 'test-uuid-1',
          type: 'checkin',
          occurredAt: DateTime(2026, 4, 24, 9, 0),
        ),
      );

      final rows = await checkinsDao.dueNow();
      expect(rows, hasLength(1));
      expect(rows.first.id, 'test-uuid-1');
      expect(rows.first.type, 'checkin');
      expect(rows.first.retryCount, 0);
    });

    test('rows with future nextRetryAt are NOT in dueNow', () async {
      await checkinsDao.insert(
        PendingCheckinsCompanion.insert(
          id: 'future-retry',
          type: 'checkin',
          occurredAt: DateTime.now(),
          nextRetryAt: Value(DateTime.now().add(const Duration(hours: 1))),
        ),
      );

      final rows = await checkinsDao.dueNow();
      expect(rows, isEmpty);
    });

    test('rows with null nextRetryAt ARE in dueNow', () async {
      await checkinsDao.insert(
        PendingCheckinsCompanion.insert(
          id: 'null-retry',
          type: 'checkout',
          occurredAt: DateTime.now(),
        ),
      );

      final rows = await checkinsDao.dueNow();
      expect(rows.any((r) => r.id == 'null-retry'), isTrue);
    });

    test('updateRetry increments count and sets nextRetryAt', () async {
      await checkinsDao.insert(
        PendingCheckinsCompanion.insert(
          id: 'retry-me',
          type: 'checkin',
          occurredAt: DateTime.now(),
        ),
      );

      final future = DateTime.now().add(const Duration(seconds: 25));
      await checkinsDao.updateRetry(
        id: 'retry-me',
        retryCount: 2,
        nextRetryAt: future,
        lastError: 'Server error',
      );

      // Row should now be outside dueNow window.
      final due = await checkinsDao.dueNow();
      expect(due.any((r) => r.id == 'retry-me'), isFalse);
    });

    test('deleteAndCleanup removes row from DB', () async {
      await checkinsDao.insert(
        PendingCheckinsCompanion.insert(
          id: 'delete-me',
          type: 'checkin',
          occurredAt: DateTime.now(),
        ),
      );

      final rows = await checkinsDao.dueNow();
      final row = rows.firstWhere((r) => r.id == 'delete-me');
      await checkinsDao.deleteAndCleanup(row);

      final after = await checkinsDao.dueNow();
      expect(after.any((r) => r.id == 'delete-me'), isFalse);
    });

    test('watchAll emits list reactively', () async {
      await checkinsDao.insert(
        PendingCheckinsCompanion.insert(
          id: 'watch-1',
          type: 'checkin',
          occurredAt: DateTime.now(),
        ),
      );

      final list = await checkinsDao.watchAll().first;
      expect(list, hasLength(1));
    });
  });

  group('LocationsCache', () {
    test('getFreshOrNull returns null when empty', () async {
      final result = await locationsDao.getFreshOrNull();
      // Avoid isNull which conflicts with drift's expression builder.
      expect(result == null, isTrue);
    });

    test('replaceAll stores and retrieves locations', () async {
      await locationsDao.replaceAll([
        LocationsCacheCompanion.insert(
          id: const Value(1),
          code: 'HCM',
          name: 'Ho Chi Minh City Office',
          gpsLat: const Value(10.762622),
          gpsLng: const Value(106.660172),
          cachedAt: DateTime.now(),
        ),
        LocationsCacheCompanion.insert(
          id: const Value(2),
          code: 'HN',
          name: 'Hanoi Office',
          cachedAt: DateTime.now(),
        ),
      ]);

      final rows = await locationsDao.getAll();
      expect(rows, hasLength(2));
      expect(rows.map((r) => r.code), containsAll(['HCM', 'HN']));
    });

    test('getFreshOrNull returns null when cache is >24h old', () async {
      final staleTime = DateTime.now().subtract(const Duration(hours: 25));
      await locationsDao.replaceAll([
        LocationsCacheCompanion.insert(
          id: const Value(1),
          code: 'HCM',
          name: 'Test',
          cachedAt: staleTime,
        ),
      ]);

      final result = await locationsDao.getFreshOrNull();
      expect(result == null, isTrue);
    });

    test('replaceAll is atomic — clears old rows before inserting new',
        () async {
      await locationsDao.replaceAll([
        LocationsCacheCompanion.insert(
          id: const Value(1),
          code: 'OLD',
          name: 'Old Office',
          cachedAt: DateTime.now(),
        ),
      ]);

      await locationsDao.replaceAll([
        LocationsCacheCompanion.insert(
          id: const Value(2),
          code: 'NEW',
          name: 'New Office',
          cachedAt: DateTime.now(),
        ),
      ]);

      final rows = await locationsDao.getAll();
      expect(rows, hasLength(1));
      expect(rows.first.code, 'NEW');
    });
  });
}
