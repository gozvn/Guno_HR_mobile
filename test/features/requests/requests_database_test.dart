import 'package:drift/native.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:gu_hr_mobile/features/requests/data/local/requests_database.dart';

RequestsDatabase _openInMemory() => RequestsDatabase(NativeDatabase.memory());

void main() {
  group('RequestsDatabase', () {
    late RequestsDatabase db;

    setUp(() => db = _openInMemory());
    tearDown(() => db.close());

    test('getFreshTypes returns null when empty', () async {
      final result = await db.getFreshTypes();
      expect(result, isNull);
    });

    test('replaceTypes stores rows and getFreshTypes returns them', () async {
      await db.replaceTypes([
        RequestTypesCacheCompanion.insert(
          code: 'leave_annual',
          nameVi: 'Nghỉ phép năm',
          nameEn: 'Annual Leave',
          icon: '🏖️',
          color: '#22c55e',
          orderIdx: const Value(1),
          cachedAt: DateTime.now(),
        ),
        RequestTypesCacheCompanion.insert(
          code: 'wfh',
          nameVi: 'Làm việc từ xa',
          nameEn: 'Work From Home',
          icon: '🏠',
          color: '#3b82f6',
          orderIdx: const Value(2),
          cachedAt: DateTime.now(),
        ),
      ]);

      final fresh = await db.getFreshTypes();
      expect(fresh, isNotNull);
      expect(fresh!.length, 2);
      expect(fresh.first.code, 'leave_annual');
    });

    test('replaceTypes is atomic — old rows cleared on replace', () async {
      await db.replaceTypes([
        RequestTypesCacheCompanion.insert(
          code: 'old_type',
          nameVi: 'Cũ',
          nameEn: 'Old',
          icon: '❓',
          color: '#000000',
          orderIdx: const Value(99),
          cachedAt: DateTime.now(),
        ),
      ]);

      await db.replaceTypes([
        RequestTypesCacheCompanion.insert(
          code: 'sick',
          nameVi: 'Nghỉ ốm',
          nameEn: 'Sick Leave',
          icon: '🤒',
          color: '#ef4444',
          orderIdx: const Value(1),
          cachedAt: DateTime.now(),
        ),
      ]);

      final fresh = await db.getFreshTypes();
      expect(fresh, isNotNull);
      expect(fresh!.length, 1);
      expect(fresh.first.code, 'sick');
    });

    test('getFreshTypes returns null when cache is >24h old', () async {
      final staleTime = DateTime.now().subtract(const Duration(hours: 25));
      await db.replaceTypes([
        RequestTypesCacheCompanion.insert(
          code: 'leave_annual',
          nameVi: 'Nghỉ phép năm',
          nameEn: 'Annual Leave',
          icon: '🏖️',
          color: '#22c55e',
          orderIdx: const Value(1),
          cachedAt: staleTime,
        ),
      ]);

      final result = await db.getFreshTypes();
      expect(result, isNull);
    });
  });
}
