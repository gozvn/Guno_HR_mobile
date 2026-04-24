import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'dto/request_summary_dto.dart';
import 'dto/today_attendance_dto.dart';
import 'dto/today_summary_dto.dart';

// Aggregates 3 endpoints for the dashboard page.
// No single /dashboard endpoint exists per audit — parallel fetch in provider.
class DashboardApi {
  const DashboardApi(this._dio);

  final Dio _dio;

  Future<TodaySummaryDto> todaySummary() async {
    try {
      final res = await _dio.get('/api/hr/attendance/today/summary');
      if (kDebugMode) debugPrint('[DBG todaySummary] ${res.statusCode} data=${res.data}');
      return TodaySummaryDto.fromJson(res.data as Map<String, dynamic>);
    } catch (e, s) {
      if (kDebugMode) debugPrint('[DBG todaySummary FAIL] $e\n$s');
      rethrow;
    }
  }

  Future<RequestSummaryDto> requestSummary() async {
    try {
      final res = await _dio.get('/api/hr/requests/dashboard-summary');
      if (kDebugMode) debugPrint('[DBG requestSummary] ${res.statusCode} data=${res.data}');
      return RequestSummaryDto.fromJson(res.data as Map<String, dynamic>);
    } catch (e, s) {
      if (kDebugMode) debugPrint('[DBG requestSummary FAIL] $e\n$s');
      rethrow;
    }
  }

  // Returns null when no attendance record exists for today (day off / not yet checked in).
  Future<TodayAttendanceDto?> myTodayAttendance(int employeeId) async {
    final today = _todayDate();
    try {
      final res = await _dio.get(
        '/api/hr/attendance',
        queryParameters: {
          'employee_id': employeeId,
          'date': today,
        },
      );
      if (kDebugMode) debugPrint('[DBG myTodayAttendance] ${res.statusCode} data=${res.data}');
      final list = res.data as List<dynamic>;
      if (list.isEmpty) return null;
      return TodayAttendanceDto.fromJson(list.first as Map<String, dynamic>);
    } catch (e, s) {
      if (kDebugMode) debugPrint('[DBG myTodayAttendance FAIL] $e\n$s');
      rethrow;
    }
  }

  String _todayDate() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }
}
