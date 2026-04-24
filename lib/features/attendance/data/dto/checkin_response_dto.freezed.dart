// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckinResponseDto _$CheckinResponseDtoFromJson(Map<String, dynamic> json) {
  return _CheckinResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CheckinResponseDto {
  @JsonKey(fromJson: _toBool)
  bool get ok => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_id')
  int? get attendanceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_score')
  double? get gpsScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_distance_m')
  double? get gpsDistanceM => throw _privateConstructorUsedError;
  CheckinLocationDto? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_saved', fromJson: _toBoolNullable)
  bool? get photoSaved => throw _privateConstructorUsedError; // WFH checkout adds work_minutes.
  @JsonKey(name: 'work_minutes')
  int? get workMinutes => throw _privateConstructorUsedError; // WFH checkin adds method.
  String? get method => throw _privateConstructorUsedError;

  /// Serializes this CheckinResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckinResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckinResponseDtoCopyWith<CheckinResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinResponseDtoCopyWith<$Res> {
  factory $CheckinResponseDtoCopyWith(
    CheckinResponseDto value,
    $Res Function(CheckinResponseDto) then,
  ) = _$CheckinResponseDtoCopyWithImpl<$Res, CheckinResponseDto>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _toBool) bool ok,
    @JsonKey(name: 'attendance_id') int? attendanceId,
    @JsonKey(name: 'gps_score') double? gpsScore,
    @JsonKey(name: 'gps_distance_m') double? gpsDistanceM,
    CheckinLocationDto? location,
    @JsonKey(name: 'photo_saved', fromJson: _toBoolNullable) bool? photoSaved,
    @JsonKey(name: 'work_minutes') int? workMinutes,
    String? method,
  });

  $CheckinLocationDtoCopyWith<$Res>? get location;
}

/// @nodoc
class _$CheckinResponseDtoCopyWithImpl<$Res, $Val extends CheckinResponseDto>
    implements $CheckinResponseDtoCopyWith<$Res> {
  _$CheckinResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckinResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = null,
    Object? attendanceId = freezed,
    Object? gpsScore = freezed,
    Object? gpsDistanceM = freezed,
    Object? location = freezed,
    Object? photoSaved = freezed,
    Object? workMinutes = freezed,
    Object? method = freezed,
  }) {
    return _then(
      _value.copyWith(
            ok: null == ok
                ? _value.ok
                : ok // ignore: cast_nullable_to_non_nullable
                      as bool,
            attendanceId: freezed == attendanceId
                ? _value.attendanceId
                : attendanceId // ignore: cast_nullable_to_non_nullable
                      as int?,
            gpsScore: freezed == gpsScore
                ? _value.gpsScore
                : gpsScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            gpsDistanceM: freezed == gpsDistanceM
                ? _value.gpsDistanceM
                : gpsDistanceM // ignore: cast_nullable_to_non_nullable
                      as double?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as CheckinLocationDto?,
            photoSaved: freezed == photoSaved
                ? _value.photoSaved
                : photoSaved // ignore: cast_nullable_to_non_nullable
                      as bool?,
            workMinutes: freezed == workMinutes
                ? _value.workMinutes
                : workMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            method: freezed == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckinResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckinLocationDtoCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $CheckinLocationDtoCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckinResponseDtoImplCopyWith<$Res>
    implements $CheckinResponseDtoCopyWith<$Res> {
  factory _$$CheckinResponseDtoImplCopyWith(
    _$CheckinResponseDtoImpl value,
    $Res Function(_$CheckinResponseDtoImpl) then,
  ) = __$$CheckinResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _toBool) bool ok,
    @JsonKey(name: 'attendance_id') int? attendanceId,
    @JsonKey(name: 'gps_score') double? gpsScore,
    @JsonKey(name: 'gps_distance_m') double? gpsDistanceM,
    CheckinLocationDto? location,
    @JsonKey(name: 'photo_saved', fromJson: _toBoolNullable) bool? photoSaved,
    @JsonKey(name: 'work_minutes') int? workMinutes,
    String? method,
  });

  @override
  $CheckinLocationDtoCopyWith<$Res>? get location;
}

