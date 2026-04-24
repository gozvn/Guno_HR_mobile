import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/dto/ht_request_dto.dart';
import 'status_chip.dart';

/// Read-only tile for HappyTime-synced requests.
/// Long-press copies summary info to clipboard.
class HtListTile extends StatelessWidget {
  const HtListTile({super.key, required this.item});

  final HtRequestDto item;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return ListTile(
      leading: Text(
        item.typeEmoji ?? '📋',
        style: const TextStyle(fontSize: 24),
      ),
      title: Text(item.typeLabel ?? item.typeCode ?? 'HT Request'),
      subtitle: Text(
        item.date,
        style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
      ),
      trailing:
          item.status != null ? StatusChip(status: item.status!) : null,
      onLongPress: () {
        final info =
            '${item.typeLabel ?? ''} | ${item.date} | ${item.status ?? ''}';
        Clipboard.setData(ClipboardData(text: info));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã sao chép thông tin')),
        );
      },
    );
  }
}
