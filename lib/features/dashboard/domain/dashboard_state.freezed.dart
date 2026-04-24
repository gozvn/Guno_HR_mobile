// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DashboardState {
  TodaySummaryDto get todaySummary => throw _privateConstructorUsedError;
  RequestSummaryDto get requestSummary =>
      throw _privateConstructorUsedError; // null = no attendance record today (not yet checked in or day off).
  TodayAttendanceDto? get todayAttendance => throw _privateConstructorUsedError;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
    DashboardState value,
    $Res Function(DashboardState) then,
  ) = _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call({
    TodaySummaryDto todaySummary,
    RequestSummaryDto requestSummary,
    TodayAttendanceDto? todayAttendance,
  });

  $TodaySummaryDtoCopyWith<$Res> get todaySummary;
  $RequestSummaryDtoCopyWith<$Res> get requestSummary;
  $TodayAttendanceDtoCopyWith<$Res>? get todayAttendance;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todaySummary = null,
    Object? requestSummary = null,
    Object? todayAttendance = freezed,
  }) {
    return _then(
      _value.copyWith(
            todaySummary: null == todaySummary
                ? _value.todaySummary
                : todaySummary // ignore: cast_nullable_to_non_nullable
                      as TodaySummaryDto,
            requestSummary: null == requestSummary
                ? _value.requestSummary
                : requestSummary // ignore: cast_nullable_to_non_nullable
                      as RequestSummaryDto,
            todayAttendance: freezed == todayAttendance
                ? _value.todayAttendance
                : todayAttendance // ignore: cast_nullable_to_non_nullable
                      as TodayAttendanceDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodaySummaryDtoCopyWith<$Res> get todaySummary {
    return $TodaySummaryDtoCopyWith<$Res>(_value.todaySummary, (value) {
      return _then(_value.copyWith(todaySummary: value) as $Val);
    });
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestSummaryDtoCopyWith<$Res> get requestSummary {
    return $RequestSummaryDtoCopyWith<$Res>(_value.requestSummary, (value) {
      return _then(_value.copyWith(requestSummary: value) as $Val);
    });
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodayAttendanceDtoCopyWith<$Res>? get todayAttendance {
    if (_value.todayAttendance == null) {
      return null;
    }

    return $TodayAttendanceDtoCopyWith<$Res>(_value.todayAttendance!, (value) {
      return _then(_value.copyWith(todayAttendance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(
    _$DashboardStateImpl value,
    $Res Function(_$DashboardStateImpl) then,
  ) = __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TodaySummaryDto todaySummary,
    RequestSummaryDto requestSummary,
    TodayAttendanceDto? todayAttendance,
  });

  @override
  $TodaySummaryDtoCopyWith<$Res> get todaySummary;
  @override
  $RequestSummaryDtoCopyWith<$Res> get requestSummary;
  @override
  $TodayAttendanceDtoCopyWith<$Res>? get todayAttendance;
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
    _$DashboardStateImpl _value,
    $Res Function(_$DashboardStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todaySummary = null,
    Object? requestSummary = null,
    Object? todayAttendance = freezed,
  }) {
    return _then(
      _$DashboardStateImpl(
        todaySummary: null == todaySummary
            ? _value.todaySummary
            : todaySummary // ignore: cast_nullable_to_non_nullable
                  as TodaySummaryDto,
        requestSummary: null == requestSummary
            ? _value.requestSummary
            : requestSummary // ignore: cast_nullable_to_non_nullable
                  as RequestSummaryDto,
        todayAttendance: freezed == todayAttendance
            ? _value.todayAttendance
            : todayAttendance // ignore: cast_nullable_to_non_nullable
                  as TodayAttendanceDto?,
      ),
    );
  }
}

/// @nodoc

class _$DashboardStateImpl implements _DashboardState {
  const _$DashboardStateImpl({
    required this.todaySummary,
    required this.requestSummary,
    this.todayAttendance,
  });

  @override
  final TodaySummaryDto todaySummary;
  @override
  final RequestSummaryDto requestSummary;
  // null = no attendance record today (not yet checked in or day off).
  @override
  final TodayAttendanceDto? todayAttendance;

  @override
  String toString() {
    return 'DashboardState(todaySummary: $todaySummary, requestSummary: $requestSummary, todayAttendance: $todayAttendance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            (identical(other.todaySummary, todaySummary) ||
                other.todaySummary == todaySummary) &&
            (identical(other.requestSummary, requestSummary) ||
                other.requestSummary == requestSummary) &&
            (identical(other.todayAttendance, todayAttendance) ||
                other.todayAttendance == todayAttendance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, todaySummary, requestSummary, todayAttendance);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState({
    required final TodaySummaryDto todaySummary,
    required final RequestSummaryDto requestSummary,
    final TodayAttendanceDto? todayAttendance,
  }) = _$DashboardStateImpl;

  @override
  TodaySummaryDto get todaySummary;
  @override
  RequestSummaryDto get requestSummary; // null = no attendance record today (not yet checked in or day off).
  @override
  TodayAttendanceDto? get todayAttendance;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
