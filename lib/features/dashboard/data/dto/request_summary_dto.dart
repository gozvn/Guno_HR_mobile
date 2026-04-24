import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_summary_dto.freezed.dart';
part 'request_summary_dto.g.dart';

// Maps GET /api/hr/requests/dashboard-summary response (audit line 1072–1077).
@freezed
class RequestSummaryDto with _$RequestSummaryDto {
  const factory RequestSummaryDto({
    @JsonKey(name: 'pending_requests') required int pendingRequests,
    @JsonKey(name: 'on_leave_today') required int onLeaveToday,
    @JsonKey(name: 'month_total') required int monthTotal,
  }) = _RequestSummaryDto;

  factory RequestSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$RequestSummaryDtoFromJson(json);
}
