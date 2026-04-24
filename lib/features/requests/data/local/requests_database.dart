import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'requests_database.g.dart';

// ---------------------------------------------------------------------------
// Tables

/// Local cache for request types — refreshed every 24h from /requests/types.
class RequestTypesCache extends Table {
  TextColumn get code => text()();
  TextColumn get nameVi => text()();
  TextColumn get nameEn => text()();
  TextColumn get icon => text()();
  TextColumn get color => text()();
  IntColumn get orderIdx => integer().withDefault(const Constant(0))();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {code};
}

// ---------------------------------------------------------------------------
// Database

@DriftDatabase(tables: [RequestTypesCache])
class RequestsDatabase extends _$RequestsDatabase {
  RequestsDatabase(super.e);

  @override
  int get schemaVersion => 1;

  static Future<RequestsDatabase> open() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'requests.sqlite');
    return RequestsDatabase(NativeDatabase.createInBackground(File(path)));
  }

  /// Returns cached types if still fresh (< 24h old), otherwise null.
  Future<List<RequestTypesCacheData>?> getFreshTypes() async {
    final rows = await select(requestTypesCache).get();
    if (rows.isEmpty) return null;
    final age = DateTime.now().difference(rows.first.cachedAt);
    if (age.inHours >= 24) return null;
    return rows..sort((a, b) => a.orderIdx.compareTo(b.orderIdx));
  }

  /// Replace all cached types atomically.
  Future<void> replaceTypes(List<RequestTypesCacheCompanion> rows) async {
    await transaction(() async {
      await delete(requestTypesCache).go();
      await batch((b) => b.insertAll(requestTypesCache, rows));
    });
  }
}
