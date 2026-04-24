/// Sealed class representing a resolved navigation destination from a push
/// notification. Each variant exposes a [path] compatible with GoRouter.
sealed class DeepLinkIntent {
  const DeepLinkIntent();

  String get path;

  // ── Factory constructors ─────────────────────────────────────────────────

  const factory DeepLinkIntent.home() = _Home;
  const factory DeepLinkIntent.requestDetail(int id) = _RequestDetail;
  const factory DeepLinkIntent.approvals([int? focusId]) = _Approvals;
  const factory DeepLinkIntent.leaveBalance() = _LeaveBalance;
  const factory DeepLinkIntent.attendanceCheckin() = _AttendanceCheckin;
  const factory DeepLinkIntent.managerDashboard() = _ManagerDashboard;
}

// ── Private implementations ──────────────────────────────────────────────────

final class _Home extends DeepLinkIntent {
  const _Home();
  @override
  String get path => '/home';
}

final class _RequestDetail extends DeepLinkIntent {
  const _RequestDetail(this.id);
  final int id;
  @override
  String get path => '/requests/$id';
}

final class _Approvals extends DeepLinkIntent {
  const _Approvals([this.focusId]);
  final int? focusId;
  @override
  String get path =>
      '/manager/approvals${focusId != null ? '?focus=$focusId' : ''}';
}

final class _LeaveBalance extends DeepLinkIntent {
  const _LeaveBalance();
  @override
  String get path => '/home/leave';
}

final class _AttendanceCheckin extends DeepLinkIntent {
  const _AttendanceCheckin();
  @override
  String get path => '/attendance/check-in';
}

final class _ManagerDashboard extends DeepLinkIntent {
  const _ManagerDashboard();
  @override
  String get path => '/manager';
}
