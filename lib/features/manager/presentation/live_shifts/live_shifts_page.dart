import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/tokens.dart';
import '../../data/dto/live_team_dto.dart';
import '../../manager_providers.dart';
import '../widgets/empty_state.dart';
import 'shift_list_tile.dart';

class LiveShiftsPage extends ConsumerStatefulWidget {
  const LiveShiftsPage({super.key});

  @override
  ConsumerState<LiveShiftsPage> createState() => _LiveShiftsPageState();
}

class _LiveShiftsPageState extends ConsumerState<LiveShiftsPage> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedChannel;

  String get _dateStr =>
      '${_selectedDate.year}-'
      '${_selectedDate.month.toString().padLeft(2, '0')}-'
      '${_selectedDate.day.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final shiftsAsync = ref.watch(
      liveShiftsProvider(date: _dateStr, channel: _selectedChannel),
    );
    final channelsAsync = ref.watch(liveChannelsProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Ca Live')),
      body: Column(
        children: [
          _ShiftHeader(
            selectedDate: _selectedDate,
            selectedChannel: _selectedChannel,
            channelsAsync: channelsAsync,
            onDateChanged: (d) => setState(() => _selectedDate = d),
            onChannelChanged: (c) => setState(() => _selectedChannel = c),
          ),
          const Divider(height: 1),
          Expanded(
            child: shiftsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Lỗi tải ca live', style: TextStyle(color: cs.error)),
                    const SizedBox(height: 8),
                    FilledButton(
                      onPressed: () => ref.invalidate(liveShiftsProvider),
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              ),
              data: (shifts) {
                if (shifts.isEmpty) {
                  return const EmptyState(
                    icon: Icons.live_tv_outlined,
                    message: 'Không có ca live trong ngày này',
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async => ref.invalidate(liveShiftsProvider),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GuHrSpacing.gutter,
                      vertical: GuHrSpacing.stackMd,
                    ),
                    itemCount: shifts.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, i) => ShiftListTile(shift: shifts[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Date picker + channel filter header

class _ShiftHeader extends StatelessWidget {
  const _ShiftHeader({
    required this.selectedDate,
    required this.selectedChannel,
    required this.channelsAsync,
    required this.onDateChanged,
    required this.onChannelChanged,
  });

  final DateTime selectedDate;
  final String? selectedChannel;
  final AsyncValue<List<LiveChannelDto>> channelsAsync;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<String?> onChannelChanged;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final dayLabel =
        '${selectedDate.day.toString().padLeft(2, '0')}/'
        '${selectedDate.month.toString().padLeft(2, '0')}/'
        '${selectedDate.year}';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: GuHrSpacing.gutter,
        vertical: GuHrSpacing.stackMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () =>
                    onDateChanged(selectedDate.subtract(const Duration(days: 1))),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2024),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    );
                    if (picked != null) onDateChanged(picked);
                  },
                  child: Center(
                    child: Text(
                      dayLabel,
                      style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () =>
                    onDateChanged(selectedDate.add(const Duration(days: 1))),
              ),
            ],
          ),
          channelsAsync.when(
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
            data: (channels) {
              if (channels.isEmpty) return const SizedBox.shrink();
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: const Text('Tất cả'),
                        selected: selectedChannel == null,
                        onSelected: (_) => onChannelChanged(null),
                      ),
                    ),
                    ...channels.map((ch) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(ch.name),
                            selected: selectedChannel == ch.code,
                            onSelected: (_) => onChannelChanged(
                              selectedChannel == ch.code ? null : ch.code,
                            ),
                          ),
                        )),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
