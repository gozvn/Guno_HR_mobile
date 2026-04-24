import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';
import '../../../../features/auth/domain/auth_user.dart';

// Circular avatar + name + emp_code + department displayed at top of profile.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.user});

  final AuthUser user;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    // Reject non-HTTPS avatar URLs for security.
    final safeUrl = (user.avatarUrl != null &&
            user.avatarUrl!.startsWith('https://'))
        ? user.avatarUrl
        : null;

    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: cs.primaryContainer,
          backgroundImage: safeUrl != null ? NetworkImage(safeUrl) : null,
          child: safeUrl == null
              ? Text(
                  user.fullName.isNotEmpty
                      ? user.fullName[0].toUpperCase()
                      : '?',
                  style: tt.displaySmall?.copyWith(
                    color: cs.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
        ),
        const SizedBox(height: GuHrSpacing.stackLg),
        Text(
          user.fullName,
          style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          user.empCode,
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
        if (user.departmentName != null) ...[
          const SizedBox(height: 4),
          Text(
            user.departmentName!,
            style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
        const SizedBox(height: GuHrSpacing.stackLg),
        if (user.workStatus != null) _WorkStatusBadge(status: user.workStatus!),
      ],
    );
  }
}

class _WorkStatusBadge extends StatelessWidget {
  const _WorkStatusBadge({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final (label, color) = switch (status) {
      'active' => ('Đang làm việc', cs.tertiary),
      'probation' => ('Thử việc', cs.secondary),
      'resigned' => ('Đã nghỉ', cs.error),
      'inactive' => ('Không hoạt động', cs.outline),
      'terminated' => ('Đã sa thải', cs.error),
      'maternity' => ('Thai sản', cs.secondary),
      _ => (status, cs.outline),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(GuHrRadii.full),
        border: Border.all(color: color.withAlpha(80)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
