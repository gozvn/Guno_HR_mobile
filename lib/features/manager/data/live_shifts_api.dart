import 'package:dio/dio.dart';

import 'dto/live_shift_dto.dart';

/// Thin Dio wrapper for /api/hr/live-shifts/* endpoints.
class LiveShiftsApi {
  LiveShiftsApi(this._dio);

  final Dio _dio;

  /// GET /api/hr/live-shifts with optional filters.
  Future<List<LiveShiftDto>> list({
    String? date,
    String? channel,
    String? status,
    int? employeeId,
    String? from,
    String? to,
  }) async {
    final resp = await _dio.get<List<dynamic>>(
      '/api/hr/live-shifts',
      queryParameters: {
        if (date != null) 'date': date,
        if (channel != null) 'channel': channel,
        if (status != null) 'status': status,
        if (employeeId != null) 'employee_id': employeeId,
        if (from != null) 'from': from,
        if (to != null) 'to': to,
      },
    );
    return (resp.data ?? [])
        .map((e) => LiveShiftDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/hr/live-shifts/weekly — grid data for a Monday-starting week.
  /// Returns `{ week_start, week_end, shifts: [...], members: [...] }`.
  Future<Map<String, dynamic>> weekly({
    required String weekStart,
    String? channel,
  }) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/api/hr/live-shifts/weekly',
      queryParameters: {
        'week_start': weekStart,
        if (channel != null) 'channel': channel,
      },
    );
    return resp.data!;
  }

  /// GET /api/hr/live-shifts/monthly-summary — aggregated per employee.
  Future<List<Map<String, dynamic>>> monthlySummary({
    required String month,
    String? channel,
  }) async {
    final resp = await _dio.get<List<dynamic>>(
      '/api/hr/live-shifts/monthly-summary',
      queryParameters: {
        'month': month,
        if (channel != null) 'channel': channel,
      },
    );
    return (resp.data ?? []).cast<Map<String, dynamic>>();
  }

  /// POST /api/hr/live-shifts/:id/approve
  Future<void> approve(int id) async {
    await _dio.post<void>('/api/hr/live-shifts/$id/approve');
  }

  /// POST /api/hr/live-shifts/:id/reject — body {reason}
  Future<void> reject(int id, String reason) async {
    await _dio.post<void>(
      '/api/hr/live-shifts/$id/reject',
      data: {'reason': reason},
    );
  }

  /// DELETE /api/hr/live-shifts/:id — cascades to check-in records.
  Future<void> delete(int id) async {
    await _dio.delete<void>('/api/hr/live-shifts/$id');
  }
}
