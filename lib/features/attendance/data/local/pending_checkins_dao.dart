import 'dart:io';

import 'package:drift/drift.dart';

import 'attendance_database.dart';

part 'pending_checkins_dao.g.dart';

@DriftAccessor(tables: [PendingCheckins])
class PendingCheckinsDao extends DatabaseAccessor<AttendanceDatabase>
    with _$PendingCheckinsDaoMixin {
  PendingCheckinsDao(super.db);

  /// All pending rows — used by StreamProvider for badge count.
  Stream<List<PendingCheckin>> watchAll() =>
      select(pendingCheckins).watch();

  /// Rows due for retry: nextRetryAt is null OR <= now, ordered FIFO.
  Future<List<PendingCheckin>> dueNow() {
    final now = DateTime.now();
    return (select(pendingCheckins)
          ..where(
            (t) => t.nextRetryAt.isNull() | t.nextRetryAt.isSmallerOrEqualValue(now),
          )
          ..orderBy([(t) => OrderingTerm.asc(t.occurredAt)]))
        .get();
  }

  Future<void> insert(PendingCheckinsCompanion entry) =>
      into(pendingCheckins).insert(entry);

  /// Update retry metadata after a failed attempt.
  Future<void> updateRetry({
    required String id,
    required int retryCount,
    required DateTime nextRetryAt,
    String? lastError,
  }) {
    return (update(pendingCheckins)..where((t) => t.id.equals(id))).write(
      PendingCheckinsCompanion(
        retryCount: Value(retryCount),
        nextRetryAt: Value(nextRetryAt),
        lastError: Value(lastError),
      ),
    );
  }

  /// Delete a row and its associated photo file (if any).
  /// Called on successful submission or idempotent 400.
  Future<void> deleteAndCleanup(PendingCheckin row) async {
    await (delete(pendingCheckins)..where((t) => t.id.equals(row.id))).go();

    // Clean up compressed photo from temp dir — not stored in gallery.
    if (row.photoPath != null) {
      final file = File(row.photoPath!);
      if (await file.exists()) {
        await file.delete();
      }
    }
  }
}
