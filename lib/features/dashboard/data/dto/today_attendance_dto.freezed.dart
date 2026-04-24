// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_attendance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodayAttendanceDto _$TodayAttendanceDtoFromJson(Map<String, dynamic> json) {
  return _TodayAttendanceDto.fromJson(json);
}

/// @nodoc
mixin _$TodayAttendanceDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_id')
  int get employeeId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in')
  String? get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_out')
  String? get checkOut => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'working_point')
  double? get workingPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_name')
  String? get shiftName => throw _privateConstructorUsedError;
  @JsonKey(name: 'late_minutes')
  int? get lateMinutes => throw _privateConstructorUsedError;

  /// Serializes this TodayAttendanceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayAttendanceDtoCopyWith<TodayAttendanceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayAttendanceDtoCopyWith<$Res> {
  factory $TodayAttendanceDtoCopyWith(
    TodayAttendanceDto value,
    $Res Function(TodayAttendanceDto) then,
  ) = _$TodayAttendanceDtoCopyWithImpl<$Res, TodayAttendanceDto>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'employee_id') int employeeId,
    String date,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
    String status,
    @JsonKey(name: 'working_point') double? workingPoint,
    @JsonKey(name: 'shift_name') String? shiftName,
    @JsonKey(name: 'late_minutes') int? lateMinutes,
  });
}

/// @nodoc
class _$TodayAttendanceDtoCopyWithImpl<$Res, $Val extends TodayAttendanceDto>
    implements $TodayAttendanceDtoCopyWith<$Res> {
  _$TodayAttendanceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? date = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? status = null,
    Object? workingPoint = freezed,
    Object? shiftName = freezed,
    Object? lateMinutes = freezed,
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
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            checkIn: freezed == checkIn
                ? _value.checkIn
                : checkIn // ignore: cast_nullable_to_non_nullable
                      as String?,
            checkOut: freezed == checkOut
                ? _value.checkOut
                : checkOut // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            workingPoint: freezed == workingPoint
                ? _value.workingPoint
                : workingPoint // ignore: cast_nullable_to_non_nullable
                      as double?,
            shiftName: freezed == shiftName
                ? _value.shiftName
                : shiftName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lateMinutes: freezed == lateMinutes
                ? _value.lateMinutes
                : lateMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodayAttendanceDtoImplCopyWith<$Res>
    implements $TodayAttendanceDtoCopyWith<$Res> {
  factory _$$TodayAttendanceDtoImplCopyWith(
    _$TodayAttendanceDtoImpl value,
    $Res Function(_$TodayAttendanceDtoImpl) then,
  ) = __$$TodayAttendanceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'employee_id') int employeeId,
    String date,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
    String status,
    @JsonKey(name: 'working_point') double? workingPoint,
    @JsonKey(name: 'shift_name') String? shiftName,
    @JsonKey(name: 'late_minutes') int? lateMinutes,
  });
}

/// @nodoc
class __$$TodayAttendanceDtoImplCopyWithImpl<$Res>
    extends _$TodayAttendanceDtoCopyWithImpl<$Res, _$TodayAttendanceDtoImpl>
    implements _$$TodayAttendanceDtoImplCopyWith<$Res> {
  __$$TodayAttendanceDtoImplCopyWithImpl(
    _$TodayAttendanceDtoImpl _value,
    $Res Function(_$TodayAttendanceDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodayAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? date = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? status = null,
    Object? workingPoint = freezed,
    Object? shiftName = freezed,
    Object? lateMinutes = freezed,
  }) {
    return _then(
      _$TodayAttendanceDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        employeeId: null == employeeId
            ? _value.employeeId
            : employeeId // ignore: cast_nullable_to_non_nullable
                  as int,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        checkIn: freezed == checkIn
            ? _value.checkIn
            : checkIn // ignore: cast_nullable_to_non_nullable
                  as String?,
        checkOut: freezed == checkOut
            ? _value.checkOut
            : checkOut // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        workingPoint: freezed == workingPoint
            ? _value.workingPoint
            : workingPoint // ignore: cast_nullable_to_non_nullable
                  as double?,
        shiftName: freezed == shiftName
            ? _value.shiftName
            : shiftName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lateMinutes: freezed == lateMinutes
            ? _value.lateMinutes
            : lateMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayAttendanceDtoImpl implements _TodayAttendanceDto {
  const _$TodayAttendanceDtoImpl({
    required this.id,
    @JsonKey(name: 'employee_id') required this.employeeId,
    required this.date,
    @JsonKey(name: 'check_in') this.checkIn,
    @JsonKey(name: 'check_out') this.checkOut,
    required this.status,
    @JsonKey(name: 'working_point') this.workingPoint,
    @JsonKey(name: 'shift_name') this.shiftName,
    @JsonKey(name: 'late_minutes') this.lateMinutes,
  });

  factory _$TodayAttendanceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayAttendanceDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'employee_id')
  final int employeeId;
  @override
  final String date;
  @override
  @JsonKey(name: 'check_in')
  final String? checkIn;
  @override
  @JsonKey(name: 'check_out')
  final String? checkOut;
  @override
  final String status;
  @override
  @JsonKey(name: 'working_point')
  final double? workingPoint;
  @override
  @JsonKey(name: 'shift_name')
  final String? shiftName;
  @override
  @JsonKey(name: 'late_minutes')
  final int? lateMinutes;

  @override
  String toString() {
    return 'TodayAttendanceDto(id: $id, employeeId: $employeeId, date: $date, checkIn: $checkIn, checkOut: $checkOut, status: $status, workingPoint: $workingPoint, shiftName: $shiftName, lateMinutes: $lateMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayAttendanceDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.workingPoint, workingPoint) ||
                other.workingPoint == workingPoint) &&
            (identical(other.shiftName, shiftName) ||
                other.shiftName == shiftName) &&
            (identical(other.lateMinutes, lateMinutes) ||
                other.lateMinutes == lateMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    employeeId,
    date,
    checkIn,
    checkOut,
    status,
    workingPoint,
    shiftName,
    lateMinutes,
  );

  /// Create a copy of TodayAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayAttendanceDtoImplCopyWith<_$TodayAttendanceDtoImpl> get copyWith =>
      __$$TodayAttendanceDtoImplCopyWithImpl<_$TodayAttendanceDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayAttendanceDtoImplToJson(this);
  }
}

abstract class _TodayAttendanceDto implements TodayAttendanceDto {
  const factory _TodayAttendanceDto({
    required final int id,
    @JsonKey(name: 'employee_id') required final int employeeId,
    required final String date,
    @JsonKey(name: 'check_in') final String? checkIn,
    @JsonKey(name: 'check_out') final String? checkOut,
    required final String status,
    @JsonKey(name: 'working_point') final double? workingPoint,
    @JsonKey(name: 'shift_name') final String? shiftName,
    @JsonKey(name: 'late_minutes') final int? lateMinutes,
  }) = _$TodayAttendanceDtoImpl;

  factory _TodayAttendanceDto.fromJson(Map<String, dynamic> json) =
      _$TodayAttendanceDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'employee_id')
  int get employeeId;
  @override
  String get date;
  @override
  @JsonKey(name: 'check_in')
  String? get checkIn;
  @override
  @JsonKey(name: 'check_out')
  String? get checkOut;
  @override
  String get status;
  @override
  @JsonKey(name: 'working_point')
  double? get workingPoint;
  @override
  @JsonKey(name: 'shift_name')
  String? get shiftName;
  @override
  @JsonKey(name: 'late_minutes')
  int? get lateMinutes;

  /// Create a copy of TodayAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayAttendanceDtoImplCopyWith<_$TodayAttendanceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
