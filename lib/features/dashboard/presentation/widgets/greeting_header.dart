import 'package:flutter/material.dart';

import '../../../../features/auth/domain/auth_user.dart';

// Top section of dashboard: avatar + greeting + role badge.
class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key, required this.user});

  final AuthUser user;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final greeting = _greeting();

    return Row(
      children: [
        _Avatar(avatarUrl: user.avatarUrl, name: user.fullName),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(greeting,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
              const SizedBox(height: 2),
              Text(
                user.fullName,
                style: tt.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (user.position != null) ...[
                const SizedBox(height: 2),
                Text(
                  user.position!,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Chào buổi sáng,';
    if (hour < 18) return 'Chào buổi chiều,';
    return 'Chào buổi tối,';
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.avatarUrl, required this.name});

  final String? avatarUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final initials = name.isNotEmpty ? name[0].toUpperCase() : '?';

    // Reject non-HTTPS avatar URLs for security.
    final safeUrl =
        (avatarUrl != null && avatarUrl!.startsWith('https://')) ? avatarUrl : null;

    return CircleAvatar(
      radius: 26,
      backgroundColor: cs.primaryContainer,
      backgroundImage: safeUrl != null ? NetworkImage(safeUrl) : null,
      child: safeUrl == null
          ? Text(initials,
              style: TextStyle(
                color: cs.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ))
          : null,
    );
  }
}
