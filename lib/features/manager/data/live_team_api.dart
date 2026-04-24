import 'package:dio/dio.dart';

import 'dto/live_team_dto.dart';

/// Thin Dio wrapper for /api/hr/live-team/* endpoints.
class LiveTeamApi {
  LiveTeamApi(this._dio);

  final Dio _dio;

  /// GET /api/hr/live-team/members
  Future<List<LiveTeamMemberDto>> listMembers() async {
    final resp = await _dio.get<List<dynamic>>('/api/hr/live-team/members');
    return (resp.data ?? [])
        .map((e) => LiveTeamMemberDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/hr/live-team/members — body {employee_id, role}
  Future<LiveTeamMemberDto> addMember({
    required int employeeId,
    required String role,
  }) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/api/hr/live-team/members',
      data: {'employee_id': employeeId, 'role': role},
    );
    return LiveTeamMemberDto.fromJson(resp.data!);
  }

  /// PUT /api/hr/live-team/members/:id — body {role}
  Future<LiveTeamMemberDto> updateMember(int id, String role) async {
    final resp = await _dio.put<Map<String, dynamic>>(
      '/api/hr/live-team/members/$id',
      data: {'role': role},
    );
    return LiveTeamMemberDto.fromJson(resp.data!);
  }

  /// DELETE /api/hr/live-team/members/:id
  Future<void> removeMember(int id) async {
    await _dio.delete<void>('/api/hr/live-team/members/$id');
  }

  /// GET /api/hr/live-team/channels — facebook/tiktok etc.
  Future<List<LiveChannelDto>> listChannels() async {
    final resp = await _dio.get<List<dynamic>>('/api/hr/live-team/channels');
    return (resp.data ?? [])
        .map((e) => LiveChannelDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/hr/employees?search= — employee picker for AddMemberSheet.
  Future<List<EmployeeSearchDto>> searchEmployees(String query) async {
    final resp = await _dio.get<List<dynamic>>(
      '/api/hr/employees',
      queryParameters: {'search': query, 'limit': 20},
    );
    return (resp.data ?? [])
        .map((e) => EmployeeSearchDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
