import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/tokens.dart';
import '../../data/dto/request_detail_dto.dart';
import '../../requests_providers.dart';
import '../image_viewer_page.dart';
import 'authenticated_image.dart';
import 'status_chip.dart';

/// Header card showing type icon, name, status chip, and date range.
class RequestDetailHeader extends StatelessWidget {
  const RequestDetailHeader({super.key, required this.detail});

  final RequestDetailDto detail;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
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
            Row(
              children: [
                Text(detail.typeIcon ?? '📋',
                    style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    detail.typeName ?? detail.type,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                StatusChip(status: detail.status),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 16),
                const SizedBox(width: 6),
                Text('${detail.startDate} → ${detail.endDate}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Horizontal scrolling row of attachment thumbnails with tap-to-view.
class AttachmentThumbnailRow extends StatelessWidget {
  const AttachmentThumbnailRow({super.key, required this.urls});

  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: urls.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () => Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (_) => ImageViewerPage(urls: urls, initialIndex: i),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(GuHrRadii.lg),
            child: AuthenticatedImage(url: urls[i], width: 100, height: 100),
          ),
        ),
      ),
    );
  }
}

/// Cancel button that shows a confirm dialog then calls the API.
class CancelRequestButton extends StatelessWidget {
  const CancelRequestButton({
    super.key,
    required this.requestId,
    required this.onCancelled,
  });

  final int requestId;
  final VoidCallback onCancelled;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _confirm(context),
      icon: const Icon(Icons.cancel_outlined),
      label: const Text('Huỷ đơn'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.error,
        side: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
    );
  }

  Future<void> _confirm(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Huỷ đơn'),
        content: const Text('Bạn có chắc muốn huỷ đơn này không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Không'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error),
            child: const Text('Huỷ đơn'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    try {
      final ref = ProviderScope.containerOf(context);
      await ref.read(requestsApiProvider).cancel(requestId);
      onCancelled();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã huỷ đơn thành công')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Huỷ thất bại: $e')));
      }
    }
  }
}
