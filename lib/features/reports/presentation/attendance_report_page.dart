import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/reports_providers.dart';
import 'widgets/report_error_box.dart';

/// Monthly attendance grid — GET /api/hr/reports/monthly-attendance.
/// MVP shows a compact per-employee roll-up (work_days, late_count, ot_hours).
class AttendanceReportPage extends ConsumerStatefulWidget {
  const AttendanceReportPage({super.key});

  @override
  ConsumerState<AttendanceReportPage> createState() =>
      _AttendanceReportPageState();
}

class _AttendanceReportPageState
    extends ConsumerState<AttendanceReportPage> {
  late String _month;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _month = '${now.year.toString().padLeft(4, '0')}-'
        '${now.month.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(monthlyAttendanceReportProvider(month: _month));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chấm công tháng'),
        actions: [
          TextButton(
            onPressed: _pickMonth,
            child: Text(_month, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ReportErrorBox(
          error: e,
          onRetry: () => ref.invalidate(
            monthlyAttendanceReportProvider(month: _month),
          ),
        ),
        data: (data) {
          final rows = (data['rows'] as List<dynamic>? ?? []);
          if (rows.isEmpty) {
            return const Center(child: Text('Không có dữ liệu.'));
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(
              monthlyAttendanceReportProvider(month: _month),
            ),
            child: ListView.separated(
              itemCount: rows.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) {
                final r = rows[i] as Map<String, dynamic>;
                final totals = (r['totals'] as Map<String, dynamic>? ?? {});
                return ListTile(
                  title: Text(r['full_name']?.toString() ?? '—'),
                  subtitle: Text(
                    'Công: ${totals['work_days'] ?? 0} · '
                    'Trễ: ${totals['late_count'] ?? 0} · '
                    'OT: ${totals['ot_hours'] ?? 0}h',
                  ),
                  trailing: Text(r['emp_code']?.toString() ?? ''),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _pickMonth() async {
    final parts = _month.split('-');
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(int.parse(parts[0]), int.parse(parts[1])),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked == null) return;
    setState(() {
      _month = '${picked.year.toString().padLeft(4, '0')}-'
          '${picked.month.toString().padLeft(2, '0')}';
    });
  }
}
