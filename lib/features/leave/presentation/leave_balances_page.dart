import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/tokens.dart';
import '../leave_providers.dart';
import 'widgets/balance_card.dart';

class LeaveBalancesPage extends ConsumerStatefulWidget {
  const LeaveBalancesPage({super.key});

  @override
  ConsumerState<LeaveBalancesPage> createState() => _LeaveBalancesPageState();
}

class _LeaveBalancesPageState extends ConsumerState<LeaveBalancesPage> {
  // Default to Asia/Saigon current year.
  late int _selectedYear;

  @override
  void initState() {
    super.initState();
    _selectedYear = DateTime.now().year;
  }

  @override
  Widget build(BuildContext context) {
    final balancesAsync = ref.watch(leaveBalancesProvider(_selectedYear));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Số ngày phép'),
        actions: [
          _YearSelector(
            year: _selectedYear,
            onChanged: (y) => setState(() => _selectedYear = y),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async =>
            ref.invalidate(leaveBalancesProvider(_selectedYear)),
        child: balancesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 48),
                const SizedBox(height: 8),
                Text('Không tải được dữ liệu\n$e',
                    textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () =>
                      ref.invalidate(leaveBalancesProvider(_selectedYear)),
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          ),
          data: (balances) {
            if (balances.isEmpty) {
              return const Center(child: Text('Không có dữ liệu ngày phép.'));
            }
            return GridView.builder(
              padding: const EdgeInsets.all(GuHrSpacing.gutter),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: GuHrSpacing.stackLg,
                mainAxisSpacing: GuHrSpacing.stackLg,
                childAspectRatio: 1.1,
              ),
              itemCount: balances.length,
              itemBuilder: (_, i) => BalanceCard(balance: balances[i]),
            );
          },
        ),
      ),
    );
  }
}

class _YearSelector extends StatelessWidget {
  const _YearSelector({required this.year, required this.onChanged});

  final int year;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final current = DateTime.now().year;
    return DropdownButton<int>(
      value: year,
      underline: const SizedBox.shrink(),
      items: [current - 1, current, current + 1]
          .map(
            (y) => DropdownMenuItem(value: y, child: Text('$y')),
          )
          .toList(),
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}
