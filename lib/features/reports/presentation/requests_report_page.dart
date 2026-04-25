import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/reports_providers.dart';
import 'widgets/report_error_box.dart';

/// Requests report — GET /api/hr/reports/requests.
/// MVP: status filter chips + summary + list.
class RequestsReportPage extends ConsumerStatefulWidget {
  const RequestsReportPage({super.key});

  @override
  ConsumerState<RequestsReportPage> createState() =>
      _RequestsReportPageState();
}

class _RequestsReportPageState
    extends ConsumerState<RequestsReportPage> {
  String? _status;

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(requestsReportProvider(status: _status));
    return Scaffold(
      appBar: AppBar(title: const Text('Báo cáo đơn từ')),
      body: Column(
        children: [
          _FilterBar(
            selected: _status,
            onSelected: (v) => setState(() => _status = v),
          ),
          Expanded(
            child: async.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => ReportErrorBox(
                error: e,
                onRetry: () => ref
                    .invalidate(requestsReportProvider(status: _status)),
              ),
              data: (data) => _ResultBody(
                data: data,
                onRefresh: () async => ref
                    .invalidate(requestsReportProvider(status: _status)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({required this.selected, required this.onSelected});

  final String? selected;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    const filters = <(String?, String)>[
      (null, 'Tất cả'),
      ('pending', 'Chờ duyệt'),
      ('approved', 'Đã duyệt'),
      ('rejected', 'Từ chối'),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          for (final (value, label) in filters)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(label),
                selected: selected == value,
                onSelected: (_) => onSelected(value),
              ),
            ),
        ],
      ),
    );
  }
}

class _ResultBody extends StatelessWidget {
  const _ResultBody({required this.data, required this.onRefresh});

  final Map<String, dynamic> data;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final total = data['total'] ?? 0;
    final byStatus = (data['by_status'] as Map<String, dynamic>? ?? {});
    final rows = (data['rows'] as List<dynamic>? ?? []);
    if (rows.isEmpty) {
      return const Center(child: Text('Không có đơn nào.'));
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        itemCount: rows.length + 1,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (_, i) {
          if (i == 0) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Tổng: $total · '
                'Chờ ${byStatus['pending'] ?? 0} · '
                'Duyệt ${byStatus['approved'] ?? 0} · '
                'Từ chối ${byStatus['rejected'] ?? 0}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          final r = rows[i - 1] as Map<String, dynamic>;
          return ListTile(
            title: Text(
              '${r['full_name'] ?? '—'} · ${r['type'] ?? ''}',
            ),
            subtitle: Text(
              '${r['start_date'] ?? ''} → ${r['end_date'] ?? ''}',
            ),
            trailing: Text(r['status']?.toString() ?? ''),
          );
        },
      ),
    );
  }
}
