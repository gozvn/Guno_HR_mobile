import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/tokens.dart';
import '../../../features/auth/data/auth_repository.dart';
import '../../../features/auth/domain/auth_state.dart';
import '../../../features/auth/domain/auth_user.dart';
import '../../../features/auth/presentation/auth_notifier.dart';
import '../data/dto/update_employee_request.dart';
import '../profile_providers.dart';
import 'widgets/profile_edit_widgets.dart';

// Phone regex: international format, 8–15 chars.
final _phoneRegex = RegExp(r'^[+\d\s\-]{8,15}$');

class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key});

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _phoneCtrl;
  bool _saving = false;
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    _phoneCtrl = TextEditingController(text: _currentUser?.phone ?? '');
  }

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  AuthUser? get _currentUser {
    final s = ref.read(authNotifierProvider);
    return switch (s) {
      AuthAuthenticated(:final user) => user,
      _ => null,
    };
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final user = _currentUser;
    if (user == null) return;

    setState(() {
      _saving = true;
      _errorMsg = null;
    });

    try {
      await ref.read(profileApiProvider).updateEmployee(
            user.id,
            UpdateEmployeeRequest(phone: _phoneCtrl.text.trim()),
          );
      // Sync local state with server after successful PUT.
      await ref.read(authNotifierProvider.notifier).refreshUser();
      if (mounted) Navigator.of(context).pop();
    } on AppFailureException catch (e) {
      setState(() {
        _errorMsg = e.failure.when(
          network: (msg) => msg,
          unauthorized: (_) => 'Phiên đăng nhập hết hạn',
          forbidden: (msg) => msg ?? 'Không có quyền chỉnh sửa',
          server: (_, msg) => msg ?? 'Lỗi máy chủ',
          validation: (msg) => msg,
          unknown: (_) => 'Đã xảy ra lỗi. Vui lòng thử lại.',
        );
      });
    } catch (_) {
      setState(() => _errorMsg = 'Đã xảy ra lỗi. Vui lòng thử lại.');
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final user = _currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa hồ sơ'),
        actions: [
          _saving
              ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : TextButton(onPressed: _save, child: const Text('Lưu')),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(GuHrSpacing.gutter),
          children: [
            if (_errorMsg != null)
              ProfileEditErrorBanner(message: _errorMsg!),
            // Only editable field in R1.
            TextFormField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Số điện thoại',
                prefixIcon: Icon(Icons.phone_outlined),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return null;
                if (!_phoneRegex.hasMatch(v.trim())) {
                  return 'Số điện thoại không hợp lệ (8–15 ký tự)';
                }
                return null;
              },
            ),
            const SizedBox(height: GuHrSpacing.gutter),
            // Admin-only read-only fields.
            LockedField(
              label: 'Email',
              value: user?.email ?? '—',
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: GuHrSpacing.stackLg),
            LockedField(
              label: 'Chức vụ',
              value: user?.position ?? '—',
              icon: Icons.work_outline,
            ),
            const SizedBox(height: GuHrSpacing.stackLg),
            LockedField(
              label: 'Phòng ban',
              value: user?.departmentName ?? '—',
              icon: Icons.business_outlined,
            ),
            const SizedBox(height: GuHrSpacing.stackLg),
            LockedField(
              label: 'Vai trò',
              value: user?.role ?? '—',
              icon: Icons.shield_outlined,
            ),
            const SizedBox(height: GuHrSpacing.stackLg),
            Row(
              children: [
                Icon(Icons.lock_outline, size: 14, color: cs.onSurfaceVariant),
                const SizedBox(width: 6),
                Text(
                  'Liên hệ HR để thay đổi các trường bị khoá',
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