/// @nodoc
class __$$CheckinResponseDtoImplCopyWithImpl<$Res>
    extends _$CheckinResponseDtoCopyWithImpl<$Res, _$CheckinResponseDtoImpl>
    implements _$$CheckinResponseDtoImplCopyWith<$Res> {
  __$$CheckinResponseDtoImplCopyWithImpl(
    _$CheckinResponseDtoImpl _value,
    $Res Function(_$CheckinResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckinResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = null,
    Object? attendanceId = freezed,
    Object? gpsScore = freezed,
    Object? gpsDistanceM = freezed,
    Object? location = freezed,
    Object? photoSaved = freezed,
    Object? workMinutes = freezed,
    Object? method = freezed,
  }) {
    return _then(
      _$CheckinResponseDtoImpl(
        ok: null == ok
            ? _value.ok
            : ok // ignore: cast_nullable_to_non_nullable
                  as bool,
        attendanceId: freezed == attendanceId
            ? _value.attendanceId
            : attendanceId // ignore: cast_nullable_to_non_nullable
                  as int?,
        gpsScore: freezed == gpsScore
            ? _value.gpsScore
            : gpsScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        gpsDistanceM: freezed == gpsDistanceM
            ? _value.gpsDistanceM
            : gpsDistanceM // ignore: cast_nullable_to_non_nullable
                  as double?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as CheckinLocationDto?,
        photoSaved: freezed == photoSaved
            ? _value.photoSaved
            : photoSaved // ignore: cast_nullable_to_non_nullable
                  as bool?,
        workMinutes: freezed == workMinutes
            ? _value.workMinutes
            : workMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        method: freezed == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckinResponseDtoImpl implements _CheckinResponseDto {
  const _$CheckinResponseDtoImpl({
    @JsonKey(fromJson: _toBool) required this.ok,
    @JsonKey(name: 'attendance_id') this.attendanceId,
    @JsonKey(name: 'gps_score') this.gpsScore,
    @JsonKey(name: 'gps_distance_m') this.gpsDistanceM,
    this.location,
    @JsonKey(name: 'photo_saved', fromJson: _toBoolNullable) this.photoSaved,
    @JsonKey(name: 'work_minutes') this.workMinutes,
    this.method,
  });

  factory _$CheckinResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckinResponseDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: _toBool)
  final bool ok;
  @override
  @JsonKey(name: 'attendance_id')
  final int? attendanceId;
  @override
  @JsonKey(name: 'gps_score')
  final double? gpsScore;
  @override
  @JsonKey(name: 'gps_distance_m')
  final double? gpsDistanceM;
  @override
  final CheckinLocationDto? location;
  @override
  @JsonKey(name: 'photo_saved', fromJson: _toBoolNullable)
  final bool? photoSaved;
  // WFH checkout adds work_minutes.
  @override
  @JsonKey(name: 'work_minutes')
  final int? workMinutes;
  // WFH checkin adds method.
  @override
  final String? method;

  @override
  String toString() {
    return 'CheckinResponseDto(ok: $ok, attendanceId: $attendanceId, gpsScore: $gpsScore, gpsDistanceM: $gpsDistanceM, location: $location, photoSaved: $photoSaved, workMinutes: $workMinutes, method: $method)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckinResponseDtoImpl &&
            (identical(other.ok, ok) || other.ok == ok) &&
            (identical(other.attendanceId, attendanceId) ||
                other.attendanceId == attendanceId) &&
            (identical(other.gpsScore, gpsScore) ||
                other.gpsScore == gpsScore) &&
            (identical(other.gpsDistanceM, gpsDistanceM) ||
                other.gpsDistanceM == gpsDistanceM) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.photoSaved, photoSaved) ||
                other.photoSaved == photoSaved) &&
            (identical(other.workMinutes, workMinutes) ||
                other.workMinutes == workMinutes) &&
            (identical(other.method, method) || other.method == method));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    ok,
    attendanceId,
    gpsScore,
    gpsDistanceM,
    location,
    photoSaved,
    workMinutes,
    method,
  );

  /// Create a copy of CheckinResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckinResponseDtoImplCopyWith<_$CheckinResponseDtoImpl> get copyWith =>
      __$$CheckinResponseDtoImplCopyWithImpl<_$CheckinResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckinResponseDtoImplToJson(this);
  }
}

