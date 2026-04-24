/// Drift database + request-types cache providers.
/// Split from requests_providers.dart to keep file size under 200 LOC.
library;

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers.dart';
import 'data/dto/request_type_dto.dart';
import 'data/local/requests_database.dart';
import 'data/requests_api.dart';

part 'requests_db_providers.g.dart';

// ---------------------------------------------------------------------------
// Database — async open, kept alive for app lifetime.

final requestsDatabaseProvider = FutureProvider<RequestsDatabase>((ref) async {
  final db = await RequestsDatabase.open();
  ref.onDispose(db.close);
  return db;
});

// ---------------------------------------------------------------------------
// API (declared here; re-exported by requests_providers.dart)

@riverpod
RequestsApi requestsApi(Ref ref) => RequestsApi(ref.watch(dioProvider));

// ---------------------------------------------------------------------------
// Request types — fetched from API, cached 24h in drift

@riverpod
Future<List<RequestTypeDto>> requestTypes(Ref ref) async {
  final db = await ref.watch(requestsDatabaseProvider.future);
  final cached = await db.getFreshTypes();
  if (cached != null) {
    return cached
        .map(
          (r) => RequestTypeDto(
            code: r.code,
            nameVi: r.nameVi,
            nameEn: r.nameEn,
            icon: r.icon,
            color: r.color,
            orderIdx: r.orderIdx,
          ),
        )
        .toList();
  }

  final api = ref.watch(requestsApiProvider);
  final fresh = await api.types();
  await db.replaceTypes(
    fresh
        .map(
          (t) => RequestTypesCacheCompanion.insert(
            code: t.code,
            nameVi: t.nameVi,
            nameEn: t.nameEn,
            icon: t.icon,
            color: t.color,
            orderIdx: Value(t.orderIdx),
            cachedAt: DateTime.now(),
          ),
        )
        .toList(),
  );
  return fresh;
}
