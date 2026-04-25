import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/domain/auth_state.dart';
import '../features/auth/presentation/auth_notifier.dart';
import '../features/auth/presentation/change_password_page.dart';
import '../features/auth/presentation/login_page.dart';
import '../features/attendance/presentation/attendance_tab_page.dart';
import '../features/attendance/presentation/check_in_flow/check_in_flow_page.dart';
import '../features/attendance/presentation/monthly_view/monthly_calendar_page.dart';
import '../features/company/presentation/company_calendar_page.dart';
import '../features/company/presentation/company_documents_page.dart';
import '../features/dashboard/presentation/dashboard_page.dart';
import '../features/home/tab_shell_screen.dart';
import '../features/leave/presentation/leave_balances_page.dart';
import '../features/manager/presentation/approvals_inbox_page.dart';
import '../features/manager/presentation/live_shifts/live_shifts_page.dart';
import '../features/manager/presentation/live_team/live_team_page.dart';
import '../features/profile/presentation/profile_edit_page.dart';
import '../features/profile/presentation/profile_page.dart';
import '../features/reports/presentation/attendance_report_page.dart';
import '../features/reports/presentation/leave_balance_report_page.dart';
import '../features/reports/presentation/reports_page.dart';
import '../features/reports/presentation/requests_report_page.dart';
import '../features/requests/presentation/create_request/create_request_page.dart';
import '../features/requests/presentation/request_detail_page.dart';
import '../features/requests/presentation/requests_tab_page.dart';
import '../features/settings/presentation/settings_page.dart';
import '../features/splash/splash_screen.dart';

part 'router.g.dart';

