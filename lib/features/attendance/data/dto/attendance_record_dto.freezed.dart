// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_record_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AttendanceRecordDto _$AttendanceRecordDtoFromJson(Map<String, dynamic> json) {
  return _AttendanceRecordDto.fromJson(json);
}

/// @nodoc
mixin _$AttendanceRecordDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_id')
  int get employeeId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in')
  String? get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_out')
  String? get checkOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in_method')
  String? get checkInMethod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'late_minutes')
  int get lateMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'early_minutes')
  int get earlyMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_minutes')
  int get workMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'ot_minutes')
  int get otMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'working_point')
  double get workingPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'text_symbol')
  String? get textSymbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_status')
  String? get colorStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_name')
  String? get shiftName => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_work_from')
  String? get shiftWorkFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_work_to')
  String? get shiftWorkTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_working_hours')
  double? get actualWorkingHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'ot_hours')
  double? get otHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_lack_working_point', fromJson: _toBoolNullable)
  bool? get isLackWorkingPoint => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  /// Serializes this AttendanceRecordDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceRecordDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceRecordDtoCopyWith<AttendanceRecordDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceRecordDtoCopyWith<$Res> {
  factory $AttendanceRecordDtoCopyWith(
    AttendanceRecordDto value,
    $Res Function(AttendanceRecordDto) then,
  ) = _$AttendanceRecordDtoCopyWithImpl<$Res, AttendanceRecordDto>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'employee_id') int employeeId,
    String date,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
    @JsonKey(name: 'check_in_method') String? checkInMethod,
    String status,
    @JsonKey(name: 'late_minutes') int lateMinutes,
    @JsonKey(name: 'early_minutes') int earlyMinutes,
    @JsonKey(name: 'work_minutes') int workMinutes,
    @JsonKey(name: 'ot_minutes') int otMinutes,
    @JsonKey(name: 'working_point') double workingPoint,
    @JsonKey(name: 'text_symbol') String? textSymbol,
    @JsonKey(name: 'color_status') String? colorStatus,
    @JsonKey(name: 'shift_name') String? shiftName,
    @JsonKey(name: 'shift_work_from') String? shiftWorkFrom,
    @JsonKey(name: 'shift_work_to') String? shiftWorkTo,
    @JsonKey(name: 'actual_working_hours') double? actualWorkingHours,
    @JsonKey(name: 'ot_hours') double? otHours,
    @JsonKey(name: 'is_lack_working_point', fromJson: _toBoolNullable)
    bool? isLackWorkingPoint,
    String note,
  });
}

/// @nodoc
class _$AttendanceRecordDtoCopyWithImpl<$Res, $Val extends AttendanceRecordDto>
    implements $AttendanceRecordDtoCopyWith<$Res> {
  _$AttendanceRecordDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceRecordDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? date = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? checkInMethod = freezed,
    Object? status = null,
    Object? lateMinutes = null,
    Object? earlyMinutes = null,
    Object? workMinutes = null,
    Object? otMinutes = null,
    Object? workingPoint = null,
    Object? textSymbol = freezed,
    Object? colorStatus = freezed,
    Object? shiftName = freezed,
    Object? shiftWorkFrom = freezed,
    Object? shiftWorkTo = freezed,
    Object? actualWorkingHours = freezed,
    Object? otHours = freezed,
    Object? isLackWorkingPoint = freezed,
    Object? note = null,
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
            checkInMethod: freezed == checkInMethod
                ? _value.checkInMethod
                : checkInMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            lateMinutes: null == lateMinutes
                ? _value.lateMinutes
                : lateMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            earlyMinutes: null == earlyMinutes
                ? _value.earlyMinutes
                : earlyMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            workMinutes: null == workMinutes
                ? _value.workMinutes
                : workMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            otMinutes: null == otMinutes
                ? _value.otMinutes
                : otMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            workingPoint: null == workingPoint
                ? _value.workingPoint
                : workingPoint // ignore: cast_nullable_to_non_nullable
                      as double,
            textSymbol: freezed == textSymbol
                ? _value.textSymbol
                : textSymbol // ignore: cast_nullable_to_non_nullable
                      as String?,
            colorStatus: freezed == colorStatus
                ? _value.colorStatus
                : colorStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            shiftName: freezed == shiftName
                ? _value.shiftName
                : shiftName // ignore: cast_nullable_to_non_nullable
                      as String?,
            shiftWorkFrom: freezed == shiftWorkFrom
                ? _value.shiftWorkFrom
                : shiftWorkFrom // ignore: cast_nullable_to_non_nullable
                      as String?,
            shiftWorkTo: freezed == shiftWorkTo
                ? _value.shiftWorkTo
                : shiftWorkTo // ignore: cast_nullable_to_non_nullable
                      as String?,
            actualWorkingHours: freezed == actualWorkingHours
                ? _value.actualWorkingHours
                : actualWorkingHours // ignore: cast_nullable_to_non_nullable
                      as double?,
            otHours: freezed == otHours
                ? _value.otHours
                : otHours // ignore: cast_nullable_to_non_nullable
                      as double?,
            isLackWorkingPoint: freezed == isLackWorkingPoint
                ? _value.isLackWorkingPoint
                : isLackWorkingPoint // ignore: cast_nullable_to_non_nullable
                      as bool?,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttendanceRecordDtoImplCopyWith<$Res>
    implements $AttendanceRecordDtoCopyWith<$Res> {
  factory _$$AttendanceRecordDtoImplCopyWith(
    _$AttendanceRecordDtoImpl value,
    $Res Function(_$AttendanceRecordDtoImpl) then,
  ) = __$$AttendanceRecordDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'employee_id') int employeeId,
    String date,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
    @JsonKey(name: 'check_in_method') String? checkInMethod,
    String status,
    @JsonKey(name: 'late_minutes') int lateMinutes,
    @JsonKey(name: 'early_minutes') int earlyMinutes,
    @JsonKey(name: 'work_minutes') int workMinutes,
    @JsonKey(name: 'ot_minutes') int otMinutes,
    @JsonKey(name: 'working_point') double workingPoint,
    @JsonKey(name: 'text_symbol') String? textSymbol,
    @JsonKey(name: 'color_status') String? colorStatus,
    @JsonKey(name: 'shift_name') String? shiftName,
    @JsonKey(name: 'shift_work_from') String? shiftWorkFrom,
    @JsonKey(name: 'shift_work_to') String? shiftWorkTo,
    @JsonKey(name: 'actual_working_hours') double? actualWorkingHours,
    @JsonKey(name: 'ot_hours') double? otHours,
    @JsonKey(name: 'is_lack_working_point', fromJson: _toBoolNullable)
    bool? isLackWorkingPoint,
    String note,
  });
}

