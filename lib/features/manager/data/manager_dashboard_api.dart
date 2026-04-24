import 'package:dio/dio.dart';

import 'dto/manager_dashboard_dto.dart';

/// Thin Dio wrapper for GET /api/hr/dashboard/manager.
class ManagerDashboardApi {
  ManagerDashboardApi(this._dio);

  final Dio _dio;

  Future<ManagerDashboardDto> fetch() async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/api/hr/dashboard/manager',
    );
    return ManagerDashboardDto.fromJson(resp.data!);
  }
}