// Route name constants — use these for context.goNamed() to avoid typos.
abstract final class Routes {
  static const splash = 'splash';
  static const login = 'login';
  static const changePassword = 'change-password';
  static const home = 'home';
  static const attendance = 'attendance';
  static const requests = 'requests';
  static const requestCreate = 'request-create';
  static const requestDetail = 'request-detail';
  static const profile = 'profile';
  static const profileEdit = 'profile-edit';
  static const companyCalendar = 'company-calendar';
  static const attendanceCheckIn = 'attendance-check-in';
  static const attendanceMonthly = 'attendance-monthly';
  // Promoted top-level routes (were nested under /home or /manager)
  static const leave = 'leave';
  static const docs = 'docs';
  static const liveShifts = 'live-shifts';
  static const settings = 'settings';
  // Reports branch (replaces manager branch)
  static const reports = 'reports';
  static const reportsApprovals = 'reports-approvals';
  static const reportsLiveTeam = 'reports-live-team';
  static const reportsAttendance = 'reports-attendance';
  static const reportsLeaveBalance = 'reports-leave-balance';
  static const reportsRequests = 'reports-requests';
}

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: _AuthStateListenable(ref),
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);
      final location = state.matchedLocation;

      // Still loading — stay on splash.
      if (authState is AuthLoading) {
        return location == '/' ? null : '/';
      }

      if (authState is AuthForceChangePassword) {
        // Must change password — only allow the change-password route.
        if (location == '/change-password') return null;
        return '/change-password?force=true';
      }

      if (authState is AuthAuthenticated) {
        // Deprecation redirects — keep for ≥1 release so push payloads and
        // saved shortcuts pointing at old nested paths don't 404.
        final deprecated = _deprecationRedirect(location);
        if (deprecated != null) return deprecated;
        // Authenticated — redirect away from auth screens.
        if (location == '/' || location == '/login') return '/home';
        return null;
      }

      // Unauthenticated — only allow login.
      if (location == '/login') return null;
      return '/login';
    },
    routes: [
      GoRoute(
        path: '/',
        name: Routes.splash,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: Routes.login,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: '/change-password',
        name: Routes.changePassword,
        builder: (_, state) {
          final force = state.uri.queryParameters['force'] == 'true';
          return ChangePasswordPage(isForced: force);
        },
      ),
      // Tab shell — StatefulShellRoute.indexedStack preserves state per branch.
      // Sub-routes pushed inside a branch keep the bottom NavigationBar visible.
      // Branch order: 0=home, 1=attendance, 2=requests, 3=reports, 4=profile,
      // 5=leave, 6=docs, 7=live-shifts, 8=settings.
      //
      // Branches 5-8 are "hidden" — they render inside the shell so the
      // bottom NavigationBar stays visible, but TabShellScreen never lists
      // them as destinations. Navigation goes through More sheet.
      StatefulShellRoute.indexedStack(
        builder: (_, __, shell) => TabShellScreen(navigationShell: shell),
        branches: [
          // Branch 0 — Home / Dashboard + company calendar (doc+leave promoted out).
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: Routes.home,
                builder: (_, __) => const DashboardPage(),
                routes: [
                  GoRoute(
                    path: 'company/calendar',
                    name: Routes.companyCalendar,
                    builder: (_, __) => const CompanyCalendarPage(),
                  ),
                ],
              ),
            ],
          ),
          // Branch 1 — Attendance tab + check-in wizard + monthly calendar.
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/attendance',
                name: Routes.attendance,
                builder: (_, __) => const AttendanceTabPage(),
                routes: [
                  GoRoute(
                    path: 'check-in',
                    name: Routes.attendanceCheckIn,
                    builder: (_, state) {
                      final type =
                          state.uri.queryParameters['type'] ?? 'checkin';
                      return CheckInFlowPage(type: type);
                    },
                  ),
                  GoRoute(
                    path: 'monthly',
                    name: Routes.attendanceMonthly,
                    builder: (_, __) => const MonthlyCalendarPage(),
                  ),
                ],
              ),
            ],
          ),
          // Branch 2 — Requests tab + create + detail.
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/requests',
                name: Routes.requests,
                builder: (_, state) {
                  final filter = state.uri.queryParameters['filter'];
                  return RequestsTabPage(initialFilter: filter);
                },
                routes: [
                  GoRoute(
                    path: 'create',
                    name: Routes.requestCreate,
                    builder: (_, state) {
                      final type = state.uri.queryParameters['type'];
                      return CreateRequestPage(initialTypeCode: type);
                    },
                  ),
                  GoRoute(
                    path: ':id',
                    name: Routes.requestDetail,
                    builder: (_, state) {
                      final id = int.parse(state.pathParameters['id']!);
                      return RequestDetailPage(requestId: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          // Branch 3 — Reports (manager-only surface; visibility enforced in
          // TabShellScreen). Approvals + live-team grouped under /reports.
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/reports',
                name: Routes.reports,
                builder: (_, __) => const ReportsPage(),
                routes: [
                  GoRoute(
                    path: 'approvals',
                    name: Routes.reportsApprovals,
                    builder: (_, __) => const ApprovalsInboxPage(),
                  ),
                  GoRoute(
                    path: 'live-team',
                    name: Routes.reportsLiveTeam,
                    builder: (_, __) => const LiveTeamPage(),
                  ),
                  GoRoute(
                    path: 'attendance',
                    name: Routes.reportsAttendance,
                    builder: (_, __) => const AttendanceReportPage(),
                  ),
                  GoRoute(
                    path: 'leave-balance',
                    name: Routes.reportsLeaveBalance,
                    builder: (_, __) => const LeaveBalanceReportPage(),
                  ),
                  GoRoute(
                    path: 'requests',
                    name: Routes.reportsRequests,
                    builder: (_, __) => const RequestsReportPage(),
                  ),
                ],
              ),
            ],
          ),
          // Branch 4 — Profile + edit.
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: Routes.profile,
                builder: (_, __) => const ProfilePage(),
                routes: [
                  GoRoute(
                    path: 'edit',
                    name: Routes.profileEdit,
                    builder: (_, __) => const ProfileEditPage(),
                  ),
                ],
              ),
            ],
          ),
          // Branch 5 — Leave balances (hidden from NavigationBar, reachable
          // via More sheet). Kept inside shell so bottom bar persists.
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/leave',
                name: Routes.leave,
                builder: (_, __) => const LeaveBalancesPage(),
              ),
            ],
          ),
          // Branch 6 — Company docs (hidden).
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/docs',
                name: Routes.docs,
                builder: (_, __) => const CompanyDocumentsPage(),
              ),
            ],
          ),
          // Branch 7 — Live shifts (hidden, shown in More for live-team + managers).
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/live-shifts',
                name: Routes.liveShifts,
                builder: (_, __) => const LiveShiftsPage(),
              ),
            ],
          ),
          // Branch 8 — Settings (hidden).
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: Routes.settings,
                builder: (_, __) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Maps retired nested paths to their new top-level equivalents so external
/// deep links (push payloads, notification actions, saved shortcuts) keep
/// working for one release after the refactor.
String? _deprecationRedirect(String location) {
  if (location == '/home/leave') return '/leave';
  if (location.startsWith('/home/company/docs')) return '/docs';
  if (location.startsWith('/manager/live-shifts')) return '/live-shifts';
  if (location == '/manager') return '/reports';
  if (location.startsWith('/manager/approvals')) return '/reports/approvals';
  if (location.startsWith('/manager/live-team')) return '/reports/live-team';
  return null;
}

/// Bridges Riverpod auth state changes to GoRouter's ChangeNotifier interface.
class _AuthStateListenable extends ChangeNotifier {
  _AuthStateListenable(Ref ref) {
    ref.listen(authNotifierProvider, (_, __) => notifyListeners());
  }
}
