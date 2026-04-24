// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_balance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeaveBalanceDto _$LeaveBalanceDtoFromJson(Map<String, dynamic> json) {
  return _LeaveBalanceDto.fromJson(json);
}

/// @nodoc
mixin _$LeaveBalanceDto {
  String get sourceCode => throw _privateConstructorUsedError;
  String get sourceName => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double get used => throw _privateConstructorUsedError;
  double get remaining => throw _privateConstructorUsedError;
  double get expired => throw _privateConstructorUsedError;
  String? get syncedAt => throw _privateConstructorUsedError;

  /// Serializes this LeaveBalanceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaveBalanceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaveBalanceDtoCopyWith<LeaveBalanceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveBalanceDtoCopyWith<$Res> {
  factory $LeaveBalanceDtoCopyWith(
    LeaveBalanceDto value,
    $Res Function(LeaveBalanceDto) then,
  ) = _$LeaveBalanceDtoCopyWithImpl<$Res, LeaveBalanceDto>;
  @useResult
  $Res call({
    String sourceCode,
    String sourceName,
    double total,
    double used,
    double remaining,
    double expired,
    String? syncedAt,
  });
}

/// @nodoc
class _$LeaveBalanceDtoCopyWithImpl<$Res, $Val extends LeaveBalanceDto>
    implements $LeaveBalanceDtoCopyWith<$Res> {
  _$LeaveBalanceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaveBalanceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceCode = null,
    Object? sourceName = null,
    Object? total = null,
    Object? used = null,
    Object? remaining = null,
    Object? expired = null,
    Object? syncedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            sourceCode: null == sourceCode
                ? _value.sourceCode
                : sourceCode // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceName: null == sourceName
                ? _value.sourceName
                : sourceName // ignore: cast_nullable_to_non_nullable
                      as String,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            used: null == used
                ? _value.used
                : used // ignore: cast_nullable_to_non_nullable
                      as double,
            remaining: null == remaining
                ? _value.remaining
                : remaining // ignore: cast_nullable_to_non_nullable
                      as double,
            expired: null == expired
                ? _value.expired
                : expired // ignore: cast_nullable_to_non_nullable
                      as double,
            syncedAt: freezed == syncedAt
                ? _value.syncedAt
                : syncedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeaveBalanceDtoImplCopyWith<$Res>
    implements $LeaveBalanceDtoCopyWith<$Res> {
  factory _$$LeaveBalanceDtoImplCopyWith(
    _$LeaveBalanceDtoImpl value,
    $Res Function(_$LeaveBalanceDtoImpl) then,
  ) = __$$LeaveBalanceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sourceCode,
    String sourceName,
    double total,
    double used,
    double remaining,
    double expired,
    String? syncedAt,
  });
}

/// @nodoc
class __$$LeaveBalanceDtoImplCopyWithImpl<$Res>
    extends _$LeaveBalanceDtoCopyWithImpl<$Res, _$LeaveBalanceDtoImpl>
    implements _$$LeaveBalanceDtoImplCopyWith<$Res> {
  __$$LeaveBalanceDtoImplCopyWithImpl(
    _$LeaveBalanceDtoImpl _value,
    $Res Function(_$LeaveBalanceDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeaveBalanceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceCode = null,
    Object? sourceName = null,
    Object? total = null,
    Object? used = null,
    Object? remaining = null,
    Object? expired = null,
    Object? syncedAt = freezed,
  }) {
    return _then(
      _$LeaveBalanceDtoImpl(
        sourceCode: null == sourceCode
            ? _value.sourceCode
            : sourceCode // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceName: null == sourceName
            ? _value.sourceName
            : sourceName // ignore: cast_nullable_to_non_nullable
                  as String,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        used: null == used
            ? _value.used
            : used // ignore: cast_nullable_to_non_nullable
                  as double,
        remaining: null == remaining
            ? _value.remaining
            : remaining // ignore: cast_nullable_to_non_nullable
                  as double,
        expired: null == expired
            ? _value.expired
            : expired // ignore: cast_nullable_to_non_nullable
                  as double,
        syncedAt: freezed == syncedAt
            ? _value.syncedAt
            : syncedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveBalanceDtoImpl implements _LeaveBalanceDto {
  const _$LeaveBalanceDtoImpl({
    required this.sourceCode,
    required this.sourceName,
    required this.total,
    required this.used,
    required this.remaining,
    this.expired = 0,
    this.syncedAt,
  });

  factory _$LeaveBalanceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveBalanceDtoImplFromJson(json);

  @override
  final String sourceCode;
  @override
  final String sourceName;
  @override
  final double total;
  @override
  final double used;
  @override
  final double remaining;
  @override
  @JsonKey()
  final double expired;
  @override
  final String? syncedAt;

  @override
  String toString() {
    return 'LeaveBalanceDto(sourceCode: $sourceCode, sourceName: $sourceName, total: $total, used: $used, remaining: $remaining, expired: $expired, syncedAt: $syncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveBalanceDtoImpl &&
            (identical(other.sourceCode, sourceCode) ||
                other.sourceCode == sourceCode) &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.used, used) || other.used == used) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.expired, expired) || other.expired == expired) &&
            (identical(other.syncedAt, syncedAt) ||
                other.syncedAt == syncedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sourceCode,
    sourceName,
    total,
    used,
    remaining,
    expired,
    syncedAt,
  );

  /// Create a copy of LeaveBalanceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveBalanceDtoImplCopyWith<_$LeaveBalanceDtoImpl> get copyWith =>
      __$$LeaveBalanceDtoImplCopyWithImpl<_$LeaveBalanceDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveBalanceDtoImplToJson(this);
  }
}

abstract class _LeaveBalanceDto implements LeaveBalanceDto {
  const factory _LeaveBalanceDto({
    required final String sourceCode,
    required final String sourceName,
    required final double total,
    required final double used,
    required final double remaining,
    final double expired,
    final String? syncedAt,
  }) = _$LeaveBalanceDtoImpl;

  factory _LeaveBalanceDto.fromJson(Map<String, dynamic> json) =
      _$LeaveBalanceDtoImpl.fromJson;

  @override
  String get sourceCode;
  @override
  String get sourceName;
  @override
  double get total;
  @override
  double get used;
  @override
  double get remaining;
  @override
  double get expired;
  @override
  String? get syncedAt;

  /// Create a copy of LeaveBalanceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaveBalanceDtoImplCopyWith<_$LeaveBalanceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
