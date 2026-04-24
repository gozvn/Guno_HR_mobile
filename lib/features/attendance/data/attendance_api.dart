import 'package:dio/dio.dart';

import 'dto/attendance_record_dto.dart';
import 'dto/checkin_request_dto.dart';
import 'dto/checkin_response_dto.dart';
import 'dto/monthly_attendance_dto.dart';

/// Thin Dio wrapper for all /api/hr/attendance/* endpoints.
class AttendanceApi {
  AttendanceApi(this._dio);

  final Dio _dio;

  /// GET /api/hr/attendance?employee_id=<id>&date=today
  Future<List<AttendanceRecordDto>> fetchToday(int employeeId) async {
    final resp = await _dio.get<List<dynamic>>(
      '/api/hr/attendance',
      queryParameters: {'employee_id': employeeId, 'date': 'today'},
    );
    return (resp.data ?? [])
        .map((e) => AttendanceRecordDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/hr/attendance/monthly?year=YYYY&month=MM
  Future<MonthlyAttendanceDto> fetchMonthly(int year, int month) async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/api/hr/attendance/monthly',
      queryParameters: {'year': year, 'month': month},
    );
    return MonthlyAttendanceDto.fromJson(resp.data!);
  }

  /// POST /api/hr/attendance/mobile-checkin
  Future<CheckinResponseDto> mobileCheckin(CheckinRequestDto body) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/api/hr/attendance/mobile-checkin',
      data: body.toJson()..removeWhere((_, v) => v == null),
    );
    return CheckinResponseDto.fromJson(resp.data!);
  }

  /// POST /api/hr/attendance/mobile-checkout
  Future<CheckinResponseDto> mobileCheckout(CheckinRequestDto body) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/api/hr/attendance/mobile-checkout',
      data: body.toJson()..removeWhere((_, v) => v == null),
    );
    return CheckinResponseDto.fromJson(resp.data!);
  }

  /// POST /api/hr/attendance/wfh-checkin
  Future<CheckinResponseDto> wfhCheckin(WfhCheckinRequestDto body) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/api/hr/attendance/wfh-checkin',
      data: body.toJson()..removeWhere((_, v) => v == null),
    );
    return CheckinResponseDto.fromJson(resp.data!);
  }

  /// POST /api/hr/attendance/wfh-checkout
  Future<CheckinResponseDto> wfhCheckout(WfhCheckinRequestDto body) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/api/hr/attendance/wfh-checkout',
      data: body.toJson()..removeWhere((_, v) => v == null),
    );
    return CheckinResponseDto.fromJson(resp.data!);
  }
}
