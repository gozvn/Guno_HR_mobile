// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RequestSummaryDto _$RequestSummaryDtoFromJson(Map<String, dynamic> json) {
  return _RequestSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$RequestSummaryDto {
  @JsonKey(name: 'pending_requests')
  int get pendingRequests => throw _privateConstructorUsedError;
  @JsonKey(name: 'on_leave_today')
  int get onLeaveToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'month_total')
  int get monthTotal => throw _privateConstructorUsedError;

  /// Serializes this RequestSummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestSummaryDtoCopyWith<RequestSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestSummaryDtoCopyWith<$Res> {
  factory $RequestSummaryDtoCopyWith(
    RequestSummaryDto value,
    $Res Function(RequestSummaryDto) then,
  ) = _$RequestSummaryDtoCopyWithImpl<$Res, RequestSummaryDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'pending_requests') int pendingRequests,
    @JsonKey(name: 'on_leave_today') int onLeaveToday,
    @JsonKey(name: 'month_total') int monthTotal,
  });
}

/// @nodoc
class _$RequestSummaryDtoCopyWithImpl<$Res, $Val extends RequestSummaryDto>
    implements $RequestSummaryDtoCopyWith<$Res> {
  _$RequestSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingRequests = null,
    Object? onLeaveToday = null,
    Object? monthTotal = null,
  }) {
    return _then(
      _value.copyWith(
            pendingRequests: null == pendingRequests
                ? _value.pendingRequests
                : pendingRequests // ignore: cast_nullable_to_non_nullable
                      as int,
            onLeaveToday: null == onLeaveToday
                ? _value.onLeaveToday
                : onLeaveToday // ignore: cast_nullable_to_non_nullable
                      as int,
            monthTotal: null == monthTotal
                ? _value.monthTotal
                : monthTotal // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RequestSummaryDtoImplCopyWith<$Res>
    implements $RequestSummaryDtoCopyWith<$Res> {
  factory _$$RequestSummaryDtoImplCopyWith(
    _$RequestSummaryDtoImpl value,
    $Res Function(_$RequestSummaryDtoImpl) then,
  ) = __$$RequestSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'pending_requests') int pendingRequests,
    @JsonKey(name: 'on_leave_today') int onLeaveToday,
    @JsonKey(name: 'month_total') int monthTotal,
  });
}

/// @nodoc
class __$$RequestSummaryDtoImplCopyWithImpl<$Res>
    extends _$RequestSummaryDtoCopyWithImpl<$Res, _$RequestSummaryDtoImpl>
    implements _$$RequestSummaryDtoImplCopyWith<$Res> {
  __$$RequestSummaryDtoImplCopyWithImpl(
    _$RequestSummaryDtoImpl _value,
    $Res Function(_$RequestSummaryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RequestSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingRequests = null,
    Object? onLeaveToday = null,
    Object? monthTotal = null,
  }) {
    return _then(
      _$RequestSummaryDtoImpl(
        pendingRequests: null == pendingRequests
            ? _value.pendingRequests
            : pendingRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        onLeaveToday: null == onLeaveToday
            ? _value.onLeaveToday
            : onLeaveToday // ignore: cast_nullable_to_non_nullable
                  as int,
        monthTotal: null == monthTotal
            ? _value.monthTotal
            : monthTotal // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestSummaryDtoImpl implements _RequestSummaryDto {
  const _$RequestSummaryDtoImpl({
    @JsonKey(name: 'pending_requests') required this.pendingRequests,
    @JsonKey(name: 'on_leave_today') required this.onLeaveToday,
    @JsonKey(name: 'month_total') required this.monthTotal,
  });

  factory _$RequestSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestSummaryDtoImplFromJson(json);

  @override
  @JsonKey(name: 'pending_requests')
  final int pendingRequests;
  @override
  @JsonKey(name: 'on_leave_today')
  final int onLeaveToday;
  @override
  @JsonKey(name: 'month_total')
  final int monthTotal;

  @override
  String toString() {
    return 'RequestSummaryDto(pendingRequests: $pendingRequests, onLeaveToday: $onLeaveToday, monthTotal: $monthTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestSummaryDtoImpl &&
            (identical(other.pendingRequests, pendingRequests) ||
                other.pendingRequests == pendingRequests) &&
            (identical(other.onLeaveToday, onLeaveToday) ||
                other.onLeaveToday == onLeaveToday) &&
            (identical(other.monthTotal, monthTotal) ||
                other.monthTotal == monthTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pendingRequests, onLeaveToday, monthTotal);

  /// Create a copy of RequestSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestSummaryDtoImplCopyWith<_$RequestSummaryDtoImpl> get copyWith =>
      __$$RequestSummaryDtoImplCopyWithImpl<_$RequestSummaryDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestSummaryDtoImplToJson(this);
  }
}

abstract class _RequestSummaryDto implements RequestSummaryDto {
  const factory _RequestSummaryDto({
    @JsonKey(name: 'pending_requests') required final int pendingRequests,
    @JsonKey(name: 'on_leave_today') required final int onLeaveToday,
    @JsonKey(name: 'month_total') required final int monthTotal,
  }) = _$RequestSummaryDtoImpl;

  factory _RequestSummaryDto.fromJson(Map<String, dynamic> json) =
      _$RequestSummaryDtoImpl.fromJson;

  @override
  @JsonKey(name: 'pending_requests')
  int get pendingRequests;
  @override
  @JsonKey(name: 'on_leave_today')
  int get onLeaveToday;
  @override
  @JsonKey(name: 'month_total')
  int get monthTotal;

  /// Create a copy of RequestSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestSummaryDtoImplCopyWith<_$RequestSummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