abstract class _CheckinResponseDto implements CheckinResponseDto {
  const factory _CheckinResponseDto({
    @JsonKey(fromJson: _toBool) required final bool ok,
    @JsonKey(name: 'attendance_id') final int? attendanceId,
    @JsonKey(name: 'gps_score') final double? gpsScore,
    @JsonKey(name: 'gps_distance_m') final double? gpsDistanceM,
    final CheckinLocationDto? location,
    @JsonKey(name: 'photo_saved', fromJson: _toBoolNullable)
    final bool? photoSaved,
    @JsonKey(name: 'work_minutes') final int? workMinutes,
    final String? method,
  }) = _$CheckinResponseDtoImpl;

  factory _CheckinResponseDto.fromJson(Map<String, dynamic> json) =
      _$CheckinResponseDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: _toBool)
  bool get ok;
  @override
  @JsonKey(name: 'attendance_id')
  int? get attendanceId;
  @override
  @JsonKey(name: 'gps_score')
  double? get gpsScore;
  @override
  @JsonKey(name: 'gps_distance_m')
  double? get gpsDistanceM;
  @override
  CheckinLocationDto? get location;
  @override
  @JsonKey(name: 'photo_saved', fromJson: _toBoolNullable)
  bool? get photoSaved; // WFH checkout adds work_minutes.
  @override
  @JsonKey(name: 'work_minutes')
  int? get workMinutes; // WFH checkin adds method.
  @override
  String? get method;

  /// Create a copy of CheckinResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckinResponseDtoImplCopyWith<_$CheckinResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckinLocationDto _$CheckinLocationDtoFromJson(Map<String, dynamic> json) {
  return _CheckinLocationDto.fromJson(json);
}

/// @nodoc
mixin _$CheckinLocationDto {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CheckinLocationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckinLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckinLocationDtoCopyWith<CheckinLocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinLocationDtoCopyWith<$Res> {
  factory $CheckinLocationDtoCopyWith(
    CheckinLocationDto value,
    $Res Function(CheckinLocationDto) then,
  ) = _$CheckinLocationDtoCopyWithImpl<$Res, CheckinLocationDto>;
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class _$CheckinLocationDtoCopyWithImpl<$Res, $Val extends CheckinLocationDto>
    implements $CheckinLocationDtoCopyWith<$Res> {
  _$CheckinLocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckinLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? code = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckinLocationDtoImplCopyWith<$Res>
    implements $CheckinLocationDtoCopyWith<$Res> {
  factory _$$CheckinLocationDtoImplCopyWith(
    _$CheckinLocationDtoImpl value,
    $Res Function(_$CheckinLocationDtoImpl) then,
  ) = __$$CheckinLocationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class __$$CheckinLocationDtoImplCopyWithImpl<$Res>
    extends _$CheckinLocationDtoCopyWithImpl<$Res, _$CheckinLocationDtoImpl>
    implements _$$CheckinLocationDtoImplCopyWith<$Res> {
  __$$CheckinLocationDtoImplCopyWithImpl(
    _$CheckinLocationDtoImpl _value,
    $Res Function(_$CheckinLocationDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckinLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? code = null, Object? name = null}) {
    return _then(
      _$CheckinLocationDtoImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckinLocationDtoImpl implements _CheckinLocationDto {
  const _$CheckinLocationDtoImpl({required this.code, required this.name});

  factory _$CheckinLocationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckinLocationDtoImplFromJson(json);

  @override
  final String code;
  @override
  final String name;

  @override
  String toString() {
    return 'CheckinLocationDto(code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckinLocationDtoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  /// Create a copy of CheckinLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckinLocationDtoImplCopyWith<_$CheckinLocationDtoImpl> get copyWith =>
      __$$CheckinLocationDtoImplCopyWithImpl<_$CheckinLocationDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckinLocationDtoImplToJson(this);
  }
}

abstract class _CheckinLocationDto implements CheckinLocationDto {
  const factory _CheckinLocationDto({
    required final String code,
    required final String name,
  }) = _$CheckinLocationDtoImpl;

  factory _CheckinLocationDto.fromJson(Map<String, dynamic> json) =
      _$CheckinLocationDtoImpl.fromJson;

  @override
  String get code;
  @override
  String get name;

  /// Create a copy of CheckinLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckinLocationDtoImplCopyWith<_$CheckinLocationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
