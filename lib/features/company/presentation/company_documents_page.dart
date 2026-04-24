import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../app/theme/tokens.dart';
import '../../../shared/widgets/skeleton_shimmer.dart';
import '../company_providers.dart';
import 'widgets/doc_node_tile.dart';

class CompanyDocumentsPage extends ConsumerStatefulWidget {
  const CompanyDocumentsPage({super.key});

  @override
  ConsumerState<CompanyDocumentsPage> createState() =>
      _CompanyDocumentsPageState();
}

class _CompanyDocumentsPageState extends ConsumerState<CompanyDocumentsPage> {
  // Track per-file download progress: docId → 0.0..1.0, null = idle.
  final _progress = <int, double?>{};

  Future<void> _downloadAndShare(int id, String filename) async {
    if (_progress[id] != null) return; // already downloading

    setState(() => _progress[id] = 0.0);

    try {
      final api = ref.read(companyApiProvider);
      final file = await api.download(id, filename, (received, total) {
        if (!mounted) return;
        if (total > 0) {
          setState(() => _progress[id] = received / total);
        }
      });

      if (!mounted) return;
      await Share.shareXFiles(
        [XFile(file.path)],
        subject: filename,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Không tải được file: $filename'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _progress.remove(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final treeAsync = ref.watch(companyDocTreeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tài liệu công ty')),
      body: treeAsync.when(
        loading: () => const _DocsSkeleton(),
        error: (e, _) => _ErrorView(
          onRetry: () => ref.invalidate(companyDocTreeProvider),
        ),
        data: (nodes) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(companyDocsProvider);
            ref.invalidate(companyDocTreeProvider);
          },
          child: nodes.isEmpty
              ? const Center(child: Text('Chưa có tài liệu nào'))
              : ListView(
                  children: [
                    for (final node in nodes)
                      Column(
                        children: [
                          DocNodeTile(
                            node: node,
                            onDownload: _downloadAndShare,
                          ),
                          // Show download progress bar under the tile.
                          if (!node.isFolder &&
                              _progress[node.doc.id] != null)
                            LinearProgressIndicator(
                              value: _progress[node.doc.id],
                              minHeight: 2,
                            ),
                        ],
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.cloud_off_outlined, size: 48, color: cs.error),
          const SizedBox(height: 8),
          const Text('Không tải được tài liệu'),
          const SizedBox(height: 8),
          FilledButton(onPressed: onRetry, child: const Text('Thử lại')),
        ],
      ),
    );
  }
}

class _DocsSkeleton extends StatelessWidget {
  const _DocsSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(GuHrSpacing.gutter),
      children: [
        for (int i = 0; i < 8; i++) ...[
          const SkeletonShimmer(height: 48),
          const SizedBox(height: GuHrSpacing.stackMd),
        ],
      ],
    );
  }
}
