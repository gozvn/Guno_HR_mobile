import 'package:flutter/material.dart';

import '../../data/dto/request_dto.dart';
import 'status_chip.dart';

// Mirrors backend seed in `hr-schema-init.ts` (8 GUNO request types).
IconData _iconForRequestType(String code) {
  switch (code) {
    case 'late_arrival':
      return Icons.schedule;
    case 'early_leave':
      return Icons.directions_run;
    case 'leave_unpaid':
      return Icons.money_off;
    case 'leave_annual':
    case 'leave_sick':
    case 'leave_maternity':
      return Icons.beach_access;
    case 'ot':
      return Icons.bolt;
    case 'wfh':
    case 'business_trip':
      return Icons.home_work_outlined;
    case 'forgot_checkin':
      return Icons.restore;
    case 'correction':
      return Icons.edit_note;
    default:
      return Icons.description_outlined;
  }
}

class RequestListTile extends StatelessWidget {
  const RequestListTile({
    super.key,
    required this.request,
    required this.onTap,
  });

  final RequestDto request;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Type icon badge — Material icon keyed by request.type for
            // consistent rendering. Emoji fallbacks (⏰/🏖/etc.) can drop to
            // monochrome on some iOS font fallbacks.
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _iconForRequestType(request.type),
                size: 24,
                color: cs.onSurface,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    request.typeName ?? request.type,
                    style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${request.startDate} → ${request.endDate}',
                    style: tt.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            StatusChip(status: request.status),
          ],
        ),
      ),
    );
  }
}
