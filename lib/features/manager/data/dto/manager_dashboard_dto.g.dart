// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManagerStatsDtoImpl _$$ManagerStatsDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ManagerStatsDtoImpl(
  present: (json['present'] as num?)?.toInt() ?? 0,
  late: (json['late'] as num?)?.toInt() ?? 0,
  absent: (json['absent'] as num?)?.toInt() ?? 0,
  pendingCount: (json['pending_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$ManagerStatsDtoImplToJson(
  _$ManagerStatsDtoImpl instance,
) => <String, dynamic>{
  'present': instance.present,
  'late': instance.late,
  'absent': instance.absent,
  'pending_count': instance.pendingCount,
};

_$TodayAttendanceRowDtoImpl _$$TodayAttendanceRowDtoImplFromJson(
  Map<String, dynamic> json,
) => _$TodayAttendanceRowDtoImpl(
  employeeId: (json['employee_id'] as num).toInt(),
  fullName: json['full_name'] as String,
  checkInAt: json['check_in_at'] as String?,
  checkOutAt: json['check_out_at'] as String?,
  status: json['status'] as String,
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$$TodayAttendanceRowDtoImplToJson(
  _$TodayAttendanceRowDtoImpl instance,
) => <String, dynamic>{
  'employee_id': instance.employeeId,
  'full_name': instance.fullName,
  if (instance.checkInAt case final value?) 'check_in_at': value,
  if (instance.checkOutAt case final value?) 'check_out_at': value,
  'status': instance.status,
  if (instance.avatarUrl case final value?) 'avatar_url': value,
};

_$TeamMemberDtoImpl _$$TeamMemberDtoImplFromJson(Map<String, dynamic> json) =>
    _$TeamMemberDtoImpl(
      id: (json['id'] as num).toInt(),
      fullName: json['full_name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$$TeamMemberDtoImplToJson(_$TeamMemberDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      if (instance.avatarUrl case final value?) 'avatar_url': value,
      if (instance.position case final value?) 'position': value,
    };

_$PendingRequestSummaryDtoImpl _$$PendingRequestSummaryDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PendingRequestSummaryDtoImpl(
  id: (json['id'] as num).toInt(),
  employeeId: (json['employee_id'] as num).toInt(),
  fullName: json['full_name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  type: json['type'] as String,
  typeName: json['type_name'] as String?,
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  reason: json['reason'] as String?,
  status: json['status'] as String,
);

Map<String, dynamic> _$$PendingRequestSummaryDtoImplToJson(
  _$PendingRequestSummaryDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'employee_id': instance.employeeId,
  if (instance.fullName case final value?) 'full_name': value,
  if (instance.avatarUrl case final value?) 'avatar_url': value,
  'type': instance.type,
  if (instance.typeName case final value?) 'type_name': value,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  if (instance.reason case final value?) 'reason': value,
  'status': instance.status,
};

_$ManagerDashboardDtoImpl _$$ManagerDashboardDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ManagerDashboardDtoImpl(
  teamSize: (json['team_size'] as num?)?.toInt() ?? 0,
  team:
      (json['team'] as List<dynamic>?)
          ?.map((e) => TeamMemberDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  todayAttendance:
      (json['today_attendance'] as List<dynamic>?)
          ?.map(
            (e) => TodayAttendanceRowDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  pendingRequests:
      (json['pending_requests'] as List<dynamic>?)
          ?.map(
            (e) => PendingRequestSummaryDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  stats: ManagerStatsDto.fromJson(json['stats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ManagerDashboardDtoImplToJson(
  _$ManagerDashboardDtoImpl instance,
) => <String, dynamic>{
  'team_size': instance.teamSize,
  'team': instance.team.map((e) => e.toJson()).toList(),
  'today_attendance': instance.todayAttendance.map((e) => e.toJson()).toList(),
  'pending_requests': instance.pendingRequests.map((e) => e.toJson()).toList(),
  'stats': instance.stats.toJson(),
};
