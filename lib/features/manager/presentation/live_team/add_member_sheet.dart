import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/tokens.dart';
import '../../data/dto/live_team_dto.dart';
import '../../manager_providers.dart';

/// Bottom sheet: search employee + select role → POST /live-team/members.
class AddMemberSheet extends ConsumerStatefulWidget {
  const AddMemberSheet({super.key, required this.onAdded});

  final VoidCallback onAdded;

  @override
  ConsumerState<AddMemberSheet> createState() => _AddMemberSheetState();
}

class _AddMemberSheetState extends ConsumerState<AddMemberSheet> {
  final _searchCtrl = TextEditingController();
  Timer? _debounce;
  List<EmployeeSearchDto> _results = [];
  EmployeeSearchDto? _selected;
  String _role = 'editor';
  bool _searching = false;
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _searchCtrl.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String q) {
    _debounce?.cancel();
    if (q.trim().length < 2) {
      setState(() => _results = []);
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      setState(() => _searching = true);
      try {
        final api = ref.read(liveTeamApiProvider);
        final res = await api.searchEmployees(q.trim());
        if (mounted) setState(() => _results = res);
      } catch (_) {
        // silently ignore search errors
      } finally {
        if (mounted) setState(() => _searching = false);
      }
    });
  }

  Future<void> _save() async {
    if (_selected == null) return;
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await ref.read(liveTeamApiProvider).addMember(
            employeeId: _selected!.id,
            role: _role,
          );
      ref.invalidate(liveTeamMembersProvider);
      widget.onAdded();
    } on Exception catch (e) {
      setState(() {
        _error = e.toString().contains('409')
            ? 'Nhân viên đã có trong nhóm'
            : 'Thêm thất bại. Vui lòng thử lại.';
        _saving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(
        left: GuHrSpacing.gutter,
        right: GuHrSpacing.gutter,
        top: GuHrSpacing.gutter,
        bottom: MediaQuery.viewInsetsOf(context).bottom + GuHrSpacing.gutter,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Thêm thành viên', style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: GuHrSpacing.stackLg),
          TextField(
            controller: _searchCtrl,
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Tìm nhân viên...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searching
                  ? const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
                    )
                  : null,
              border: const OutlineInputBorder(),
            ),
          ),
          if (_results.isNotEmpty && _selected == null) ...[
            const SizedBox(height: 4),
            Container(
              constraints: const BoxConstraints(maxHeight: 200),
              decoration: BoxDecoration(
                border: Border.all(color: cs.outline.withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(GuHrRadii.lg),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _results.length,
                itemBuilder: (_, i) {
                  final e = _results[i];
                  return ListTile(
                    dense: true,
                    title: Text(e.fullName),
                    subtitle: e.position != null ? Text(e.position!) : null,
                    onTap: () => setState(() {
                      _selected = e;
                      _searchCtrl.text = e.fullName;
                      _results = [];
                    }),
                  );
                },
              ),
            ),
          ],
          if (_selected != null) ...[
            const SizedBox(height: GuHrSpacing.stackLg),
            Text('Vai trò', style: tt.labelMedium),
            const SizedBox(height: GuHrSpacing.stackSm),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'editor', label: Text('Editor')),
                ButtonSegment(value: 'host', label: Text('Host')),
              ],
              selected: {_role},
              onSelectionChanged: (s) => setState(() => _role = s.first),
            ),
          ],
          if (_error != null) ...[
            const SizedBox(height: GuHrSpacing.stackMd),
            Text(_error!, style: TextStyle(color: cs.error, fontSize: 13)),
          ],
          const SizedBox(height: GuHrSpacing.stackLg),
          FilledButton(
            onPressed: (_selected == null || _saving) ? null : _save,
            child: _saving
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Text('Thêm vào nhóm'),
          ),
        ],
      ),
    );
  }
}
