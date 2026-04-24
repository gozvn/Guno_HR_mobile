// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_shift_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LiveShiftDto _$LiveShiftDtoFromJson(Map<String, dynamic> json) {
  return _LiveShiftDto.fromJson(json);
}

/// @nodoc
mixin _$LiveShiftDto {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError; // YYYY-MM-DD
  @JsonKey(name: 'start_at')
  String get startAt => throw _privateConstructorUsedError; // HH:mm
  @JsonKey(name: 'end_at')
  String get endAt => throw _privateConstructorUsedError; // HH:mm
  @JsonKey(name: 'employee_id')
  int get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_name')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError; // fb | tiktok | ...
  String get status =>
      throw _privateConstructorUsedError; // planned | active | completed | cancelled | rejected | approved
  @JsonKey(name: 'gps_distance_m')
  double? get gpsDistanceM => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'reject_reason')
  String? get rejectReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by_name')
  String? get approvedByName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this LiveShiftDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveShiftDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveShiftDtoCopyWith<LiveShiftDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveShiftDtoCopyWith<$Res> {
  factory $LiveShiftDtoCopyWith(
    LiveShiftDto value,
    $Res Function(LiveShiftDto) then,
  ) = _$LiveShiftDtoCopyWithImpl<$Res, LiveShiftDto>;
  @useResult
  $Res call({
    int id,
    String date,
    @JsonKey(name: 'start_at') String startAt,
    @JsonKey(name: 'end_at') String endAt,
    @JsonKey(name: 'employee_id') int employeeId,
    @JsonKey(name: 'employee_name') String? employeeName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String channel,
    String status,
    @JsonKey(name: 'gps_distance_m') double? gpsDistanceM,
    String? note,
    @JsonKey(name: 'reject_reason') String? rejectReason,
    @JsonKey(name: 'approved_by_name') String? approvedByName,
    @JsonKey(name: 'created_at') String? createdAt,
  });
}

/// @nodoc
class _$LiveShiftDtoCopyWithImpl<$Res, $Val extends LiveShiftDto>
    implements $LiveShiftDtoCopyWith<$Res> {
  _$LiveShiftDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveShiftDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startAt = null,
    Object? endAt = null,
    Object? employeeId = null,
    Object? employeeName = freezed,
    Object? avatarUrl = freezed,
    Object? channel = null,
    Object? status = null,
    Object? gpsDistanceM = freezed,
    Object? note = freezed,
    Object? rejectReason = freezed,
    Object? approvedByName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            startAt: null == startAt
                ? _value.startAt
                : startAt // ignore: cast_nullable_to_non_nullable
                      as String,
            endAt: null == endAt
                ? _value.endAt
                : endAt // ignore: cast_nullable_to_non_nullable
                      as String,
            employeeId: null == employeeId
                ? _value.employeeId
                : employeeId // ignore: cast_nullable_to_non_nullable
                      as int,
            employeeName: freezed == employeeName
                ? _value.employeeName
                : employeeName // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            channel: null == channel
                ? _value.channel
                : channel // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            gpsDistanceM: freezed == gpsDistanceM
                ? _value.gpsDistanceM
                : gpsDistanceM // ignore: cast_nullable_to_non_nullable
                      as double?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            rejectReason: freezed == rejectReason
                ? _value.rejectReason
                : rejectReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvedByName: freezed == approvedByName
                ? _value.approvedByName
                : approvedByName // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LiveShiftDtoImplCopyWith<$Res>
    implements $LiveShiftDtoCopyWith<$Res> {
  factory _$$LiveShiftDtoImplCopyWith(
    _$LiveShiftDtoImpl value,
    $Res Function(_$LiveShiftDtoImpl) then,
  ) = __$$LiveShiftDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String date,
    @JsonKey(name: 'start_at') String startAt,
    @JsonKey(name: 'end_at') String endAt,
    @JsonKey(name: 'employee_id') int employeeId,
    @JsonKey(name: 'employee_name') String? employeeName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String channel,
    String status,
    @JsonKey(name: 'gps_distance_m') double? gpsDistanceM,
    String? note,
    @JsonKey(name: 'reject_reason') String? rejectReason,
    @JsonKey(name: 'approved_by_name') String? approvedByName,
    @JsonKey(name: 'created_at') String? createdAt,
  });
}

