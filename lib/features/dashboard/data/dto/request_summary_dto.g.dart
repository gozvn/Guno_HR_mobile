// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestSummaryDtoImpl _$$RequestSummaryDtoImplFromJson(
  Map<String, dynamic> json,
) => _$RequestSummaryDtoImpl(
  pendingRequests: (json['pending_requests'] as num).toInt(),
  onLeaveToday: (json['on_leave_today'] as num).toInt(),
  monthTotal: (json['month_total'] as num).toInt(),
);

Map<String, dynamic> _$$RequestSummaryDtoImplToJson(
  _$RequestSummaryDtoImpl instance,
) => <String, dynamic>{
  'pending_requests': instance.pendingRequests,
  'on_leave_today': instance.onLeaveToday,
  'month_total': instance.monthTotal,
};
