// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_attendance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MonthlyAttendanceDto _$MonthlyAttendanceDtoFromJson(Map<String, dynamic> json) {
  return _MonthlyAttendanceDto.fromJson(json);
}

/// @nodoc
mixin _$MonthlyAttendanceDto {
  List<MonthlyDayDto> get rows => throw _privateConstructorUsedError;
  MonthlySummaryDto? get summary => throw _privateConstructorUsedError;

  /// Serializes this MonthlyAttendanceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyAttendanceDtoCopyWith<MonthlyAttendanceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyAttendanceDtoCopyWith<$Res> {
  factory $MonthlyAttendanceDtoCopyWith(
    MonthlyAttendanceDto value,
    $Res Function(MonthlyAttendanceDto) then,
  ) = _$MonthlyAttendanceDtoCopyWithImpl<$Res, MonthlyAttendanceDto>;
  @useResult
  $Res call({List<MonthlyDayDto> rows, MonthlySummaryDto? summary});

  $MonthlySummaryDtoCopyWith<$Res>? get summary;
}

/// @nodoc
class _$MonthlyAttendanceDtoCopyWithImpl<
  $Res,
  $Val extends MonthlyAttendanceDto
>
    implements $MonthlyAttendanceDtoCopyWith<$Res> {
  _$MonthlyAttendanceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rows = null, Object? summary = freezed}) {
    return _then(
      _value.copyWith(
            rows: null == rows
                ? _value.rows
                : rows // ignore: cast_nullable_to_non_nullable
                      as List<MonthlyDayDto>,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as MonthlySummaryDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of MonthlyAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonthlySummaryDtoCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $MonthlySummaryDtoCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonthlyAttendanceDtoImplCopyWith<$Res>
    implements $MonthlyAttendanceDtoCopyWith<$Res> {
  factory _$$MonthlyAttendanceDtoImplCopyWith(
    _$MonthlyAttendanceDtoImpl value,
    $Res Function(_$MonthlyAttendanceDtoImpl) then,
  ) = __$$MonthlyAttendanceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MonthlyDayDto> rows, MonthlySummaryDto? summary});

  @override
  $MonthlySummaryDtoCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$MonthlyAttendanceDtoImplCopyWithImpl<$Res>
    extends _$MonthlyAttendanceDtoCopyWithImpl<$Res, _$MonthlyAttendanceDtoImpl>
    implements _$$MonthlyAttendanceDtoImplCopyWith<$Res> {
  __$$MonthlyAttendanceDtoImplCopyWithImpl(
    _$MonthlyAttendanceDtoImpl _value,
    $Res Function(_$MonthlyAttendanceDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rows = null, Object? summary = freezed}) {
    return _then(
      _$MonthlyAttendanceDtoImpl(
        rows: null == rows
            ? _value._rows
            : rows // ignore: cast_nullable_to_non_nullable
                  as List<MonthlyDayDto>,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as MonthlySummaryDto?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyAttendanceDtoImpl implements _MonthlyAttendanceDto {
  const _$MonthlyAttendanceDtoImpl({
    final List<MonthlyDayDto> rows = const [],
    this.summary,
  }) : _rows = rows;

  factory _$MonthlyAttendanceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyAttendanceDtoImplFromJson(json);

  final List<MonthlyDayDto> _rows;
  @override
  @JsonKey()
  List<MonthlyDayDto> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  @override
  final MonthlySummaryDto? summary;

  @override
  String toString() {
    return 'MonthlyAttendanceDto(rows: $rows, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyAttendanceDtoImpl &&
            const DeepCollectionEquality().equals(other._rows, _rows) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_rows),
    summary,
  );

  /// Create a copy of MonthlyAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyAttendanceDtoImplCopyWith<_$MonthlyAttendanceDtoImpl>
  get copyWith =>
      __$$MonthlyAttendanceDtoImplCopyWithImpl<_$MonthlyAttendanceDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyAttendanceDtoImplToJson(this);
  }
}

abstract class _MonthlyAttendanceDto implements MonthlyAttendanceDto {
  const factory _MonthlyAttendanceDto({
    final List<MonthlyDayDto> rows,
    final MonthlySummaryDto? summary,
  }) = _$MonthlyAttendanceDtoImpl;

  factory _MonthlyAttendanceDto.fromJson(Map<String, dynamic> json) =
      _$MonthlyAttendanceDtoImpl.fromJson;

  @override
  List<MonthlyDayDto> get rows;
  @override
  MonthlySummaryDto? get summary;

  /// Create a copy of MonthlyAttendanceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyAttendanceDtoImplCopyWith<_$MonthlyAttendanceDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MonthlyDayDto _$MonthlyDayDtoFromJson(Map<String, dynamic> json) {
  return _MonthlyDayDto.fromJson(json);
}

/// @nodoc
mixin _$MonthlyDayDto {
  String get date => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in')
  String? get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_out')
  String? get checkOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'late_minutes')
  int get lateMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_minutes')
  int get workMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'ot_minutes')
  int get otMinutes => throw _privateConstructorUsedError;

  /// Serializes this MonthlyDayDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyDayDtoCopyWith<MonthlyDayDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyDayDtoCopyWith<$Res> {
  factory $MonthlyDayDtoCopyWith(
    MonthlyDayDto value,
    $Res Function(MonthlyDayDto) then,
  ) = _$MonthlyDayDtoCopyWithImpl<$Res, MonthlyDayDto>;
  @useResult
  $Res call({
    String date,
    String status,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
    @JsonKey(name: 'late_minutes') int lateMinutes,
    @JsonKey(name: 'work_minutes') int workMinutes,
    @JsonKey(name: 'ot_minutes') int otMinutes,
  });
}

/// @nodoc
class _$MonthlyDayDtoCopyWithImpl<$Res, $Val extends MonthlyDayDto>
    implements $MonthlyDayDtoCopyWith<$Res> {
  _$MonthlyDayDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? status = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? lateMinutes = null,
    Object? workMinutes = null,
    Object? otMinutes = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            checkIn: freezed == checkIn
                ? _value.checkIn
                : checkIn // ignore: cast_nullable_to_non_nullable
                      as String?,
            checkOut: freezed == checkOut
                ? _value.checkOut
                : checkOut // ignore: cast_nullable_to_non_nullable
                      as String?,
            lateMinutes: null == lateMinutes
                ? _value.lateMinutes
                : lateMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            workMinutes: null == workMinutes
                ? _value.workMinutes
                : workMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            otMinutes: null == otMinutes
                ? _value.otMinutes
                : otMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlyDayDtoImplCopyWith<$Res>
    implements $MonthlyDayDtoCopyWith<$Res> {
  factory _$$MonthlyDayDtoImplCopyWith(
    _$MonthlyDayDtoImpl value,
    $Res Function(_$MonthlyDayDtoImpl) then,
  ) = __$$MonthlyDayDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String date,
    String status,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
    @JsonKey(name: 'late_minutes') int lateMinutes,
    @JsonKey(name: 'work_minutes') int workMinutes,
    @JsonKey(name: 'ot_minutes') int otMinutes,
  });
}

/// @nodoc
class __$$MonthlyDayDtoImplCopyWithImpl<$Res>
    extends _$MonthlyDayDtoCopyWithImpl<$Res, _$MonthlyDayDtoImpl>
    implements _$$MonthlyDayDtoImplCopyWith<$Res> {
  __$$MonthlyDayDtoImplCopyWithImpl(
    _$MonthlyDayDtoImpl _value,
    $Res Function(_$MonthlyDayDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? status = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? lateMinutes = null,
    Object? workMinutes = null,
    Object? otMinutes = null,
  }) {
    return _then(
      _$MonthlyDayDtoImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        checkIn: freezed == checkIn
            ? _value.checkIn
            : checkIn // ignore: cast_nullable_to_non_nullable
                  as String?,
        checkOut: freezed == checkOut
            ? _value.checkOut
            : checkOut // ignore: cast_nullable_to_non_nullable
                  as String?,
        lateMinutes: null == lateMinutes
            ? _value.lateMinutes
            : lateMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        workMinutes: null == workMinutes
            ? _value.workMinutes
            : workMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        otMinutes: null == otMinutes
            ? _value.otMinutes
            : otMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyDayDtoImpl implements _MonthlyDayDto {
  const _$MonthlyDayDtoImpl({
    required this.date,
    required this.status,
    @JsonKey(name: 'check_in') this.checkIn,
    @JsonKey(name: 'check_out') this.checkOut,
    @JsonKey(name: 'late_minutes') this.lateMinutes = 0,
    @JsonKey(name: 'work_minutes') this.workMinutes = 0,
    @JsonKey(name: 'ot_minutes') this.otMinutes = 0,
  });

  factory _$MonthlyDayDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyDayDtoImplFromJson(json);

  @override
  final String date;
  @override
  final String status;
  @override
  @JsonKey(name: 'check_in')
  final String? checkIn;
  @override
  @JsonKey(name: 'check_out')
  final String? checkOut;
  @override
  @JsonKey(name: 'late_minutes')
  final int lateMinutes;
  @override
  @JsonKey(name: 'work_minutes')
  final int workMinutes;
  @override
  @JsonKey(name: 'ot_minutes')
  final int otMinutes;

  @override
  String toString() {
    return 'MonthlyDayDto(date: $date, status: $status, checkIn: $checkIn, checkOut: $checkOut, lateMinutes: $lateMinutes, workMinutes: $workMinutes, otMinutes: $otMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyDayDtoImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.lateMinutes, lateMinutes) ||
                other.lateMinutes == lateMinutes) &&
            (identical(other.workMinutes, workMinutes) ||
                other.workMinutes == workMinutes) &&
            (identical(other.otMinutes, otMinutes) ||
                other.otMinutes == otMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    status,
    checkIn,
    checkOut,
    lateMinutes,
    workMinutes,
    otMinutes,
  );

  /// Create a copy of MonthlyDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyDayDtoImplCopyWith<_$MonthlyDayDtoImpl> get copyWith =>
      __$$MonthlyDayDtoImplCopyWithImpl<_$MonthlyDayDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyDayDtoImplToJson(this);
  }
}

abstract class _MonthlyDayDto implements MonthlyDayDto {
  const factory _MonthlyDayDto({
    required final String date,
    required final String status,
    @JsonKey(name: 'check_in') final String? checkIn,
    @JsonKey(name: 'check_out') final String? checkOut,
    @JsonKey(name: 'late_minutes') final int lateMinutes,
    @JsonKey(name: 'work_minutes') final int workMinutes,
    @JsonKey(name: 'ot_minutes') final int otMinutes,
  }) = _$MonthlyDayDtoImpl;

  factory _MonthlyDayDto.fromJson(Map<String, dynamic> json) =
      _$MonthlyDayDtoImpl.fromJson;

  @override
  String get date;
  @override
  String get status;
  @override
  @JsonKey(name: 'check_in')
  String? get checkIn;
  @override
  @JsonKey(name: 'check_out')
  String? get checkOut;
  @override
  @JsonKey(name: 'late_minutes')
  int get lateMinutes;
  @override
  @JsonKey(name: 'work_minutes')
  int get workMinutes;
  @override
  @JsonKey(name: 'ot_minutes')
  int get otMinutes;

  /// Create a copy of MonthlyDayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyDayDtoImplCopyWith<_$MonthlyDayDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlySummaryDto _$MonthlySummaryDtoFromJson(Map<String, dynamic> json) {
  return _MonthlySummaryDto.fromJson(json);
}

/// @nodoc
mixin _$MonthlySummaryDto {
  @JsonKey(name: 'total_days')
  int get totalDays => throw _privateConstructorUsedError;
  int get present => throw _privateConstructorUsedError;
  int get late => throw _privateConstructorUsedError;
  int get absent => throw _privateConstructorUsedError;
  int get leave => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_work_minutes')
  int get totalWorkMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_ot_minutes')
  int get totalOtMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_late_minutes')
  int get totalLateMinutes => throw _privateConstructorUsedError;

  /// Serializes this MonthlySummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlySummaryDtoCopyWith<MonthlySummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySummaryDtoCopyWith<$Res> {
  factory $MonthlySummaryDtoCopyWith(
    MonthlySummaryDto value,
    $Res Function(MonthlySummaryDto) then,
  ) = _$MonthlySummaryDtoCopyWithImpl<$Res, MonthlySummaryDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'total_days') int totalDays,
    int present,
    int late,
    int absent,
    int leave,
    @JsonKey(name: 'total_work_minutes') int totalWorkMinutes,
    @JsonKey(name: 'total_ot_minutes') int totalOtMinutes,
    @JsonKey(name: 'total_late_minutes') int totalLateMinutes,
  });
}

