// Immutable domain model — no JSON serialization (DTOs handle that boundary).
// Used by AuthState, AuthNotifier, and downstream feature providers.
class AuthUser {
  const AuthUser({
    required this.id,
    required this.empCode,
    required this.email,
    required this.fullName,
    this.phone,
    this.avatarUrl,
    this.position,
    this.departmentId,
    this.departmentName,
    required this.role,
    this.managedDepartmentId,
    this.gender,
    this.dateOfBirth,
    this.startDate,
    this.contractType,
    this.workStatus,
  });

  final int id;
  final String empCode;
  final String email;
  final String fullName;
  final String? phone;
  final String? avatarUrl;
  final String? position;
  final int? departmentId;
  final String? departmentName;
  final String role;
  // For manager role: the department they oversee (phase-06 role gate).
  final int? managedDepartmentId;
  // Extended fields from /auth/me.
  final String? gender;
  final String? dateOfBirth;
  final String? startDate;
  final String? contractType;
  final String? workStatus;

  bool get isManager =>
      role == 'manager' || role == 'super_admin' || role == 'hr_admin';

  // Returns a copy with updated mutable self-service fields.
  AuthUser copyWithPhone(String? phone) => AuthUser(
        id: id,
        empCode: empCode,
        email: email,
        fullName: fullName,
        phone: phone,
        avatarUrl: avatarUrl,
        position: position,
        departmentId: departmentId,
        departmentName: departmentName,
        role: role,
        managedDepartmentId: managedDepartmentId,
        gender: gender,
        dateOfBirth: dateOfBirth,
        startDate: startDate,
        contractType: contractType,
        workStatus: workStatus,
      );

  @override
  String toString() => 'AuthUser(id=$id, email=$email, role=$role)';
}
