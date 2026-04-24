import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/tokens.dart';
import '../../../../core/errors/app_failure.dart';
import '../../domain/auth_state.dart';
import '../auth_notifier.dart';
import 'password_field.dart';

// Email + password form wired to AuthNotifier. Inline error display uses
// verbatim Vietnamese messages from the API.
class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _loading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    await ref.read(authNotifierProvider.notifier).login(
          _emailCtrl.text.trim(),
          _passwordCtrl.text.isEmpty ? null : _passwordCtrl.text,
        );

    if (!mounted) return;

    // Error surface: read failure from state after login resolves.
    final authState = ref.read(authNotifierProvider);
    if (authState is AuthUnauthenticated) {
      setState(() {
        _loading = false;
        _errorMessage = _resolveMessage(authState.failure);
      });
    } else {
      setState(() => _loading = false);
    }
  }

  String? _resolveMessage(AppFailure? failure) {
    if (failure == null) return null;
    return failure.when(
      unauthorized: () => 'Email hoặc mật khẩu không đúng',
      forbidden: (req) => req ?? 'Tài khoản chưa được kích hoạt',
      validation: (msg) => msg,
      network: (msg) => msg,
      server: (_, msg) => msg ?? 'Lỗi máy chủ',
      unknown: (_) => 'Đã xảy ra lỗi. Vui lòng thử lại.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return AutofillGroup(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Vui lòng nhập email';
                final emailRe = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                if (!emailRe.hasMatch(v.trim())) {
                  return 'Email không hợp lệ';
                }
                return null;
              },
            ),
            const SizedBox(height: GuHrSpacing.stackLg),
            PasswordField(
              controller: _passwordCtrl,
              labelText: 'Mật khẩu',
              autofillHints: const [AutofillHints.password],
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Vui lòng nhập mật khẩu' : null,
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: GuHrSpacing.stackMd),
              Text(
                _errorMessage!,
                style: tt.bodySmall?.copyWith(color: cs.error),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: GuHrSpacing.gutter),
            FilledButton(
              onPressed: _loading ? null : _submit,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}
