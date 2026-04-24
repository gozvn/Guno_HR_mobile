import 'package:flutter/material.dart';

import '../../../app/theme/tokens.dart';
import 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(GuHrSpacing.containerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              Text('Đăng nhập', style: tt.displayLarge),
              const SizedBox(height: 8),
              Text(
                'GU HR — Quản lý nhân sự',
                style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              ),
              const SizedBox(height: 40),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
