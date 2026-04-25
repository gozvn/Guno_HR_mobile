import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/tokens.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../core/errors/result.dart';
import '../auth_notifier.dart';
import 'password_field.dart';

/// Window the success banner stays on screen before state transitions to
/// Authenticated and the router navigates to /home.
const _kSuccessBannerDuration = Duration(milliseconds: 1200);

// Email + password form wired to AuthNotifier. Inline error/success display
// sits ABOVE the input frame. Login success shows a brief confirmation banner
// before navigation; login failure renders inline + SnackBar.
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
  String? _successMessage;

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
      _successMessage = null;
    });

    final result = await ref.read(authNotifierProvider.notifier).attemptLogin(
          _emailCtrl.text.trim(),
          _passwordCtrl.text.isEmpty ? null : _passwordCtrl.text,
        );

    if (!mounted) return;

    switch (result) {
      case Ok(:final value):
        setState(() {
          _loading = false;
          _successMessage = 'Đăng nhập thành công. Đang chuyển trang…';
        });
        await Future.delayed(_kSuccessBannerDuration);
        if (!mounted) return;
        // Commit — router observes AuthAuthenticated and navigates to /home.
        await ref.read(authNotifierProvider.notifier).completeLogin(value);
      case Err(:final failure):
        final message = _resolveMessage(failure) ??
            'Đăng nhập thất bại. Vui lòng thử lại.';
        setState(() {
          _loading = false;
          _errorMessage = message;
        });
        final cs = Theme.of(context).colorScheme;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: cs.error,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 4),
            ),
          );
    }
  }

  String? _resolveMessage(AppFailure failure) {
    return failure.when(
      unauthorized: (msg) => msg ?? 'Email hoặc mật khẩu không đúng',
      forbidden: (req) => req ?? 'Tài khoản chưa được kích hoạt',
      validation: (msg) => msg,
      network: (msg) => msg,
      server: (_, msg) => msg ?? 'Lỗi máy chủ',
      unknown: (_) => 'Đã xảy ra lỗi. Vui lòng thử lại.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_errorMessage != null)
              _StatusBanner.error(message: _errorMessage!),
            if (_successMessage != null)
              _StatusBanner.success(message: _successMessage!),
            if (_errorMessage != null || _successMessage != null)
              const SizedBox(height: GuHrSpacing.stackLg),
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

/// Inline banner rendered above the input frame for login feedback.
/// Red for failure, green for pre-nav success.
class _StatusBanner extends StatelessWidget {
  const _StatusBanner._({
    required this.message,
    required this.background,
    required this.foreground,
    required this.icon,
  });

  factory _StatusBanner.error({required String message}) => _StatusBanner._(
        message: message,
        background: const Color(0xFFFDECEC),
        foreground: const Color(0xFFB3261E),
        icon: Icons.error_outline,
      );

  factory _StatusBanner.success({required String message}) => _StatusBanner._(
        message: message,
        background: const Color(0xFFE6F4EA),
        foreground: const Color(0xFF1E7E34),
        icon: Icons.check_circle_outline,
      );

  final String message;
  final Color background;
  final Color foreground;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: foreground.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: foreground),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: tt.bodyMedium?.copyWith(color: foreground),
            ),
          ),
        ],
      ),
    );
  }
}
