import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/tokens.dart';
import '../../data/dto/request_detail_dto.dart';
import '../../requests_providers.dart';
import '../image_viewer_page.dart';
import 'authenticated_image.dart';
import 'status_chip.dart';

/// Header card showing type icon, name, status chip, date range, creator info.
class RequestDetailHeader extends StatelessWidget {
  const RequestDetailHeader({super.key, required this.detail});

  final RequestDetailDto detail;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
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
                Expanded(
                  child: Text(
                    detail.typeName ?? detail.type,
                    style: tt.titleMedium,
                  ),
                ),
                StatusChip(status: detail.status),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: 16, color: cs.onSurfaceVariant),
                const SizedBox(width: 6),
                Text('${detail.startDate} → ${detail.endDate}'),
              ],
            ),
            if (detail.fullName != null || detail.createdAt.isNotEmpty) ...[
              const SizedBox(height: 12),
              Divider(height: 1, color: cs.outlineVariant),
              const SizedBox(height: 12),
              Row(
                children: [
                  _CreatorAvatar(
                    name: detail.fullName,
                    avatarUrl: detail.avatarUrl,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detail.fullName ?? 'Không rõ',
                          style: tt.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        if (detail.departmentName != null)
                          Text(
                            detail.departmentName!,
                            style: tt.bodySmall
                                ?.copyWith(color: cs.onSurfaceVariant),
                          ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.schedule,
                          size: 14, color: cs.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text(
                        _fmtDateTime(detail.createdAt),
                        style: tt.bodySmall
                            ?.copyWith(color: cs.onSurfaceVariant),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _fmtDateTime(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      return '${dt.day.toString().padLeft(2, '0')}/'
          '${dt.month.toString().padLeft(2, '0')}/'
          '${dt.year} '
          '${dt.hour.toString().padLeft(2, '0')}:'
          '${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return iso;
    }
  }
}

class _CreatorAvatar extends StatelessWidget {
  const _CreatorAvatar({required this.name, required this.avatarUrl});

  final String? name;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final initial = (name?.trim().isNotEmpty ?? false)
        ? name!.trim().substring(0, 1).toUpperCase()
        : '?';
    final fallback = CircleAvatar(
      radius: 18,
      backgroundColor: cs.primaryContainer,
      child: Text(initial,
          style: TextStyle(
            color: cs.onPrimaryContainer,
            fontWeight: FontWeight.w600,
          )),
    );
    if (avatarUrl == null || avatarUrl!.isEmpty) return fallback;
    return ClipOval(
      child: AuthenticatedImage(
        url: avatarUrl!,
        width: 36,
        height: 36,
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
