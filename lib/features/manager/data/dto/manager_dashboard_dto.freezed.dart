// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_dashboard_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ManagerStatsDto _$ManagerStatsDtoFromJson(Map<String, dynamic> json) {
  return _ManagerStatsDto.fromJson(json);
}

/// @nodoc
mixin _$ManagerStatsDto {
  int get present => throw _privateConstructorUsedError;
  int get late => throw _privateConstructorUsedError;
  int get absent => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_count')
  int get pendingCount => throw _privateConstructorUsedError;

  /// Serializes this ManagerStatsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManagerStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManagerStatsDtoCopyWith<ManagerStatsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerStatsDtoCopyWith<$Res> {
  factory $ManagerStatsDtoCopyWith(
    ManagerStatsDto value,
    $Res Function(ManagerStatsDto) then,
  ) = _$ManagerStatsDtoCopyWithImpl<$Res, ManagerStatsDto>;
  @useResult
  $Res call({
    int present,
    int late,
    int absent,
    @JsonKey(name: 'pending_count') int pendingCount,
  });
}

/// @nodoc
class _$ManagerStatsDtoCopyWithImpl<$Res, $Val extends ManagerStatsDto>
    implements $ManagerStatsDtoCopyWith<$Res> {
  _$ManagerStatsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManagerStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? present = null,
    Object? late = null,
    Object? absent = null,
    Object? pendingCount = null,
  }) {
    return _then(
      _value.copyWith(
            present: null == present
                ? _value.present
                : present // ignore: cast_nullable_to_non_nullable
                      as int,
            late: null == late
                ? _value.late
                : late // ignore: cast_nullable_to_non_nullable
                      as int,
            absent: null == absent
                ? _value.absent
                : absent // ignore: cast_nullable_to_non_nullable
                      as int,
            pendingCount: null == pendingCount
                ? _value.pendingCount
                : pendingCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ManagerStatsDtoImplCopyWith<$Res>
    implements $ManagerStatsDtoCopyWith<$Res> {
  factory _$$ManagerStatsDtoImplCopyWith(
    _$ManagerStatsDtoImpl value,
    $Res Function(_$ManagerStatsDtoImpl) then,
  ) = __$$ManagerStatsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int present,
    int late,
    int absent,
    @JsonKey(name: 'pending_count') int pendingCount,
  });
}

/// @nodoc
class __$$ManagerStatsDtoImplCopyWithImpl<$Res>
    extends _$ManagerStatsDtoCopyWithImpl<$Res, _$ManagerStatsDtoImpl>
    implements _$$ManagerStatsDtoImplCopyWith<$Res> {
  __$$ManagerStatsDtoImplCopyWithImpl(
    _$ManagerStatsDtoImpl _value,
    $Res Function(_$ManagerStatsDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManagerStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? present = null,
    Object? late = null,
    Object? absent = null,
    Object? pendingCount = null,
  }) {
    return _then(
      _$ManagerStatsDtoImpl(
        present: null == present
            ? _value.present
            : present // ignore: cast_nullable_to_non_nullable
                  as int,
        late: null == late
            ? _value.late
            : late // ignore: cast_nullable_to_non_nullable
                  as int,
        absent: null == absent
            ? _value.absent
            : absent // ignore: cast_nullable_to_non_nullable
                  as int,
        pendingCount: null == pendingCount
            ? _value.pendingCount
            : pendingCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManagerStatsDtoImpl implements _ManagerStatsDto {
  const _$ManagerStatsDtoImpl({
    this.present = 0,
    this.late = 0,
    this.absent = 0,
    @JsonKey(name: 'pending_count') this.pendingCount = 0,
  });

  factory _$ManagerStatsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManagerStatsDtoImplFromJson(json);

  @override
  @JsonKey()
  final int present;
  @override
  @JsonKey()
  final int late;
  @override
  @JsonKey()
  final int absent;
  @override
  @JsonKey(name: 'pending_count')
  final int pendingCount;

  @override
  String toString() {
    return 'ManagerStatsDto(present: $present, late: $late, absent: $absent, pendingCount: $pendingCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManagerStatsDtoImpl &&
            (identical(other.present, present) || other.present == present) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.absent, absent) || other.absent == absent) &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, present, late, absent, pendingCount);

  /// Create a copy of ManagerStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManagerStatsDtoImplCopyWith<_$ManagerStatsDtoImpl> get copyWith =>
      __$$ManagerStatsDtoImplCopyWithImpl<_$ManagerStatsDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManagerStatsDtoImplToJson(this);
  }
}

abstract class _ManagerStatsDto implements ManagerStatsDto {
  const factory _ManagerStatsDto({
    final int present,
    final int late,
    final int absent,
    @JsonKey(name: 'pending_count') final int pendingCount,
  }) = _$ManagerStatsDtoImpl;

  factory _ManagerStatsDto.fromJson(Map<String, dynamic> json) =
      _$ManagerStatsDtoImpl.fromJson;

  @override
  int get present;
  @override
  int get late;
  @override
  int get absent;
  @override
  @JsonKey(name: 'pending_count')
  int get pendingCount;

  /// Create a copy of ManagerStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManagerStatsDtoImplCopyWith<_$ManagerStatsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodayAttendanceRowDto _$TodayAttendanceRowDtoFromJson(
  Map<String, dynamic> json,
) {
  return _TodayAttendanceRowDto.fromJson(json);
}

/// @nodoc
mixin _$TodayAttendanceRowDto {
  @JsonKey(name: 'employee_id')
  int get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in_at')
  String? get checkInAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_out_at')
  String? get checkOutAt => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // present | late | absent
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this TodayAttendanceRowDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayAttendanceRowDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayAttendanceRowDtoCopyWith<TodayAttendanceRowDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayAttendanceRowDtoCopyWith<$Res> {
  factory $TodayAttendanceRowDtoCopyWith(
    TodayAttendanceRowDto value,
    $Res Function(TodayAttendanceRowDto) then,
  ) = _$TodayAttendanceRowDtoCopyWithImpl<$Res, TodayAttendanceRowDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'employee_id') int employeeId,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'check_in_at') String? checkInAt,
    @JsonKey(name: 'check_out_at') String? checkOutAt,
    String status,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  });
}

