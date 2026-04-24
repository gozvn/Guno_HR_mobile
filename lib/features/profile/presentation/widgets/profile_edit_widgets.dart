import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';

// Reusable widgets used by ProfileEditPage.

// Read-only field with lock icon + tooltip for admin-only fields.
class LockedField extends StatelessWidget {
  const LockedField({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Tooltip(
      message: 'Liên hệ HR để thay đổi',
      child: TextFormField(
        initialValue: value,
        enabled: false,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          suffixIcon: Icon(Icons.lock_outline, color: cs.onSurfaceVariant),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(GuHrRadii.def),
            borderSide: BorderSide(color: cs.outlineVariant),
          ),
        ),
      ),
    );
  }
}

// Red banner shown on save error.
class ProfileEditErrorBanner extends StatelessWidget {
  const ProfileEditErrorBanner({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: GuHrSpacing.stackLg),
      padding: const EdgeInsets.all(GuHrSpacing.stackLg),
      decoration: BoxDecoration(
        color: cs.errorContainer,
        borderRadius: BorderRadius.circular(GuHrRadii.xl),
      ),
      child: Text(message, style: TextStyle(color: cs.onErrorContainer)),
    );
  }
}
