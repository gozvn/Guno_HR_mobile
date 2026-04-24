// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RequestFilters {
  String? get status => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get month => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  /// Create a copy of RequestFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestFiltersCopyWith<RequestFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestFiltersCopyWith<$Res> {
  factory $RequestFiltersCopyWith(
    RequestFilters value,
    $Res Function(RequestFilters) then,
  ) = _$RequestFiltersCopyWithImpl<$Res, RequestFilters>;
  @useResult
  $Res call({String? status, String? type, String? month, int offset});
}

/// @nodoc
class _$RequestFiltersCopyWithImpl<$Res, $Val extends RequestFilters>
    implements $RequestFiltersCopyWith<$Res> {
  _$RequestFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? month = freezed,
    Object? offset = null,
  }) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            month: freezed == month
                ? _value.month
                : month // ignore: cast_nullable_to_non_nullable
                      as String?,
            offset: null == offset
                ? _value.offset
                : offset // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RequestFiltersImplCopyWith<$Res>
    implements $RequestFiltersCopyWith<$Res> {
  factory _$$RequestFiltersImplCopyWith(
    _$RequestFiltersImpl value,
    $Res Function(_$RequestFiltersImpl) then,
  ) = __$$RequestFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? type, String? month, int offset});
}

/// @nodoc
class __$$RequestFiltersImplCopyWithImpl<$Res>
    extends _$RequestFiltersCopyWithImpl<$Res, _$RequestFiltersImpl>
    implements _$$RequestFiltersImplCopyWith<$Res> {
  __$$RequestFiltersImplCopyWithImpl(
    _$RequestFiltersImpl _value,
    $Res Function(_$RequestFiltersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RequestFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? month = freezed,
    Object? offset = null,
  }) {
    return _then(
      _$RequestFiltersImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        month: freezed == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as String?,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RequestFiltersImpl implements _RequestFilters {
  const _$RequestFiltersImpl({
    this.status,
    this.type,
    this.month,
    this.offset = 0,
  });

  @override
  final String? status;
  @override
  final String? type;
  @override
  final String? month;
  @override
  @JsonKey()
  final int offset;

  @override
  String toString() {
    return 'RequestFilters(status: $status, type: $type, month: $month, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestFiltersImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, type, month, offset);

  /// Create a copy of RequestFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestFiltersImplCopyWith<_$RequestFiltersImpl> get copyWith =>
      __$$RequestFiltersImplCopyWithImpl<_$RequestFiltersImpl>(
        this,
        _$identity,
      );
}

abstract class _RequestFilters implements RequestFilters {
  const factory _RequestFilters({
    final String? status,
    final String? type,
    final String? month,
    final int offset,
  }) = _$RequestFiltersImpl;

  @override
  String? get status;
  @override
  String? get type;
  @override
  String? get month;
  @override
  int get offset;

  /// Create a copy of RequestFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestFiltersImplCopyWith<_$RequestFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
