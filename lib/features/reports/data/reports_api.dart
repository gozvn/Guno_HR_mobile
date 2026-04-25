import 'package:dio/dio.dart';

/// Thin Dio wrapper for `/api/hr/reports/*`. Manager-eligible endpoints only
/// — Excel export variants are left out because they require hr_admin or
/// accountant roles (see `guOPHUB/docs/hr-api-endpoints.md`).
///
/// MVP returns raw `Map<String, dynamic>` / `List` payloads. Callers adapt
/// the shape at the widget layer. Typed DTOs can follow later if report
/// screens stabilize.
class ReportsApi {
  ReportsApi(this._dio);

  final Dio _dio;

  /// GET /api/hr/reports/monthly-attendance — grid per employee for a month.
  Future<Map<String, dynamic>> monthlyAttendance({
    String? month,
    int? departmentId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/api/hr/reports/monthly-attendance',
      queryParameters: {
        if (month != null) 'month': month,
        if (departmentId != null) 'department_id': departmentId,
      },
    );
    return resp.data!;
  }

  /// GET /api/hr/reports/leave-balance — annual leave balance per employee.
  Future<Map<String, dynamic>> leaveBalance({
    int? year,
    int? departmentId,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/api/hr/reports/leave-balance',
      queryParameters: {
        if (year != null) 'year': year,
        if (departmentId != null) 'department_id': departmentId,
      },
    );
    return resp.data!;
  }

  /// GET /api/hr/reports/requests — filtered list + aggregates.
  Future<Map<String, dynamic>> requestsReport({
    String? from,
    String? to,
    String? type,
    String? status,
    int? limit,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/api/hr/reports/requests',
      queryParameters: {
        if (from != null) 'from': from,
        if (to != null) 'to': to,
        if (type != null) 'type': type,
        if (status != null) 'status': status,
        if (limit != null) 'limit': limit,
      },
    );
    return resp.data!;
  }
}