/// @nodoc
class _$TodayAttendanceRowDtoCopyWithImpl<
  $Res,
  $Val extends TodayAttendanceRowDto
>
    implements $TodayAttendanceRowDtoCopyWith<$Res> {
  _$TodayAttendanceRowDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayAttendanceRowDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = null,
    Object? fullName = null,
    Object? checkInAt = freezed,
    Object? checkOutAt = freezed,
    Object? status = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            employeeId: null == employeeId
                ? _value.employeeId
                : employeeId // ignore: cast_nullable_to_non_nullable
                      as int,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            checkInAt: freezed == checkInAt
                ? _value.checkInAt
                : checkInAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            checkOutAt: freezed == checkOutAt
                ? _value.checkOutAt
                : checkOutAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodayAttendanceRowDtoImplCopyWith<$Res>
    implements $TodayAttendanceRowDtoCopyWith<$Res> {
  factory _$$TodayAttendanceRowDtoImplCopyWith(
    _$TodayAttendanceRowDtoImpl value,
    $Res Function(_$TodayAttendanceRowDtoImpl) then,
  ) = __$$TodayAttendanceRowDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'employee_id') int employeeId,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'check_in_at') String? checkInAt,
    @JsonKey(name: 'check_out_at') String? checkOutAt,
    String status,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  });
}

