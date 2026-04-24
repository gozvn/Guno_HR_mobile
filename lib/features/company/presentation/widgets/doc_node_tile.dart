import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';
import '../../domain/company_doc_tree.dart';

// Recursive expandable tile for a folder/file node in the doc tree.
// Folders expand in-place; files trigger download callback.
class DocNodeTile extends StatefulWidget {
  const DocNodeTile({
    super.key,
    required this.node,
    required this.onDownload,
    this.depth = 0,
  });

  final DocNode node;
  final void Function(int id, String filename) onDownload;
  final int depth;

  @override
  State<DocNodeTile> createState() => _DocNodeTileState();
}

class _DocNodeTileState extends State<DocNodeTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final node = widget.node;
    final isFolder = node.isFolder;

    final indent = widget.depth * 16.0;
    final icon = isFolder
        ? (_expanded ? Icons.folder_open : Icons.folder)
        : _fileIcon(node.doc.mimeType);
    final iconColor = isFolder ? cs.primary : cs.onSurfaceVariant;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(GuHrRadii.lg),
          onTap: () {
            if (isFolder) {
              setState(() => _expanded = !_expanded);
            } else {
              widget.onDownload(node.doc.id, node.doc.name);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: GuHrSpacing.stackLg + indent,
              right: GuHrSpacing.stackLg,
              top: GuHrSpacing.stackMd,
              bottom: GuHrSpacing.stackMd,
            ),
            child: Row(
              children: [
                Icon(icon, color: iconColor, size: 22),
                const SizedBox(width: GuHrSpacing.stackLg),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(node.doc.name, style: tt.bodyMedium),
                      if (!isFolder && node.doc.fileSize != null)
                        Text(
                          _formatSize(node.doc.fileSize!),
                          style: tt.bodySmall
                              ?.copyWith(color: cs.onSurfaceVariant),
                        ),
                    ],
                  ),
                ),
                if (isFolder)
                  Icon(
                    _expanded
                        ? Icons.expand_less
                        : Icons.chevron_right,
                    color: cs.onSurfaceVariant,
                    size: 18,
                  )
                else
                  Icon(
                    Icons.download_outlined,
                    color: cs.primary,
                    size: 18,
                  ),
              ],
            ),
          ),
        ),
        if (isFolder && _expanded)
          for (final child in node.children)
            DocNodeTile(
              node: child,
              onDownload: widget.onDownload,
              depth: widget.depth + 1,
            ),
      ],
    );
  }

  IconData _fileIcon(String? mime) {
    if (mime == null) return Icons.insert_drive_file_outlined;
    if (mime.contains('pdf')) return Icons.picture_as_pdf_outlined;
    if (mime.contains('image')) return Icons.image_outlined;
    if (mime.contains('word') || mime.contains('document')) {
      return Icons.article_outlined;
    }
    if (mime.contains('sheet') || mime.contains('excel')) {
      return Icons.table_chart_outlined;
    }
    return Icons.insert_drive_file_outlined;
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
