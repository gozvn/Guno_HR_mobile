import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/theme/tokens.dart';
import '../../../attendance/attendance_providers.dart';
import '../../requests_providers.dart';

/// Horizontal attachment chips with add/remove buttons.
/// Reads pendingFiles from [CreateRequestNotifier] and delegates mutations.
class AttachmentPickerRow extends ConsumerWidget {
  const AttachmentPickerRow({super.key, required this.pendingFiles});

  final List<File> pendingFiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(createRequestNotifierProvider.notifier);
    final picker = ImagePicker();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Đính kèm ảnh',
                style: Theme.of(context).textTheme.labelLarge),
            const Spacer(),
            if (pendingFiles.length < 5)
              IconButton(
                onPressed: () => _pick(context, ref, picker, notifier),
                icon: const Icon(Icons.add_photo_alternate_outlined),
                tooltip: 'Thêm ảnh',
              ),
          ],
        ),
        if (pendingFiles.isNotEmpty) ...[
          const SizedBox(height: GuHrSpacing.stackMd),
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: pendingFiles.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) => Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(GuHrRadii.lg),
                    child: Image.file(
                      pendingFiles[i],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => notifier.removeFile(i),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: const Icon(Icons.close,
                            size: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _pick(
    BuildContext context,
    WidgetRef ref,
    ImagePicker picker,
    CreateRequestNotifier notifier,
  ) async {
    final picked = await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 90);
    if (picked == null) return;
    final compressor = ref.read(photoCompressorProvider);
    final compressed = await compressor.compressForUpload(File(picked.path));
    notifier.addFile(compressed);
  }
}
