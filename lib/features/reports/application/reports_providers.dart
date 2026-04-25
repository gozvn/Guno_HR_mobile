import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers.dart';
import '../data/reports_api.dart';

part 'reports_providers.g.dart';

@riverpod
ReportsApi reportsApi(Ref ref) => ReportsApi(ref.watch(dioProvider));

@riverpod
Future<Map<String, dynamic>> monthlyAttendanceReport(
  Ref ref, {
  String? month,
  int? departmentId,
}) =>
    ref
        .watch(reportsApiProvider)
        .monthlyAttendance(month: month, departmentId: departmentId);

@riverpod
Future<Map<String, dynamic>> leaveBalanceReport(
  Ref ref, {
  int? year,
  int? departmentId,
}) =>
    ref
        .watch(reportsApiProvider)
        .leaveBalance(year: year, departmentId: departmentId);

@riverpod
Future<Map<String, dynamic>> requestsReport(
  Ref ref, {
  String? fromDate,
  String? toDate,
  String? type,
  String? status,
  int limit = 200,
}) =>
    ref.watch(reportsApiProvider).requestsReport(
          from: fromDate,
          to: toDate,
          type: type,
          status: status,
          limit: limit,
        );
