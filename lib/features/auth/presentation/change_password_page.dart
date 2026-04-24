import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/tokens.dart';
import 'auth_notifier.dart';
import 'widgets/password_field.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key, required this.isForced});

  /// When true, the user arrived here because must_change_password == true.
  /// Back navigation is blocked until password is successfully changed.
  final bool isForced;

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentCtrl = TextEditingController();
  final _newCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _loading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _currentCtrl.dispose();
    _newCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      await ref.read(authNotifierProvider.notifier).changePassword(
            currentPassword: _currentCtrl.text,
            newPassword: _newCtrl.text,
          );
      if (!mounted) return;
      context.go('/home');
    } on AuthChangePasswordException catch (e) {
      setState(() {
        _loading = false;
        _errorMessage = e.message;
      });
    } catch (_) {
      setState(() {
        _loading = false;
        _errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    // PopScope(canPop: false) prevents system back in forced mode.
    // WHY: must_change_password means the account is in a restricted state;
    // allowing back would leave the user in an auth loop with no exit.
    return PopScope(
      canPop: !widget.isForced,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Đổi mật khẩu'),
          automaticallyImplyLeading: !widget.isForced,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(GuHrSpacing.containerPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.isForced) ...[
                  Container(
                    padding: const EdgeInsets.all(GuHrSpacing.stackLg),
                    decoration: BoxDecoration(
                      color: cs.errorContainer,
                      borderRadius: BorderRadius.circular(GuHrRadii.lg),
                    ),
                    child: Text(
                      'Bạn cần đổi mật khẩu trước khi tiếp tục sử dụng ứng dụng.',
                      style: tt.bodyMedium?.copyWith(color: cs.onErrorContainer),
                    ),
                  ),
                  const SizedBox(height: GuHrSpacing.gutter),
                ],
                AutofillGroup(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PasswordField(
                          controller: _currentCtrl,
                          labelText: 'Mật khẩu hiện tại',
                          autofillHints: const [AutofillHints.password],
                          textInputAction: TextInputAction.next,
                          validator: (v) => (v == null || v.isEmpty)
                              ? 'Vui lòng nhập mật khẩu hiện tại'
                              : null,
                        ),
                        const SizedBox(height: GuHrSpacing.stackLg),
                        PasswordField(
                          controller: _newCtrl,
                          labelText: 'Mật khẩu mới',
                          autofillHints: const [AutofillHints.newPassword],
                          textInputAction: TextInputAction.next,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'Vui lòng nhập mật khẩu mới';
                            }
                            if (v.length < 6) {
                              return 'Mật khẩu mới tối thiểu 6 ký tự';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: GuHrSpacing.stackLg),
                        PasswordField(
                          controller: _confirmCtrl,
                          labelText: 'Xác nhận mật khẩu mới',
                          autofillHints: const [AutofillHints.newPassword],
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => _submit(),
                          validator: (v) => (v != _newCtrl.text)
                              ? 'Mật khẩu xác nhận không khớp'
                              : null,
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
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2),
                                )
                              : const Text('Đổi mật khẩu'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
