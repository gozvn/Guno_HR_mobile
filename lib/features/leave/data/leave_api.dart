import 'package:dio/dio.dart';

import 'dto/leave_balance_dto.dart';

/// Thin Dio wrapper for /api/hr/leave-balances/* endpoints.
class LeaveApi {
  LeaveApi(this._dio);

  final Dio _dio;

  /// GET /api/hr/leave-balances?year=YYYY
  /// Server auto-filters by JWT — employee sees own balances only.
  Future<List<LeaveBalanceDto>> balances({required int year}) async {
    final resp = await _dio.get<List<dynamic>>(
      '/api/hr/leave-balances',
      queryParameters: {'year': year},
    );
    return (resp.data ?? [])
        .map((e) => LeaveBalanceDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