/// @nodoc
class __$$AttendanceRecordDtoImplCopyWithImpl<$Res>
    extends _$AttendanceRecordDtoCopyWithImpl<$Res, _$AttendanceRecordDtoImpl>
    implements _$$AttendanceRecordDtoImplCopyWith<$Res> {
  __$$AttendanceRecordDtoImplCopyWithImpl(
    _$AttendanceRecordDtoImpl _value,
    $Res Function(_$AttendanceRecordDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AttendanceRecordDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? date = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? checkInMethod = freezed,
    Object? status = null,
    Object? lateMinutes = null,
    Object? earlyMinutes = null,
    Object? workMinutes = null,
    Object? otMinutes = null,
    Object? workingPoint = null,
    Object? textSymbol = freezed,
    Object? colorStatus = freezed,
    Object? shiftName = freezed,
    Object? shiftWorkFrom = freezed,
    Object? shiftWorkTo = freezed,
    Object? actualWorkingHours = freezed,
    Object? otHours = freezed,
    Object? isLackWorkingPoint = freezed,
    Object? note = null,
  }) {
    return _then(
      _$AttendanceRecordDtoImpl(
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
        checkInMethod: freezed == checkInMethod
            ? _value.checkInMethod
            : checkInMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        lateMinutes: null == lateMinutes
            ? _value.lateMinutes
            : lateMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        earlyMinutes: null == earlyMinutes
            ? _value.earlyMinutes
            : earlyMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        workMinutes: null == workMinutes
            ? _value.workMinutes
            : workMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        otMinutes: null == otMinutes
            ? _value.otMinutes
            : otMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        workingPoint: null == workingPoint
            ? _value.workingPoint
            : workingPoint // ignore: cast_nullable_to_non_nullable
                  as double,
        textSymbol: freezed == textSymbol
            ? _value.textSymbol
            : textSymbol // ignore: cast_nullable_to_non_nullable
                  as String?,
        colorStatus: freezed == colorStatus
            ? _value.colorStatus
            : colorStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        shiftName: freezed == shiftName
            ? _value.shiftName
            : shiftName // ignore: cast_nullable_to_non_nullable
                  as String?,
        shiftWorkFrom: freezed == shiftWorkFrom
            ? _value.shiftWorkFrom
            : shiftWorkFrom // ignore: cast_nullable_to_non_nullable
                  as String?,
        shiftWorkTo: freezed == shiftWorkTo
            ? _value.shiftWorkTo
            : shiftWorkTo // ignore: cast_nullable_to_non_nullable
                  as String?,
        actualWorkingHours: freezed == actualWorkingHours
            ? _value.actualWorkingHours
            : actualWorkingHours // ignore: cast_nullable_to_non_nullable
                  as double?,
        otHours: freezed == otHours
            ? _value.otHours
            : otHours // ignore: cast_nullable_to_non_nullable
                  as double?,
        isLackWorkingPoint: freezed == isLackWorkingPoint
            ? _value.isLackWorkingPoint
            : isLackWorkingPoint // ignore: cast_nullable_to_non_nullable
                  as bool?,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceRecordDtoImpl implements _AttendanceRecordDto {
  const _$AttendanceRecordDtoImpl({
    required this.id,
    @JsonKey(name: 'employee_id') required this.employeeId,
    required this.date,
    @JsonKey(name: 'check_in') this.checkIn,
    @JsonKey(name: 'check_out') this.checkOut,
    @JsonKey(name: 'check_in_method') this.checkInMethod,
    required this.status,
    @JsonKey(name: 'late_minutes') this.lateMinutes = 0,
    @JsonKey(name: 'early_minutes') this.earlyMinutes = 0,
    @JsonKey(name: 'work_minutes') this.workMinutes = 0,
    @JsonKey(name: 'ot_minutes') this.otMinutes = 0,
    @JsonKey(name: 'working_point') this.workingPoint = 0,
    @JsonKey(name: 'text_symbol') this.textSymbol,
    @JsonKey(name: 'color_status') this.colorStatus,
    @JsonKey(name: 'shift_name') this.shiftName,
    @JsonKey(name: 'shift_work_from') this.shiftWorkFrom,
    @JsonKey(name: 'shift_work_to') this.shiftWorkTo,
    @JsonKey(name: 'actual_working_hours') this.actualWorkingHours,
    @JsonKey(name: 'ot_hours') this.otHours,
    @JsonKey(name: 'is_lack_working_point', fromJson: _toBoolNullable)
    this.isLackWorkingPoint,
    this.note = '',
  });

  factory _$AttendanceRecordDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceRecordDtoImplFromJson(json);

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
  @JsonKey(name: 'check_in_method')
  final String? checkInMethod;
  @override
  final String status;
  @override
  @JsonKey(name: 'late_minutes')
  final int lateMinutes;
  @override
  @JsonKey(name: 'early_minutes')
  final int earlyMinutes;
  @override
  @JsonKey(name: 'work_minutes')
  final int workMinutes;
  @override
  @JsonKey(name: 'ot_minutes')
  final int otMinutes;
  @override
  @JsonKey(name: 'working_point')
  final double workingPoint;
  @override
  @JsonKey(name: 'text_symbol')
  final String? textSymbol;
  @override
  @JsonKey(name: 'color_status')
  final String? colorStatus;
  @override
  @JsonKey(name: 'shift_name')
  final String? shiftName;
  @override
  @JsonKey(name: 'shift_work_from')
  final String? shiftWorkFrom;
  @override
  @JsonKey(name: 'shift_work_to')
  final String? shiftWorkTo;
  @override
  @JsonKey(name: 'actual_working_hours')
  final double? actualWorkingHours;
  @override
  @JsonKey(name: 'ot_hours')
  final double? otHours;
  @override
  @JsonKey(name: 'is_lack_working_point', fromJson: _toBoolNullable)
  final bool? isLackWorkingPoint;
  @override
  @JsonKey()
  final String note;

  @override
  String toString() {
    return 'AttendanceRecordDto(id: $id, employeeId: $employeeId, date: $date, checkIn: $checkIn, checkOut: $checkOut, checkInMethod: $checkInMethod, status: $status, lateMinutes: $lateMinutes, earlyMinutes: $earlyMinutes, workMinutes: $workMinutes, otMinutes: $otMinutes, workingPoint: $workingPoint, textSymbol: $textSymbol, colorStatus: $colorStatus, shiftName: $shiftName, shiftWorkFrom: $shiftWorkFrom, shiftWorkTo: $shiftWorkTo, actualWorkingHours: $actualWorkingHours, otHours: $otHours, isLackWorkingPoint: $isLackWorkingPoint, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceRecordDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.checkInMethod, checkInMethod) ||
                other.checkInMethod == checkInMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lateMinutes, lateMinutes) ||
                other.lateMinutes == lateMinutes) &&
            (identical(other.earlyMinutes, earlyMinutes) ||
                other.earlyMinutes == earlyMinutes) &&
            (identical(other.workMinutes, workMinutes) ||
                other.workMinutes == workMinutes) &&
            (identical(other.otMinutes, otMinutes) ||
                other.otMinutes == otMinutes) &&
            (identical(other.workingPoint, workingPoint) ||
                other.workingPoint == workingPoint) &&
            (identical(other.textSymbol, textSymbol) ||
                other.textSymbol == textSymbol) &&
            (identical(other.colorStatus, colorStatus) ||
                other.colorStatus == colorStatus) &&
            (identical(other.shiftName, shiftName) ||
                other.shiftName == shiftName) &&
            (identical(other.shiftWorkFrom, shiftWorkFrom) ||
                other.shiftWorkFrom == shiftWorkFrom) &&
            (identical(other.shiftWorkTo, shiftWorkTo) ||
                other.shiftWorkTo == shiftWorkTo) &&
            (identical(other.actualWorkingHours, actualWorkingHours) ||
                other.actualWorkingHours == actualWorkingHours) &&
            (identical(other.otHours, otHours) || other.otHours == otHours) &&
            (identical(other.isLackWorkingPoint, isLackWorkingPoint) ||
                other.isLackWorkingPoint == isLackWorkingPoint) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    employeeId,
    date,
    checkIn,
    checkOut,
    checkInMethod,
    status,
    lateMinutes,
    earlyMinutes,
    workMinutes,
    otMinutes,
    workingPoint,
    textSymbol,
    colorStatus,
    shiftName,
    shiftWorkFrom,
    shiftWorkTo,
    actualWorkingHours,
    otHours,
    isLackWorkingPoint,
    note,
  ]);

  /// Create a copy of AttendanceRecordDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceRecordDtoImplCopyWith<_$AttendanceRecordDtoImpl> get copyWith =>
      __$$AttendanceRecordDtoImplCopyWithImpl<_$AttendanceRecordDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceRecordDtoImplToJson(this);
  }
}