/// @nodoc
class _$MonthlySummaryDtoCopyWithImpl<$Res, $Val extends MonthlySummaryDto>
    implements $MonthlySummaryDtoCopyWith<$Res> {
  _$MonthlySummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDays = null,
    Object? present = null,
    Object? late = null,
    Object? absent = null,
    Object? leave = null,
    Object? totalWorkMinutes = null,
    Object? totalOtMinutes = null,
    Object? totalLateMinutes = null,
  }) {
    return _then(
      _value.copyWith(
            totalDays: null == totalDays
                ? _value.totalDays
                : totalDays // ignore: cast_nullable_to_non_nullable
                      as int,
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
            leave: null == leave
                ? _value.leave
                : leave // ignore: cast_nullable_to_non_nullable
                      as int,
            totalWorkMinutes: null == totalWorkMinutes
                ? _value.totalWorkMinutes
                : totalWorkMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            totalOtMinutes: null == totalOtMinutes
                ? _value.totalOtMinutes
                : totalOtMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            totalLateMinutes: null == totalLateMinutes
                ? _value.totalLateMinutes
                : totalLateMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlySummaryDtoImplCopyWith<$Res>
    implements $MonthlySummaryDtoCopyWith<$Res> {
  factory _$$MonthlySummaryDtoImplCopyWith(
    _$MonthlySummaryDtoImpl value,
    $Res Function(_$MonthlySummaryDtoImpl) then,
  ) = __$$MonthlySummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_days') int totalDays,
    int present,
    int late,
    int absent,
    int leave,
    @JsonKey(name: 'total_work_minutes') int totalWorkMinutes,
    @JsonKey(name: 'total_ot_minutes') int totalOtMinutes,
    @JsonKey(name: 'total_late_minutes') int totalLateMinutes,
  });
}

/// @nodoc
class __$$MonthlySummaryDtoImplCopyWithImpl<$Res>
    extends _$MonthlySummaryDtoCopyWithImpl<$Res, _$MonthlySummaryDtoImpl>
    implements _$$MonthlySummaryDtoImplCopyWith<$Res> {
  __$$MonthlySummaryDtoImplCopyWithImpl(
    _$MonthlySummaryDtoImpl _value,
    $Res Function(_$MonthlySummaryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDays = null,
    Object? present = null,
    Object? late = null,
    Object? absent = null,
    Object? leave = null,
    Object? totalWorkMinutes = null,
    Object? totalOtMinutes = null,
    Object? totalLateMinutes = null,
  }) {
    return _then(
      _$MonthlySummaryDtoImpl(
        totalDays: null == totalDays
            ? _value.totalDays
            : totalDays // ignore: cast_nullable_to_non_nullable
                  as int,
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
        leave: null == leave
            ? _value.leave
            : leave // ignore: cast_nullable_to_non_nullable
                  as int,
        totalWorkMinutes: null == totalWorkMinutes
            ? _value.totalWorkMinutes
            : totalWorkMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        totalOtMinutes: null == totalOtMinutes
            ? _value.totalOtMinutes
            : totalOtMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        totalLateMinutes: null == totalLateMinutes
            ? _value.totalLateMinutes
            : totalLateMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlySummaryDtoImpl implements _MonthlySummaryDto {
  const _$MonthlySummaryDtoImpl({
    @JsonKey(name: 'total_days') this.totalDays = 0,
    this.present = 0,
    this.late = 0,
    this.absent = 0,
    this.leave = 0,
    @JsonKey(name: 'total_work_minutes') this.totalWorkMinutes = 0,
    @JsonKey(name: 'total_ot_minutes') this.totalOtMinutes = 0,
    @JsonKey(name: 'total_late_minutes') this.totalLateMinutes = 0,
  });

  factory _$MonthlySummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlySummaryDtoImplFromJson(json);

  @override
  @JsonKey(name: 'total_days')
  final int totalDays;
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
  @JsonKey()
  final int leave;
  @override
  @JsonKey(name: 'total_work_minutes')
  final int totalWorkMinutes;
  @override
  @JsonKey(name: 'total_ot_minutes')
  final int totalOtMinutes;
  @override
  @JsonKey(name: 'total_late_minutes')
  final int totalLateMinutes;

  @override
  String toString() {
    return 'MonthlySummaryDto(totalDays: $totalDays, present: $present, late: $late, absent: $absent, leave: $leave, totalWorkMinutes: $totalWorkMinutes, totalOtMinutes: $totalOtMinutes, totalLateMinutes: $totalLateMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySummaryDtoImpl &&
            (identical(other.totalDays, totalDays) ||
                other.totalDays == totalDays) &&
            (identical(other.present, present) || other.present == present) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.absent, absent) || other.absent == absent) &&
            (identical(other.leave, leave) || other.leave == leave) &&
            (identical(other.totalWorkMinutes, totalWorkMinutes) ||
                other.totalWorkMinutes == totalWorkMinutes) &&
            (identical(other.totalOtMinutes, totalOtMinutes) ||
                other.totalOtMinutes == totalOtMinutes) &&
            (identical(other.totalLateMinutes, totalLateMinutes) ||
                other.totalLateMinutes == totalLateMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalDays,
    present,
    late,
    absent,
    leave,
    totalWorkMinutes,
    totalOtMinutes,
    totalLateMinutes,
  );

  /// Create a copy of MonthlySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySummaryDtoImplCopyWith<_$MonthlySummaryDtoImpl> get copyWith =>
      __$$MonthlySummaryDtoImplCopyWithImpl<_$MonthlySummaryDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlySummaryDtoImplToJson(this);
  }
}

abstract class _MonthlySummaryDto implements MonthlySummaryDto {
  const factory _MonthlySummaryDto({
    @JsonKey(name: 'total_days') final int totalDays,
    final int present,
    final int late,
    final int absent,
    final int leave,
    @JsonKey(name: 'total_work_minutes') final int totalWorkMinutes,
    @JsonKey(name: 'total_ot_minutes') final int totalOtMinutes,
    @JsonKey(name: 'total_late_minutes') final int totalLateMinutes,
  }) = _$MonthlySummaryDtoImpl;

  factory _MonthlySummaryDto.fromJson(Map<String, dynamic> json) =
      _$MonthlySummaryDtoImpl.fromJson;

  @override
  @JsonKey(name: 'total_days')
  int get totalDays;
  @override
  int get present;
  @override
  int get late;
  @override
  int get absent;
  @override
  int get leave;
  @override
  @JsonKey(name: 'total_work_minutes')
  int get totalWorkMinutes;
  @override
  @JsonKey(name: 'total_ot_minutes')
  int get totalOtMinutes;
  @override
  @JsonKey(name: 'total_late_minutes')
  int get totalLateMinutes;

  /// Create a copy of MonthlySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlySummaryDtoImplCopyWith<_$MonthlySummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
