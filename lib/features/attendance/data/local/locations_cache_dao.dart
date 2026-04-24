import 'package:drift/drift.dart';

import 'attendance_database.dart';

part 'locations_cache_dao.g.dart';

@DriftAccessor(tables: [LocationsCache])
class LocationsCacheDao extends DatabaseAccessor<AttendanceDatabase>
    with _$LocationsCacheDaoMixin {
  LocationsCacheDao(super.db);

  /// All active cached locations.
  Future<List<LocationsCacheData>> getAll() =>
      (select(locationsCache)
            ..where((t) => t.isActive.equals(true)))
          .get();

  /// Returns null if cache is empty or oldest entry is >24h stale.
  Future<List<LocationsCacheData>?> getFreshOrNull() async {
    final rows = await getAll();
    if (rows.isEmpty) return null;

    final oldest = rows
        .map((r) => r.cachedAt)
        .reduce((a, b) => a.isBefore(b) ? a : b);
    final stale =
        DateTime.now().difference(oldest) > const Duration(hours: 24);
    return stale ? null : rows;
  }

  /// Replace all cached locations atomically.
  Future<void> replaceAll(List<LocationsCacheCompanion> entries) async {
    await transaction(() async {
      await delete(locationsCache).go();
      await batch((b) => b.insertAll(locationsCache, entries));
    });
  }
}