/// @nodoc
class __$$TodayAttendanceRowDtoImplCopyWithImpl<$Res>
    extends
        _$TodayAttendanceRowDtoCopyWithImpl<$Res, _$TodayAttendanceRowDtoImpl>
    implements _$$TodayAttendanceRowDtoImplCopyWith<$Res> {
  __$$TodayAttendanceRowDtoImplCopyWithImpl(
    _$TodayAttendanceRowDtoImpl _value,
    $Res Function(_$TodayAttendanceRowDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodayAttendanceRowDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = null,
    Object? fullName = null,
    Object? checkInAt = freezed,
    Object? checkOutAt = freezed,
    Object? status = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _$TodayAttendanceRowDtoImpl(
        employeeId: null == employeeId
            ? _value.employeeId
            : employeeId // ignore: cast_nullable_to_non_nullable
                  as int,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        checkInAt: freezed == checkInAt
            ? _value.checkInAt
            : checkInAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        checkOutAt: freezed == checkOutAt
            ? _value.checkOutAt
            : checkOutAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayAttendanceRowDtoImpl implements _TodayAttendanceRowDto {
  const _$TodayAttendanceRowDtoImpl({
    @JsonKey(name: 'employee_id') required this.employeeId,
    @JsonKey(name: 'full_name') required this.fullName,
    @JsonKey(name: 'check_in_at') this.checkInAt,
    @JsonKey(name: 'check_out_at') this.checkOutAt,
    required this.status,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
  });

  factory _$TodayAttendanceRowDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayAttendanceRowDtoImplFromJson(json);

  @override
  @JsonKey(name: 'employee_id')
  final int employeeId;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'check_in_at')
  final String? checkInAt;
  @override
  @JsonKey(name: 'check_out_at')
  final String? checkOutAt;
  @override
  final String status;
  // present | late | absent
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  @override
  String toString() {
    return 'TodayAttendanceRowDto(employeeId: $employeeId, fullName: $fullName, checkInAt: $checkInAt, checkOutAt: $checkOutAt, status: $status, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayAttendanceRowDtoImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.checkInAt, checkInAt) ||
                other.checkInAt == checkInAt) &&
            (identical(other.checkOutAt, checkOutAt) ||
                other.checkOutAt == checkOutAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    employeeId,
    fullName,
    checkInAt,
    checkOutAt,
    status,
    avatarUrl,
  );

  /// Create a copy of TodayAttendanceRowDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayAttendanceRowDtoImplCopyWith<_$TodayAttendanceRowDtoImpl>
  get copyWith =>
      __$$TodayAttendanceRowDtoImplCopyWithImpl<_$TodayAttendanceRowDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayAttendanceRowDtoImplToJson(this);
  }
}

abstract class _TodayAttendanceRowDto implements TodayAttendanceRowDto {
  const factory _TodayAttendanceRowDto({
    @JsonKey(name: 'employee_id') required final int employeeId,
    @JsonKey(name: 'full_name') required final String fullName,
    @JsonKey(name: 'check_in_at') final String? checkInAt,
    @JsonKey(name: 'check_out_at') final String? checkOutAt,
    required final String status,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
  }) = _$TodayAttendanceRowDtoImpl;

  factory _TodayAttendanceRowDto.fromJson(Map<String, dynamic> json) =
      _$TodayAttendanceRowDtoImpl.fromJson;

  @override
  @JsonKey(name: 'employee_id')
  int get employeeId;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  @JsonKey(name: 'check_in_at')
  String? get checkInAt;
  @override
  @JsonKey(name: 'check_out_at')
  String? get checkOutAt;
  @override
  String get status; // present | late | absent
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;

  /// Create a copy of TodayAttendanceRowDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayAttendanceRowDtoImplCopyWith<_$TodayAttendanceRowDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TeamMemberDto _$TeamMemberDtoFromJson(Map<String, dynamic> json) {
  return _TeamMemberDto.fromJson(json);
}

/// @nodoc
mixin _$TeamMemberDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;

  /// Serializes this TeamMemberDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeamMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeamMemberDtoCopyWith<TeamMemberDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamMemberDtoCopyWith<$Res> {
  factory $TeamMemberDtoCopyWith(
    TeamMemberDto value,
    $Res Function(TeamMemberDto) then,
  ) = _$TeamMemberDtoCopyWithImpl<$Res, TeamMemberDto>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
  });
}

/// @nodoc
class _$TeamMemberDtoCopyWithImpl<$Res, $Val extends TeamMemberDto>
    implements $TeamMemberDtoCopyWith<$Res> {
  _$TeamMemberDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeamMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? avatarUrl = freezed,
    Object? position = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TeamMemberDtoImplCopyWith<$Res>
    implements $TeamMemberDtoCopyWith<$Res> {
  factory _$$TeamMemberDtoImplCopyWith(
    _$TeamMemberDtoImpl value,
    $Res Function(_$TeamMemberDtoImpl) then,
  ) = __$$TeamMemberDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
  });
}

