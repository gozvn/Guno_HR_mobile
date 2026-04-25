import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/dto/live_team_dto.dart';
import '../../manager_providers.dart';
import 'tabs/monthly_summary_tab.dart';
import 'tabs/pending_approval_tab.dart';
import 'tabs/planned_shifts_tab.dart';
import 'tabs/weekly_shifts_tab.dart';

/// Ca Live workspace. Channel chips act as a global filter across all 4 tabs:
/// Lịch tuần · Kế hoạch · Chờ duyệt · Tổng kết. Null channel = "Tất cả".
class LiveShiftsPage extends ConsumerStatefulWidget {
  const LiveShiftsPage({super.key});

  @override
  ConsumerState<LiveShiftsPage> createState() => _LiveShiftsPageState();
}

class _LiveShiftsPageState extends ConsumerState<LiveShiftsPage> {
  String? _channel;

  @override
  Widget build(BuildContext context) {
    final channelsAsync = ref.watch(liveChannelsProvider);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ca Live'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Lịch tuần'),
              Tab(text: 'Kế hoạch'),
              Tab(text: 'Chờ duyệt'),
              Tab(text: 'Tổng kết'),
            ],
          ),
        ),
        body: Column(
          children: [
            _ChannelFilter(
              selected: _channel,
              channelsAsync: channelsAsync,
              onChanged: (c) => setState(() => _channel = c),
            ),
            const Divider(height: 1),
            Expanded(
              child: TabBarView(
                children: [
                  WeeklyShiftsTab(channel: _channel),
                  PlannedShiftsTab(channel: _channel),
                  PendingApprovalTab(channel: _channel),
                  MonthlySummaryTab(channel: _channel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChannelFilter extends StatelessWidget {
  const _ChannelFilter({
    required this.selected,
    required this.channelsAsync,
    required this.onChanged,
  });

  final String? selected;
  final AsyncValue<List<LiveChannelDto>> channelsAsync;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return channelsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (channels) {
        if (channels.isEmpty) return const SizedBox.shrink();
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: const Text('Tất cả'),
                  selected: selected == null,
                  onSelected: (_) => onChanged(null),
                ),
              ),
              for (final ch in channels)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(ch.name),
                    selected: selected == ch.code,
                    onSelected: (_) =>
                        onChanged(selected == ch.code ? null : ch.code),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
