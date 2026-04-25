import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/tokens.dart';
import '../../data/dto/request_type_dto.dart';
import '../../requests_providers.dart';

class TypePickerStep extends ConsumerWidget {
  const TypePickerStep({super.key, required this.onSelected});

  final ValueChanged<RequestTypeDto> onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typesAsync = ref.watch(requestTypesProvider);

    return typesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Không tải được loại đơn: $e')),
      data: (types) {
        if (types.isEmpty) {
          return const Center(child: Text('Không có loại đơn nào.'));
        }
        return GridView.builder(
          padding: const EdgeInsets.all(GuHrSpacing.gutter),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: GuHrSpacing.stackLg,
            mainAxisSpacing: GuHrSpacing.stackLg,
            childAspectRatio: 0.9,
          ),
          itemCount: types.length,
          itemBuilder: (_, i) => _TypeCard(
            type: types[i],
            onTap: () => onSelected(types[i]),
          ),
        );
      },
    );
  }
}

class _TypeCard extends StatelessWidget {
  const _TypeCard({required this.type, required this.onTap});

  final RequestTypeDto type;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    // Parse hex color, fallback to primary container.
    Color bgColor;
    try {
      final hex = type.color.replaceFirst('#', '');
      bgColor = Color(int.parse('FF$hex', radix: 16)).withValues(alpha: 0.15);
    } catch (_) {
      bgColor = cs.primaryContainer;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(GuHrRadii.xl),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(GuHrRadii.xl),
          border: Border.all(color: cs.outlineVariant),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _iconForType(type),
              size: 32,
              color: cs.onSurface,
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                type.nameVi,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Map known type codes to Material icons. Keeps visuals consistent when
// backend ships emojis that don't render (or ships nothing) and ensures
// every card has a glyph. Codes mirror backend seed in hr-schema-init.ts.
IconData _iconForType(RequestTypeDto t) {
  switch (t.code) {
    case 'late_arrival':
      return Icons.schedule;
    case 'early_leave':
      return Icons.directions_run;
    case 'leave_unpaid':
      return Icons.money_off;
    case 'leave_annual':
      return Icons.beach_access;
    case 'ot':
      return Icons.bolt;
    case 'wfh':
      return Icons.home_work_outlined;
    case 'forgot_checkin':
      return Icons.restore;
    case 'correction':
      return Icons.edit_note;
    default:
      return Icons.description_outlined;
  }
}