/// @nodoc
class __$$TeamMemberDtoImplCopyWithImpl<$Res>
    extends _$TeamMemberDtoCopyWithImpl<$Res, _$TeamMemberDtoImpl>
    implements _$$TeamMemberDtoImplCopyWith<$Res> {
  __$$TeamMemberDtoImplCopyWithImpl(
    _$TeamMemberDtoImpl _value,
    $Res Function(_$TeamMemberDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TeamMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? avatarUrl = freezed,
    Object? position = freezed,
  }) {
    return _then(
      _$TeamMemberDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamMemberDtoImpl implements _TeamMemberDto {
  const _$TeamMemberDtoImpl({
    required this.id,
    @JsonKey(name: 'full_name') required this.fullName,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    this.position,
  });

  factory _$TeamMemberDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamMemberDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String? position;

  @override
  String toString() {
    return 'TeamMemberDto(id: $id, fullName: $fullName, avatarUrl: $avatarUrl, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamMemberDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fullName, avatarUrl, position);

  /// Create a copy of TeamMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamMemberDtoImplCopyWith<_$TeamMemberDtoImpl> get copyWith =>
      __$$TeamMemberDtoImplCopyWithImpl<_$TeamMemberDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamMemberDtoImplToJson(this);
  }
}

abstract class _TeamMemberDto implements TeamMemberDto {
  const factory _TeamMemberDto({
    required final int id,
    @JsonKey(name: 'full_name') required final String fullName,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    final String? position,
  }) = _$TeamMemberDtoImpl;

  factory _TeamMemberDto.fromJson(Map<String, dynamic> json) =
      _$TeamMemberDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String? get position;

  /// Create a copy of TeamMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeamMemberDtoImplCopyWith<_$TeamMemberDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PendingRequestSummaryDto _$PendingRequestSummaryDtoFromJson(
  Map<String, dynamic> json,
) {
  return _PendingRequestSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$PendingRequestSummaryDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_id')
  int get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_name')
  String? get typeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this PendingRequestSummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingRequestSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingRequestSummaryDtoCopyWith<PendingRequestSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingRequestSummaryDtoCopyWith<$Res> {
  factory $PendingRequestSummaryDtoCopyWith(
    PendingRequestSummaryDto value,
    $Res Function(PendingRequestSummaryDto) then,
  ) = _$PendingRequestSummaryDtoCopyWithImpl<$Res, PendingRequestSummaryDto>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'employee_id') int employeeId,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String type,
    @JsonKey(name: 'type_name') String? typeName,
    @JsonKey(name: 'start_date') String startDate,
    @JsonKey(name: 'end_date') String endDate,
    String? reason,
    String status,
  });
}

/// @nodoc
class _$PendingRequestSummaryDtoCopyWithImpl<
  $Res,
  $Val extends PendingRequestSummaryDto
>
    implements $PendingRequestSummaryDtoCopyWith<$Res> {
  _$PendingRequestSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingRequestSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? type = null,
    Object? typeName = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = freezed,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            employeeId: null == employeeId
                ? _value.employeeId
                : employeeId // ignore: cast_nullable_to_non_nullable
                      as int,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            typeName: freezed == typeName
                ? _value.typeName
                : typeName // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PendingRequestSummaryDtoImplCopyWith<$Res>
    implements $PendingRequestSummaryDtoCopyWith<$Res> {
  factory _$$PendingRequestSummaryDtoImplCopyWith(
    _$PendingRequestSummaryDtoImpl value,
    $Res Function(_$PendingRequestSummaryDtoImpl) then,
  ) = __$$PendingRequestSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'employee_id') int employeeId,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String type,
    @JsonKey(name: 'type_name') String? typeName,
    @JsonKey(name: 'start_date') String startDate,
    @JsonKey(name: 'end_date') String endDate,
    String? reason,
    String status,
  });
}

