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
    // 1-hour TTL so admin can add/move office locations without users having
    // to log out. Trade-off: 1 extra GET /locations per hour per device.
    final stale =
        DateTime.now().difference(oldest) > const Duration(hours: 1);
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
