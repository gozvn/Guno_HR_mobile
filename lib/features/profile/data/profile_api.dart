import 'package:dio/dio.dart';

import 'dto/update_employee_request.dart';

// Handles self-service profile edits via PUT /api/hr/employees/:id.
// id = current user's id from JWT (authNotifier state).
class ProfileApi {
  const ProfileApi(this._dio);

  final Dio _dio;

  Future<void> updateEmployee(int id, UpdateEmployeeRequest req) async {
    await _dio.put(
      '/api/hr/employees/$id',
      data: req.toJson(),
    );
  }
}
