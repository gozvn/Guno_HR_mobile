import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_employee_request.freezed.dart';
part 'update_employee_request.g.dart';

// PUT /api/hr/employees/:id — self-editable fields only (R1).
// Admin-only fields (position, department_id, role, etc.) are excluded here.
@freezed
class UpdateEmployeeRequest with _$UpdateEmployeeRequest {
  const factory UpdateEmployeeRequest({
    String? phone,
  }) = _UpdateEmployeeRequest;

  factory UpdateEmployeeRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmployeeRequestFromJson(json);
}
