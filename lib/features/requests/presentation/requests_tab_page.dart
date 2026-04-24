import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../data/dto/request_dto.dart';
import '../requests_providers.dart';
import 'widgets/filter_chips_bar.dart';
import 'widgets/ht_list_tile.dart';
import 'widgets/request_list_tile.dart';

class RequestsTabPage extends ConsumerStatefulWidget {
  const RequestsTabPage({super.key, this.initialFilter});

  final String? initialFilter;

  @override
  ConsumerState<RequestsTabPage> createState() => _RequestsTabPageState();
}

class _RequestsTabPageState extends ConsumerState<RequestsTabPage> {
  static const _filters = ['', 'pending', 'approved', 'rejected', 'cancelled'];
  static const _labels = [
    'Tất cả', 'Chờ duyệt', 'Đã duyệt', 'Từ chối', 'Đã huỷ'
  ];

  late String _status;
  String? _month;
  int _segment = 0;
  final _scrollCtrl = ScrollController();

  final _items = <RequestDto>[];
  int _total = 0;
  int _offset = 0;
  bool _loading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _status = widget.initialFilter ?? '';
    _scrollCtrl.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadPage());
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollCtrl.position.pixels >=
        _scrollCtrl.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  Future<void> _loadPage() async {
    if (_loading) return;
    setState(() { _loading = true; _items.clear(); _offset = 0; _hasMore = true; });
    await _fetch();
  }

  Future<void> _loadMore() async {
    if (_loading || !_hasMore) return;
    setState(() => _loading = true);
    await _fetch();
  }

  Future<void> _fetch() async {
    try {
      final result = await ref.read(requestsApiProvider).list(
        status: _status.isEmpty ? null : _status,
        month: _month,
        limit: 20,
        offset: _offset,
      );
      setState(() {
        _items.addAll(result.items);
        _total = result.total;
        _offset += result.items.length;
        _hasMore = _items.length < _total;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Lỗi: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn từ'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(value: 0, label: Text('Đơn của tôi')),
                  ButtonSegment(value: 1, label: Text('HappyTime')),
                ],
                selected: {_segment},
                onSelectionChanged: (s) => setState(() => _segment = s.first),
              ),
            ),
            if (_segment == 0)
              FilterChipsBar(
                selectedStatus: _status,
                labels: _labels,
                filters: _filters,
                onSelected: (f) { setState(() => _status = f); _loadPage(); },
              ),
          ]),
        ),
      ),
      body: _segment == 0 ? _buildMyList() : _buildHtList(),
      floatingActionButton: _segment == 0
          ? FloatingActionButton(
              onPressed: () => context.push('/requests/create'),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildMyList() {
    if (_items.isEmpty && _loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_items.isEmpty) {
      return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.inbox_outlined, size: 56),
          const SizedBox(height: 8),
          const Text('Không có đơn nào.'),
          const SizedBox(height: 16),
          FilledButton(onPressed: _loadPage, child: const Text('Tải lại')),
        ]),
      );
    }
    return RefreshIndicator(
      onRefresh: _loadPage,
      child: ListView.separated(
        controller: _scrollCtrl,
        itemCount: _items.length + (_hasMore ? 1 : 0),
        separatorBuilder: (_, __) => Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outlineVariant),
        itemBuilder: (_, i) {
          if (i == _items.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return RequestListTile(
            request: _items[i],
            onTap: () => context.push('/requests/${_items[i].id}'),
          );
        },
      ),
    );
  }

  Widget _buildHtList() {
    final htAsync = ref.watch(htRequestsProvider(_month));
    return htAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (items) => items.isEmpty
          ? const Center(child: Text('Không có dữ liệu HappyTime.'))
          : ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) => HtListTile(item: items[i]),
            ),
    );
  }
}