/// @nodoc
class __$$PendingRequestSummaryDtoImplCopyWithImpl<$Res>
    extends
        _$PendingRequestSummaryDtoCopyWithImpl<
          $Res,
          _$PendingRequestSummaryDtoImpl
        >
    implements _$$PendingRequestSummaryDtoImplCopyWith<$Res> {
  __$$PendingRequestSummaryDtoImplCopyWithImpl(
    _$PendingRequestSummaryDtoImpl _value,
    $Res Function(_$PendingRequestSummaryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingRequestSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? type = null,
    Object? typeName = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = freezed,
    Object? status = null,
  }) {
    return _then(
      _$PendingRequestSummaryDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        employeeId: null == employeeId
            ? _value.employeeId
            : employeeId // ignore: cast_nullable_to_non_nullable
                  as int,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        typeName: freezed == typeName
            ? _value.typeName
            : typeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingRequestSummaryDtoImpl implements _PendingRequestSummaryDto {
  const _$PendingRequestSummaryDtoImpl({
    required this.id,
    @JsonKey(name: 'employee_id') required this.employeeId,
    @JsonKey(name: 'full_name') this.fullName,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    required this.type,
    @JsonKey(name: 'type_name') this.typeName,
    @JsonKey(name: 'start_date') required this.startDate,
    @JsonKey(name: 'end_date') required this.endDate,
    this.reason,
    required this.status,
  });

  factory _$PendingRequestSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingRequestSummaryDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'employee_id')
  final int employeeId;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String type;
  @override
  @JsonKey(name: 'type_name')
  final String? typeName;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  @override
  final String? reason;
  @override
  final String status;

  @override
  String toString() {
    return 'PendingRequestSummaryDto(id: $id, employeeId: $employeeId, fullName: $fullName, avatarUrl: $avatarUrl, type: $type, typeName: $typeName, startDate: $startDate, endDate: $endDate, reason: $reason, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingRequestSummaryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    employeeId,
    fullName,
    avatarUrl,
    type,
    typeName,
    startDate,
    endDate,
    reason,
    status,
  );

  /// Create a copy of PendingRequestSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingRequestSummaryDtoImplCopyWith<_$PendingRequestSummaryDtoImpl>
  get copyWith =>
      __$$PendingRequestSummaryDtoImplCopyWithImpl<
        _$PendingRequestSummaryDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingRequestSummaryDtoImplToJson(this);
  }
}

abstract class _PendingRequestSummaryDto implements PendingRequestSummaryDto {
  const factory _PendingRequestSummaryDto({
    required final int id,
    @JsonKey(name: 'employee_id') required final int employeeId,
    @JsonKey(name: 'full_name') final String? fullName,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    required final String type,
    @JsonKey(name: 'type_name') final String? typeName,
    @JsonKey(name: 'start_date') required final String startDate,
    @JsonKey(name: 'end_date') required final String endDate,
    final String? reason,
    required final String status,
  }) = _$PendingRequestSummaryDtoImpl;

  factory _PendingRequestSummaryDto.fromJson(Map<String, dynamic> json) =
      _$PendingRequestSummaryDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'employee_id')
  int get employeeId;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String get type;
  @override
  @JsonKey(name: 'type_name')
  String? get typeName;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  String? get reason;
  @override
  String get status;

  /// Create a copy of PendingRequestSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingRequestSummaryDtoImplCopyWith<_$PendingRequestSummaryDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ManagerDashboardDto _$ManagerDashboardDtoFromJson(Map<String, dynamic> json) {
  return _ManagerDashboardDto.fromJson(json);
}

