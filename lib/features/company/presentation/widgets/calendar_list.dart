import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';
import '../../data/dto/calendar_entry_dto.dart';

// Renders a grouped list of calendar entries for a given month.
class CalendarList extends StatelessWidget {
  const CalendarList({super.key, required this.entries});

  final List<CalendarEntryDto> entries;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text('Không có ngày đặc biệt trong tháng này'),
        ),
      );
    }

    // Sort by date ascending.
    final sorted = [...entries]..sort((a, b) => a.date.compareTo(b.date));

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: GuHrSpacing.gutter,
        vertical: GuHrSpacing.stackLg,
      ),
      itemCount: sorted.length,
      separatorBuilder: (_, __) =>
          const SizedBox(height: GuHrSpacing.stackSm),
      itemBuilder: (context, i) => _EntryTile(entry: sorted[i]),
    );
  }
}

class _EntryTile extends StatelessWidget {
  const _EntryTile({required this.entry});

  final CalendarEntryDto entry;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    // holiday → error red; working_saturday → tertiary blue; custom → secondary.
    final (color, icon) = switch (entry.type) {
      'holiday' => (cs.error, Icons.beach_access),
      'working_saturday' => (cs.tertiary, Icons.work),
      _ => (cs.secondary, Icons.event),
    };

    final parts = entry.date.split('-');
    final day = parts.length == 3 ? parts[2] : '??';
    final monthYear = parts.length == 3 ? '${parts[1]}/${parts[0]}' : '';

    return Container(
      padding: const EdgeInsets.all(GuHrSpacing.stackLg),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(GuHrRadii.xl),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Row(
        children: [
          // Date badge.
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withAlpha(20),
              borderRadius: BorderRadius.circular(GuHrRadii.lg),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: tt.titleMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  monthYear,
                  style: TextStyle(fontSize: 9, color: color),
                ),
              ],
            ),
          ),
          const SizedBox(width: GuHrSpacing.stackLg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.name, style: tt.bodyMedium),
                if (entry.description != null && entry.description!.isNotEmpty)
                  Text(
                    entry.description!,
                    style: tt.bodySmall
                        ?.copyWith(color: cs.onSurfaceVariant),
                  ),
              ],
            ),
          ),
          Icon(icon, color: color, size: 20),
        ],
      ),
    );
  }
}
