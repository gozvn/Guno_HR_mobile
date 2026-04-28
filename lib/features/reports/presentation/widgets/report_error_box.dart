import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/api_error.dart';

/// Centred error placeholder for report pages.
/// Extracts the server's `error` field from a DioException response so users
/// see "Database error" instead of the verbose `DioException [bad response]`
/// stack-trace dump. Falls back to `error.toString()` when the cause is
/// unknown.
class ReportErrorBox extends StatelessWidget {
  const ReportErrorBox({
    super.key,
    required this.error,
    required this.onRetry,
  });

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final message = _extractMessage(error);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud_off_outlined, size: 56, color: cs.error),
            const SizedBox(height: 12),
            Text(
              'Không tải được báo cáo',
              style: tt.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: TextAlign.center,
              style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }

  String _extractMessage(Object error) {
    if (error is DioException) {
      // Envelope path: ApiResponseInterceptor attaches structured ApiError.
      if (error.error is ApiError) {
        return (error.error as ApiError).message;
      }
      // Legacy fallback for non-envelope responses.
      final data = error.response?.data;
      if (data is Map) {
        final m = data['error'];
        if (m is String && m.isNotEmpty) return m;
        if (m is Map && m['message'] is String) return m['message'] as String;
      }
      final status = error.response?.statusCode;
      if (status != null) return 'Máy chủ trả mã $status';
      return error.message ?? 'Lỗi mạng';
    }
    return error.toString();
  }
}