abstract class _AttendanceRecordDto implements AttendanceRecordDto {
  const factory _AttendanceRecordDto({
    required final int id,
    @JsonKey(name: 'employee_id') required final int employeeId,
    required final String date,
    @JsonKey(name: 'check_in') final String? checkIn,
    @JsonKey(name: 'check_out') final String? checkOut,
    @JsonKey(name: 'check_in_method') final String? checkInMethod,
    required final String status,
    @JsonKey(name: 'late_minutes') final int lateMinutes,
    @JsonKey(name: 'early_minutes') final int earlyMinutes,
    @JsonKey(name: 'work_minutes') final int workMinutes,
    @JsonKey(name: 'ot_minutes') final int otMinutes,
    @JsonKey(name: 'working_point') final double workingPoint,
    @JsonKey(name: 'text_symbol') final String? textSymbol,
    @JsonKey(name: 'color_status') final String? colorStatus,
    @JsonKey(name: 'shift_name') final String? shiftName,
    @JsonKey(name: 'shift_work_from') final String? shiftWorkFrom,
    @JsonKey(name: 'shift_work_to') final String? shiftWorkTo,
    @JsonKey(name: 'actual_working_hours') final double? actualWorkingHours,
    @JsonKey(name: 'ot_hours') final double? otHours,
    @JsonKey(name: 'is_lack_working_point', fromJson: _toBoolNullable)
    final bool? isLackWorkingPoint,
    final String note,
  }) = _$AttendanceRecordDtoImpl;

