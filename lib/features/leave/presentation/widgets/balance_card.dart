import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';
import '../../data/dto/leave_balance_dto.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key, required this.balance});

  final LeaveBalanceDto balance;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final remaining = balance.remaining;
    final total = balance.total > 0 ? balance.total : 1;
    final ratio = (balance.used / total).clamp(0.0, 1.0);

    final barColor = remaining <= 0
        ? cs.error
        : remaining < 3
            ? Colors.amber.shade700
            : Colors.green.shade600;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GuHrRadii.xl),
        side: BorderSide(color: cs.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(GuHrSpacing.stackLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(balance.sourceName, style: tt.labelMedium),
            const SizedBox(height: GuHrSpacing.stackMd),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  remaining.toStringAsFixed(remaining % 1 == 0 ? 0 : 1),
                  style: tt.headlineMedium?.copyWith(
                    color: barColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text('ngày còn lại', style: tt.bodySmall),
                ),
              ],
            ),
            const SizedBox(height: GuHrSpacing.stackMd),
            ClipRRect(
              borderRadius: BorderRadius.circular(GuHrRadii.full),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 6,
                backgroundColor: cs.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(barColor),
              ),
            ),
            const SizedBox(height: GuHrSpacing.stackSm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Đã dùng: ${balance.used}', style: tt.bodySmall),
                Text('Tổng: ${balance.total}', style: tt.bodySmall),
              ],
            ),
            if (balance.expired > 0) ...[
              const SizedBox(height: GuHrSpacing.stackSm),
              Text(
                'Đã hết hạn: ${balance.expired}',
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
