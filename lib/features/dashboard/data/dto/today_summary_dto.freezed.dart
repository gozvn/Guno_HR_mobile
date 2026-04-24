// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodaySummaryDto _$TodaySummaryDtoFromJson(Map<String, dynamic> json) {
  return _TodaySummaryDto.fromJson(json);
}

/// @nodoc
mixin _$TodaySummaryDto {
  @JsonKey(name: 'total_employees')
  int get totalEmployees => throw _privateConstructorUsedError;
  @JsonKey(name: 'checked_in')
  int get presentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'late')
  int get lateCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'absent')
  int get absentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'leave_count')
  int get leaveCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'wfh_count')
  int get wfhCount => throw _privateConstructorUsedError;

  /// Serializes this TodaySummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodaySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodaySummaryDtoCopyWith<TodaySummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodaySummaryDtoCopyWith<$Res> {
  factory $TodaySummaryDtoCopyWith(
    TodaySummaryDto value,
    $Res Function(TodaySummaryDto) then,
  ) = _$TodaySummaryDtoCopyWithImpl<$Res, TodaySummaryDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'total_employees') int totalEmployees,
    @JsonKey(name: 'checked_in') int presentCount,
    @JsonKey(name: 'late') int lateCount,
    @JsonKey(name: 'absent') int absentCount,
    @JsonKey(name: 'leave_count') int leaveCount,
    @JsonKey(name: 'wfh_count') int wfhCount,
  });
}

