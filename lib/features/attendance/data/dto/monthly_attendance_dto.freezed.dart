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
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  List<MonthlyDayDto> get days => throw _privateConstructorUsedError;

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
  $Res call({int year, int month, List<MonthlyDayDto> days});
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
  $Res call({Object? year = null, Object? month = null, Object? days = null}) {
    return _then(
      _value.copyWith(
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            month: null == month
                ? _value.month
                : month // ignore: cast_nullable_to_non_nullable
                      as int,
            days: null == days
                ? _value.days
                : days // ignore: cast_nullable_to_non_nullable
                      as List<MonthlyDayDto>,
          )
          as $Val,
    );
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
  $Res call({int year, int month, List<MonthlyDayDto> days});
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
  $Res call({Object? year = null, Object? month = null, Object? days = null}) {
    return _then(
      _$MonthlyAttendanceDtoImpl(
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        month: null == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as int,
        days: null == days
            ? _value._days
            : days // ignore: cast_nullable_to_non_nullable
                  as List<MonthlyDayDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyAttendanceDtoImpl implements _MonthlyAttendanceDto {
  const _$MonthlyAttendanceDtoImpl({
    required this.year,
    required this.month,
    final List<MonthlyDayDto> days = const [],
  }) : _days = days;

  factory _$MonthlyAttendanceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyAttendanceDtoImplFromJson(json);

  @override
  final int year;
  @override
  final int month;
  final List<MonthlyDayDto> _days;
  @override
  @JsonKey()
  List<MonthlyDayDto> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'MonthlyAttendanceDto(year: $year, month: $month, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyAttendanceDtoImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    year,
    month,
    const DeepCollectionEquality().hash(_days),
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
    required final int year,
    required final int month,
    final List<MonthlyDayDto> days,
  }) = _$MonthlyAttendanceDtoImpl;

  factory _MonthlyAttendanceDto.fromJson(Map<String, dynamic> json) =
      _$MonthlyAttendanceDtoImpl.fromJson;

  @override
  int get year;
  @override
  int get month;
  @override
  List<MonthlyDayDto> get days;

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
  @JsonKey(name: 'working_hours')
  double get workingHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'late_minutes')
  int get lateMinutes => throw _privateConstructorUsedError;

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
    @JsonKey(name: 'working_hours') double workingHours,
    @JsonKey(name: 'late_minutes') int lateMinutes,
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
    Object? workingHours = null,
    Object? lateMinutes = null,
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
            workingHours: null == workingHours
                ? _value.workingHours
                : workingHours // ignore: cast_nullable_to_non_nullable
                      as double,
            lateMinutes: null == lateMinutes
                ? _value.lateMinutes
                : lateMinutes // ignore: cast_nullable_to_non_nullable
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
    @JsonKey(name: 'working_hours') double workingHours,
    @JsonKey(name: 'late_minutes') int lateMinutes,
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
    Object? workingHours = null,
    Object? lateMinutes = null,
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
        workingHours: null == workingHours
            ? _value.workingHours
            : workingHours // ignore: cast_nullable_to_non_nullable
                  as double,
        lateMinutes: null == lateMinutes
            ? _value.lateMinutes
            : lateMinutes // ignore: cast_nullable_to_non_nullable
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
    @JsonKey(name: 'working_hours') this.workingHours = 0,
    @JsonKey(name: 'late_minutes') this.lateMinutes = 0,
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
  @JsonKey(name: 'working_hours')
  final double workingHours;
  @override
  @JsonKey(name: 'late_minutes')
  final int lateMinutes;

  @override
  String toString() {
    return 'MonthlyDayDto(date: $date, status: $status, checkIn: $checkIn, checkOut: $checkOut, workingHours: $workingHours, lateMinutes: $lateMinutes)';
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
            (identical(other.workingHours, workingHours) ||
                other.workingHours == workingHours) &&
            (identical(other.lateMinutes, lateMinutes) ||
                other.lateMinutes == lateMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    status,
    checkIn,
    checkOut,
    workingHours,
    lateMinutes,
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
    @JsonKey(name: 'working_hours') final double workingHours,
    @JsonKey(name: 'late_minutes') final int lateMinutes,
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
  @JsonKey(name: 'working_hours')
  double get workingHours;
  @override
  @JsonKey(name: 'late_minutes')
  int get lateMinutes;

  /// Create a copy of MonthlyDayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyDayDtoImplCopyWith<_$MonthlyDayDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
