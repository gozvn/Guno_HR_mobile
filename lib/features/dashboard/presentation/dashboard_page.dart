import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/tokens.dart';
import '../../../features/auth/domain/auth_state.dart';
import '../../../features/auth/presentation/auth_notifier.dart';
import '../dashboard_providers.dart';
import 'widgets/greeting_header.dart';
import 'widgets/quick_actions.dart';
import 'widgets/stat_card.dart';
import 'widgets/today_status_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final dashboardAsync = ref.watch(dashboardProvider);

    final user = switch (authState) {
      AuthAuthenticated(:final user) => user,
      _ => null,
    };

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => ref.invalidate(dashboardProvider),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  GuHrSpacing.gutter,
                  GuHrSpacing.gutter,
                  GuHrSpacing.gutter,
                  0,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    if (user != null) GreetingHeader(user: user),
                    const SizedBox(height: GuHrSpacing.gutter),
                    dashboardAsync.when(
                      loading: () => const TodayStatusCardSkeleton(),
                      error: (e, _) => _ErrorCard(message: e.toString()),
                      data: (state) =>
                          TodayStatusCard(attendance: state.todayAttendance),
                    ),
                    const SizedBox(height: GuHrSpacing.stackLg),
                    dashboardAsync.when(
                      loading: () => const Row(
                        children: [
                          StatCardSkeleton(),
                          SizedBox(width: GuHrSpacing.stackLg),
                          StatCardSkeleton(),
                        ],
                      ),
                      error: (_, __) => const SizedBox.shrink(),
                      data: (state) => Row(
                        children: [
                          StatCard(
                            label: 'Đơn chờ duyệt',
                            value:
                                state.requestSummary.pendingRequests.toString(),
                            icon: Icons.inbox_outlined,
                            onTap: () =>
                                context.go('/requests?filter=pending'),
                            valueColor: state.requestSummary.pendingRequests > 0
                                ? Theme.of(context).colorScheme.error
                                : null,
                          ),
                          const SizedBox(width: GuHrSpacing.stackLg),
                          StatCard(
                            label: 'Nghỉ hôm nay',
                            value:
                                state.requestSummary.onLeaveToday.toString(),
                            icon: Icons.beach_access_outlined,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: GuHrSpacing.gutter),
                    QuickActions(
                      onCheckin: () => context.go('/attendance'),
                      onCreateRequest: () =>
                          context.push('/requests/create'),
                      onCalendar: () => context.push('/home/company/calendar'),
                    ),
                    const SizedBox(height: GuHrSpacing.gutter),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(GuHrSpacing.stackLg),
      decoration: BoxDecoration(
        color: cs.errorContainer,
        borderRadius: BorderRadius.circular(GuHrRadii.xl),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: cs.onErrorContainer),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Không tải được dữ liệu. Kéo xuống để thử lại.',
              style: TextStyle(color: cs.onErrorContainer),
            ),
          ),
        ],
      ),
    );
  }
}