/// @nodoc
class __$$LiveShiftDtoImplCopyWithImpl<$Res>
    extends _$LiveShiftDtoCopyWithImpl<$Res, _$LiveShiftDtoImpl>
    implements _$$LiveShiftDtoImplCopyWith<$Res> {
  __$$LiveShiftDtoImplCopyWithImpl(
    _$LiveShiftDtoImpl _value,
    $Res Function(_$LiveShiftDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiveShiftDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startAt = null,
    Object? endAt = null,
    Object? employeeId = null,
    Object? employeeName = freezed,
    Object? avatarUrl = freezed,
    Object? channel = null,
    Object? status = null,
    Object? gpsDistanceM = freezed,
    Object? note = freezed,
    Object? rejectReason = freezed,
    Object? approvedByName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$LiveShiftDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        startAt: null == startAt
            ? _value.startAt
            : startAt // ignore: cast_nullable_to_non_nullable
                  as String,
        endAt: null == endAt
            ? _value.endAt
            : endAt // ignore: cast_nullable_to_non_nullable
                  as String,
        employeeId: null == employeeId
            ? _value.employeeId
            : employeeId // ignore: cast_nullable_to_non_nullable
                  as int,
        employeeName: freezed == employeeName
            ? _value.employeeName
            : employeeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: null == channel
            ? _value.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        gpsDistanceM: freezed == gpsDistanceM
            ? _value.gpsDistanceM
            : gpsDistanceM // ignore: cast_nullable_to_non_nullable
                  as double?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        rejectReason: freezed == rejectReason
            ? _value.rejectReason
            : rejectReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvedByName: freezed == approvedByName
            ? _value.approvedByName
            : approvedByName // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveShiftDtoImpl implements _LiveShiftDto {
  const _$LiveShiftDtoImpl({
    required this.id,
    required this.date,
    @JsonKey(name: 'start_at') required this.startAt,
    @JsonKey(name: 'end_at') required this.endAt,
    @JsonKey(name: 'employee_id') required this.employeeId,
    @JsonKey(name: 'employee_name') this.employeeName,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    required this.channel,
    required this.status,
    @JsonKey(name: 'gps_distance_m') this.gpsDistanceM,
    this.note,
    @JsonKey(name: 'reject_reason') this.rejectReason,
    @JsonKey(name: 'approved_by_name') this.approvedByName,
    @JsonKey(name: 'created_at') this.createdAt,
  });

  factory _$LiveShiftDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveShiftDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String date;
  // YYYY-MM-DD
  @override
  @JsonKey(name: 'start_at')
  final String startAt;
  // HH:mm
  @override
  @JsonKey(name: 'end_at')
  final String endAt;
  // HH:mm
  @override
  @JsonKey(name: 'employee_id')
  final int employeeId;
  @override
  @JsonKey(name: 'employee_name')
  final String? employeeName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String channel;
  // fb | tiktok | ...
  @override
  final String status;
  // planned | active | completed | cancelled | rejected | approved
  @override
  @JsonKey(name: 'gps_distance_m')
  final double? gpsDistanceM;
  @override
  final String? note;
  @override
  @JsonKey(name: 'reject_reason')
  final String? rejectReason;
  @override
  @JsonKey(name: 'approved_by_name')
  final String? approvedByName;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'LiveShiftDto(id: $id, date: $date, startAt: $startAt, endAt: $endAt, employeeId: $employeeId, employeeName: $employeeName, avatarUrl: $avatarUrl, channel: $channel, status: $status, gpsDistanceM: $gpsDistanceM, note: $note, rejectReason: $rejectReason, approvedByName: $approvedByName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveShiftDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gpsDistanceM, gpsDistanceM) ||
                other.gpsDistanceM == gpsDistanceM) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.approvedByName, approvedByName) ||
                other.approvedByName == approvedByName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    startAt,
    endAt,
    employeeId,
    employeeName,
    avatarUrl,
    channel,
    status,
    gpsDistanceM,
    note,
    rejectReason,
    approvedByName,
    createdAt,
  );

  /// Create a copy of LiveShiftDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveShiftDtoImplCopyWith<_$LiveShiftDtoImpl> get copyWith =>
      __$$LiveShiftDtoImplCopyWithImpl<_$LiveShiftDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveShiftDtoImplToJson(this);
  }
}

abstract class _LiveShiftDto implements LiveShiftDto {
  const factory _LiveShiftDto({
    required final int id,
    required final String date,
    @JsonKey(name: 'start_at') required final String startAt,
    @JsonKey(name: 'end_at') required final String endAt,
    @JsonKey(name: 'employee_id') required final int employeeId,
    @JsonKey(name: 'employee_name') final String? employeeName,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    required final String channel,
    required final String status,
    @JsonKey(name: 'gps_distance_m') final double? gpsDistanceM,
    final String? note,
    @JsonKey(name: 'reject_reason') final String? rejectReason,
    @JsonKey(name: 'approved_by_name') final String? approvedByName,
    @JsonKey(name: 'created_at') final String? createdAt,
  }) = _$LiveShiftDtoImpl;

  factory _LiveShiftDto.fromJson(Map<String, dynamic> json) =
      _$LiveShiftDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get date; // YYYY-MM-DD
  @override
  @JsonKey(name: 'start_at')
  String get startAt; // HH:mm
  @override
  @JsonKey(name: 'end_at')
  String get endAt; // HH:mm
  @override
  @JsonKey(name: 'employee_id')
  int get employeeId;
  @override
  @JsonKey(name: 'employee_name')
  String? get employeeName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String get channel; // fb | tiktok | ...
  @override
  String get status; // planned | active | completed | cancelled | rejected | approved
  @override
  @JsonKey(name: 'gps_distance_m')
  double? get gpsDistanceM;
  @override
  String? get note;
  @override
  @JsonKey(name: 'reject_reason')
  String? get rejectReason;
  @override
  @JsonKey(name: 'approved_by_name')
  String? get approvedByName;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of LiveShiftDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveShiftDtoImplCopyWith<_$LiveShiftDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