/// @nodoc
mixin _$ManagerDashboardDto {
  @JsonKey(name: 'team_size')
  int get teamSize => throw _privateConstructorUsedError;
  List<TeamMemberDto> get team => throw _privateConstructorUsedError;
  @JsonKey(name: 'today_attendance')
  List<TodayAttendanceRowDto> get todayAttendance =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_requests')
  List<PendingRequestSummaryDto> get pendingRequests =>
      throw _privateConstructorUsedError;
  ManagerStatsDto get stats => throw _privateConstructorUsedError;

  /// Serializes this ManagerDashboardDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManagerDashboardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManagerDashboardDtoCopyWith<ManagerDashboardDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerDashboardDtoCopyWith<$Res> {
  factory $ManagerDashboardDtoCopyWith(
    ManagerDashboardDto value,
    $Res Function(ManagerDashboardDto) then,
  ) = _$ManagerDashboardDtoCopyWithImpl<$Res, ManagerDashboardDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'team_size') int teamSize,
    List<TeamMemberDto> team,
    @JsonKey(name: 'today_attendance')
    List<TodayAttendanceRowDto> todayAttendance,
    @JsonKey(name: 'pending_requests')
    List<PendingRequestSummaryDto> pendingRequests,
    ManagerStatsDto stats,
  });

  $ManagerStatsDtoCopyWith<$Res> get stats;
}

/// @nodoc
class _$ManagerDashboardDtoCopyWithImpl<$Res, $Val extends ManagerDashboardDto>
    implements $ManagerDashboardDtoCopyWith<$Res> {
  _$ManagerDashboardDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManagerDashboardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamSize = null,
    Object? team = null,
    Object? todayAttendance = null,
    Object? pendingRequests = null,
    Object? stats = null,
  }) {
    return _then(
      _value.copyWith(
            teamSize: null == teamSize
                ? _value.teamSize
                : teamSize // ignore: cast_nullable_to_non_nullable
                      as int,
            team: null == team
                ? _value.team
                : team // ignore: cast_nullable_to_non_nullable
                      as List<TeamMemberDto>,
            todayAttendance: null == todayAttendance
                ? _value.todayAttendance
                : todayAttendance // ignore: cast_nullable_to_non_nullable
                      as List<TodayAttendanceRowDto>,
            pendingRequests: null == pendingRequests
                ? _value.pendingRequests
                : pendingRequests // ignore: cast_nullable_to_non_nullable
                      as List<PendingRequestSummaryDto>,
            stats: null == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as ManagerStatsDto,
          )
          as $Val,
    );
  }

  /// Create a copy of ManagerDashboardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagerStatsDtoCopyWith<$Res> get stats {
    return $ManagerStatsDtoCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ManagerDashboardDtoImplCopyWith<$Res>
    implements $ManagerDashboardDtoCopyWith<$Res> {
  factory _$$ManagerDashboardDtoImplCopyWith(
    _$ManagerDashboardDtoImpl value,
    $Res Function(_$ManagerDashboardDtoImpl) then,
  ) = __$$ManagerDashboardDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'team_size') int teamSize,
    List<TeamMemberDto> team,
    @JsonKey(name: 'today_attendance')
    List<TodayAttendanceRowDto> todayAttendance,
    @JsonKey(name: 'pending_requests')
    List<PendingRequestSummaryDto> pendingRequests,
    ManagerStatsDto stats,
  });

  @override
  $ManagerStatsDtoCopyWith<$Res> get stats;
}