/// @nodoc
class _$TodaySummaryDtoCopyWithImpl<$Res, $Val extends TodaySummaryDto>
    implements $TodaySummaryDtoCopyWith<$Res> {
  _$TodaySummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodaySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEmployees = null,
    Object? presentCount = null,
    Object? lateCount = null,
    Object? absentCount = null,
    Object? leaveCount = null,
    Object? wfhCount = null,
  }) {
    return _then(
      _value.copyWith(
            totalEmployees: null == totalEmployees
                ? _value.totalEmployees
                : totalEmployees // ignore: cast_nullable_to_non_nullable
                      as int,
            presentCount: null == presentCount
                ? _value.presentCount
                : presentCount // ignore: cast_nullable_to_non_nullable
                      as int,
            lateCount: null == lateCount
                ? _value.lateCount
                : lateCount // ignore: cast_nullable_to_non_nullable
                      as int,
            absentCount: null == absentCount
                ? _value.absentCount
                : absentCount // ignore: cast_nullable_to_non_nullable
                      as int,
            leaveCount: null == leaveCount
                ? _value.leaveCount
                : leaveCount // ignore: cast_nullable_to_non_nullable
                      as int,
            wfhCount: null == wfhCount
                ? _value.wfhCount
                : wfhCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodaySummaryDtoImplCopyWith<$Res>
    implements $TodaySummaryDtoCopyWith<$Res> {
  factory _$$TodaySummaryDtoImplCopyWith(
    _$TodaySummaryDtoImpl value,
    $Res Function(_$TodaySummaryDtoImpl) then,
  ) = __$$TodaySummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_employees') int totalEmployees,
    @JsonKey(name: 'checked_in') int presentCount,
    @JsonKey(name: 'late') int lateCount,
    @JsonKey(name: 'absent') int absentCount,
    @JsonKey(name: 'leave_count') int leaveCount,
    @JsonKey(name: 'wfh_count') int wfhCount,
  });
}

/// @nodoc
class __$$TodaySummaryDtoImplCopyWithImpl<$Res>
    extends _$TodaySummaryDtoCopyWithImpl<$Res, _$TodaySummaryDtoImpl>
    implements _$$TodaySummaryDtoImplCopyWith<$Res> {
  __$$TodaySummaryDtoImplCopyWithImpl(
    _$TodaySummaryDtoImpl _value,
    $Res Function(_$TodaySummaryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodaySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEmployees = null,
    Object? presentCount = null,
    Object? lateCount = null,
    Object? absentCount = null,
    Object? leaveCount = null,
    Object? wfhCount = null,
  }) {
    return _then(
      _$TodaySummaryDtoImpl(
        totalEmployees: null == totalEmployees
            ? _value.totalEmployees
            : totalEmployees // ignore: cast_nullable_to_non_nullable
                  as int,
        presentCount: null == presentCount
            ? _value.presentCount
            : presentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lateCount: null == lateCount
            ? _value.lateCount
            : lateCount // ignore: cast_nullable_to_non_nullable
                  as int,
        absentCount: null == absentCount
            ? _value.absentCount
            : absentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        leaveCount: null == leaveCount
            ? _value.leaveCount
            : leaveCount // ignore: cast_nullable_to_non_nullable
                  as int,
        wfhCount: null == wfhCount
            ? _value.wfhCount
            : wfhCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodaySummaryDtoImpl implements _TodaySummaryDto {
  const _$TodaySummaryDtoImpl({
    @JsonKey(name: 'total_employees') this.totalEmployees = 0,
    @JsonKey(name: 'checked_in') this.presentCount = 0,
    @JsonKey(name: 'late') this.lateCount = 0,
    @JsonKey(name: 'absent') this.absentCount = 0,
    @JsonKey(name: 'leave_count') this.leaveCount = 0,
    @JsonKey(name: 'wfh_count') this.wfhCount = 0,
  });

  factory _$TodaySummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodaySummaryDtoImplFromJson(json);

  @override
  @JsonKey(name: 'total_employees')
  final int totalEmployees;
  @override
  @JsonKey(name: 'checked_in')
  final int presentCount;
  @override
  @JsonKey(name: 'late')
  final int lateCount;
  @override
  @JsonKey(name: 'absent')
  final int absentCount;
  @override
  @JsonKey(name: 'leave_count')
  final int leaveCount;
  @override
  @JsonKey(name: 'wfh_count')
  final int wfhCount;

  @override
  String toString() {
    return 'TodaySummaryDto(totalEmployees: $totalEmployees, presentCount: $presentCount, lateCount: $lateCount, absentCount: $absentCount, leaveCount: $leaveCount, wfhCount: $wfhCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodaySummaryDtoImpl &&
            (identical(other.totalEmployees, totalEmployees) ||
                other.totalEmployees == totalEmployees) &&
            (identical(other.presentCount, presentCount) ||
                other.presentCount == presentCount) &&
            (identical(other.lateCount, lateCount) ||
                other.lateCount == lateCount) &&
            (identical(other.absentCount, absentCount) ||
                other.absentCount == absentCount) &&
            (identical(other.leaveCount, leaveCount) ||
                other.leaveCount == leaveCount) &&
            (identical(other.wfhCount, wfhCount) ||
                other.wfhCount == wfhCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalEmployees,
    presentCount,
    lateCount,
    absentCount,
    leaveCount,
    wfhCount,
  );

  /// Create a copy of TodaySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodaySummaryDtoImplCopyWith<_$TodaySummaryDtoImpl> get copyWith =>
      __$$TodaySummaryDtoImplCopyWithImpl<_$TodaySummaryDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TodaySummaryDtoImplToJson(this);
  }
}

abstract class _TodaySummaryDto implements TodaySummaryDto {
  const factory _TodaySummaryDto({
    @JsonKey(name: 'total_employees') final int totalEmployees,
    @JsonKey(name: 'checked_in') final int presentCount,
    @JsonKey(name: 'late') final int lateCount,
    @JsonKey(name: 'absent') final int absentCount,
    @JsonKey(name: 'leave_count') final int leaveCount,
    @JsonKey(name: 'wfh_count') final int wfhCount,
  }) = _$TodaySummaryDtoImpl;

  factory _TodaySummaryDto.fromJson(Map<String, dynamic> json) =
      _$TodaySummaryDtoImpl.fromJson;

  @override
  @JsonKey(name: 'total_employees')
  int get totalEmployees;
  @override
  @JsonKey(name: 'checked_in')
  int get presentCount;
  @override
  @JsonKey(name: 'late')
  int get lateCount;
  @override
  @JsonKey(name: 'absent')
  int get absentCount;
  @override
  @JsonKey(name: 'leave_count')
  int get leaveCount;
  @override
  @JsonKey(name: 'wfh_count')
  int get wfhCount;

  /// Create a copy of TodaySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodaySummaryDtoImplCopyWith<_$TodaySummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
