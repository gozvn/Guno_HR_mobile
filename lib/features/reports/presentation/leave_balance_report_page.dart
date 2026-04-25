import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/reports_providers.dart';
import 'widgets/report_error_box.dart';

/// Annual leave balance — GET /api/hr/reports/leave-balance.
class LeaveBalanceReportPage extends ConsumerStatefulWidget {
  const LeaveBalanceReportPage({super.key});

  @override
  ConsumerState<LeaveBalanceReportPage> createState() =>
      _LeaveBalanceReportPageState();
}

class _LeaveBalanceReportPageState
    extends ConsumerState<LeaveBalanceReportPage> {
  late int _year;

  @override
  void initState() {
    super.initState();
    _year = DateTime.now().year;
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(leaveBalanceReportProvider(year: _year));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Báo cáo phép năm'),
        actions: [
          DropdownButton<int>(
            value: _year,
            underline: const SizedBox.shrink(),
            items: [
              for (var y = DateTime.now().year; y >= 2024; y--)
                DropdownMenuItem(value: y, child: Text('$y')),
            ],
            onChanged: (v) {
              if (v != null) setState(() => _year = v);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ReportErrorBox(
          error: e,
          onRetry: () =>
              ref.invalidate(leaveBalanceReportProvider(year: _year)),
        ),
        data: (data) {
          final rows = (data['rows'] as List<dynamic>? ?? []);
          if (rows.isEmpty) {
            return const Center(child: Text('Không có dữ liệu.'));
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(
              leaveBalanceReportProvider(year: _year),
            ),
            child: ListView.separated(
              itemCount: rows.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) {
                final r = rows[i] as Map<String, dynamic>;
                final remaining = r['remaining'] ?? 0;
                final used = r['used_this_year'] ?? 0;
                final total = r['annual_total'] ?? 0;
                return ListTile(
                  title: Text(r['full_name']?.toString() ?? '—'),
                  subtitle: Text(r['dept_name']?.toString() ?? ''),
                  trailing: Text(
                    '$remaining / $total\ndùng $used',
                    textAlign: TextAlign.right,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