/// @nodoc
class __$$ManagerDashboardDtoImplCopyWithImpl<$Res>
    extends _$ManagerDashboardDtoCopyWithImpl<$Res, _$ManagerDashboardDtoImpl>
    implements _$$ManagerDashboardDtoImplCopyWith<$Res> {
  __$$ManagerDashboardDtoImplCopyWithImpl(
    _$ManagerDashboardDtoImpl _value,
    $Res Function(_$ManagerDashboardDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManagerDashboardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamSize = null,
    Object? team = null,
    Object? todayAttendance = null,
    Object? pendingRequests = null,
    Object? stats = null,
  }) {
    return _then(
      _$ManagerDashboardDtoImpl(
        teamSize: null == teamSize
            ? _value.teamSize
            : teamSize // ignore: cast_nullable_to_non_nullable
                  as int,
        team: null == team
            ? _value._team
            : team // ignore: cast_nullable_to_non_nullable
                  as List<TeamMemberDto>,
        todayAttendance: null == todayAttendance
            ? _value._todayAttendance
            : todayAttendance // ignore: cast_nullable_to_non_nullable
                  as List<TodayAttendanceRowDto>,
        pendingRequests: null == pendingRequests
            ? _value._pendingRequests
            : pendingRequests // ignore: cast_nullable_to_non_nullable
                  as List<PendingRequestSummaryDto>,
        stats: null == stats
            ? _value.stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as ManagerStatsDto,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManagerDashboardDtoImpl implements _ManagerDashboardDto {
  const _$ManagerDashboardDtoImpl({
    @JsonKey(name: 'team_size') this.teamSize = 0,
    final List<TeamMemberDto> team = const [],
    @JsonKey(name: 'today_attendance')
    final List<TodayAttendanceRowDto> todayAttendance = const [],
    @JsonKey(name: 'pending_requests')
    final List<PendingRequestSummaryDto> pendingRequests = const [],
    required this.stats,
  }) : _team = team,
       _todayAttendance = todayAttendance,
       _pendingRequests = pendingRequests;

  factory _$ManagerDashboardDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManagerDashboardDtoImplFromJson(json);

  @override
  @JsonKey(name: 'team_size')
  final int teamSize;
  final List<TeamMemberDto> _team;
  @override
  @JsonKey()
  List<TeamMemberDto> get team {
    if (_team is EqualUnmodifiableListView) return _team;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_team);
  }

  final List<TodayAttendanceRowDto> _todayAttendance;
  @override
  @JsonKey(name: 'today_attendance')
  List<TodayAttendanceRowDto> get todayAttendance {
    if (_todayAttendance is EqualUnmodifiableListView) return _todayAttendance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayAttendance);
  }

  final List<PendingRequestSummaryDto> _pendingRequests;
  @override
  @JsonKey(name: 'pending_requests')
  List<PendingRequestSummaryDto> get pendingRequests {
    if (_pendingRequests is EqualUnmodifiableListView) return _pendingRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingRequests);
  }

  @override
  final ManagerStatsDto stats;

  @override
  String toString() {
    return 'ManagerDashboardDto(teamSize: $teamSize, team: $team, todayAttendance: $todayAttendance, pendingRequests: $pendingRequests, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManagerDashboardDtoImpl &&
            (identical(other.teamSize, teamSize) ||
                other.teamSize == teamSize) &&
            const DeepCollectionEquality().equals(other._team, _team) &&
            const DeepCollectionEquality().equals(
              other._todayAttendance,
              _todayAttendance,
            ) &&
            const DeepCollectionEquality().equals(
              other._pendingRequests,
              _pendingRequests,
            ) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    teamSize,
    const DeepCollectionEquality().hash(_team),
    const DeepCollectionEquality().hash(_todayAttendance),
    const DeepCollectionEquality().hash(_pendingRequests),
    stats,
  );

  /// Create a copy of ManagerDashboardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManagerDashboardDtoImplCopyWith<_$ManagerDashboardDtoImpl> get copyWith =>
      __$$ManagerDashboardDtoImplCopyWithImpl<_$ManagerDashboardDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManagerDashboardDtoImplToJson(this);
  }
}

abstract class _ManagerDashboardDto implements ManagerDashboardDto {
  const factory _ManagerDashboardDto({
    @JsonKey(name: 'team_size') final int teamSize,
    final List<TeamMemberDto> team,
    @JsonKey(name: 'today_attendance')
    final List<TodayAttendanceRowDto> todayAttendance,
    @JsonKey(name: 'pending_requests')
    final List<PendingRequestSummaryDto> pendingRequests,
    required final ManagerStatsDto stats,
  }) = _$ManagerDashboardDtoImpl;

  factory _ManagerDashboardDto.fromJson(Map<String, dynamic> json) =
      _$ManagerDashboardDtoImpl.fromJson;

  @override
  @JsonKey(name: 'team_size')
  int get teamSize;
  @override
  List<TeamMemberDto> get team;
  @override
  @JsonKey(name: 'today_attendance')
  List<TodayAttendanceRowDto> get todayAttendance;
  @override
  @JsonKey(name: 'pending_requests')
  List<PendingRequestSummaryDto> get pendingRequests;
  @override
  ManagerStatsDto get stats;

  /// Create a copy of ManagerDashboardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManagerDashboardDtoImplCopyWith<_$ManagerDashboardDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
