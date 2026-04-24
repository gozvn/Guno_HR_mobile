import 'package:flutter/material.dart';

/// Horizontal scrolling filter chip bar for request status filtering.
class FilterChipsBar extends StatelessWidget {
  const FilterChipsBar({
    super.key,
    required this.selectedStatus,
    required this.labels,
    required this.filters,
    required this.onSelected,
  });

  final String selectedStatus;
  final List<String> labels;
  final List<String> filters;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: filters.length,
        itemBuilder: (_, i) => FilterChip(
          label: Text(labels[i]),
          selected: selectedStatus == filters[i],
          onSelected: (_) => onSelected(filters[i]),
        ),
      ),
    );
  }
}