  factory _AttendanceRecordDto.fromJson(Map<String, dynamic> json) =
      _$AttendanceRecordDtoImpl.fromJson;

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
  @JsonKey(name: 'check_in_method')
  String? get checkInMethod;
  @override
  String get status;
  @override
  @JsonKey(name: 'late_minutes')
  int get lateMinutes;
  @override
  @JsonKey(name: 'early_minutes')
  int get earlyMinutes;
  @override
  @JsonKey(name: 'work_minutes')
  int get workMinutes;
  @override
  @JsonKey(name: 'ot_minutes')
  int get otMinutes;
  @override
  @JsonKey(name: 'working_point')
  double get workingPoint;
  @override
  @JsonKey(name: 'text_symbol')
  String? get textSymbol;
  @override
  @JsonKey(name: 'color_status')
  String? get colorStatus;
  @override
  @JsonKey(name: 'shift_name')
  String? get shiftName;
  @override
  @JsonKey(name: 'shift_work_from')
  String? get shiftWorkFrom;
  @override
  @JsonKey(name: 'shift_work_to')
  String? get shiftWorkTo;
  @override
  @JsonKey(name: 'actual_working_hours')
  double? get actualWorkingHours;
  @override
  @JsonKey(name: 'ot_hours')
  double? get otHours;
  @override
  @JsonKey(name: 'is_lack_working_point', fromJson: _toBoolNullable)
  bool? get isLackWorkingPoint;
  @override
  String get note;

  /// Create a copy of AttendanceRecordDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceRecordDtoImplCopyWith<_$AttendanceRecordDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
