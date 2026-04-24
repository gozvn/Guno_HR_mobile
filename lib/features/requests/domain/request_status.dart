import 'package:flutter/material.dart';

enum RequestStatus {
  pending,
  processing,
  approved,
  rejected,
  cancelled;

  static RequestStatus fromString(String s) => switch (s) {
        'pending' => RequestStatus.pending,
        'processing' => RequestStatus.processing,
        'approved' => RequestStatus.approved,
        'rejected' => RequestStatus.rejected,
        'cancelled' => RequestStatus.cancelled,
        _ => RequestStatus.pending,
      };

  String get labelVi => switch (this) {
        RequestStatus.pending => 'Chờ duyệt',
        RequestStatus.processing => 'Đang xử lý',
        RequestStatus.approved => 'Đã duyệt',
        RequestStatus.rejected => 'Từ chối',
        RequestStatus.cancelled => 'Đã huỷ',
      };

  Color color(BuildContext context) => switch (this) {
        RequestStatus.pending => Colors.amber.shade700,
        RequestStatus.processing => Colors.blue.shade600,
        RequestStatus.approved => Colors.green.shade600,
        RequestStatus.rejected => Theme.of(context).colorScheme.error,
        RequestStatus.cancelled => Colors.grey.shade500,
      };

  bool get canCancel =>
      this == RequestStatus.pending || this == RequestStatus.processing;
}
