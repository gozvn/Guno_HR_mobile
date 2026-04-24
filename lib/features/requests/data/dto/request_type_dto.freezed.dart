// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_type_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RequestTypeDto _$RequestTypeDtoFromJson(Map<String, dynamic> json) {
  return _RequestTypeDto.fromJson(json);
}

/// @nodoc
mixin _$RequestTypeDto {
  String get code => throw _privateConstructorUsedError;
  String get nameVi => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  int get orderIdx => throw _privateConstructorUsedError;

  /// Serializes this RequestTypeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestTypeDtoCopyWith<RequestTypeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestTypeDtoCopyWith<$Res> {
  factory $RequestTypeDtoCopyWith(
    RequestTypeDto value,
    $Res Function(RequestTypeDto) then,
  ) = _$RequestTypeDtoCopyWithImpl<$Res, RequestTypeDto>;
  @useResult
  $Res call({
    String code,
    String nameVi,
    String nameEn,
    String icon,
    String color,
    int orderIdx,
  });
}

/// @nodoc
class _$RequestTypeDtoCopyWithImpl<$Res, $Val extends RequestTypeDto>
    implements $RequestTypeDtoCopyWith<$Res> {
  _$RequestTypeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? nameVi = null,
    Object? nameEn = null,
    Object? icon = null,
    Object? color = null,
    Object? orderIdx = null,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            nameVi: null == nameVi
                ? _value.nameVi
                : nameVi // ignore: cast_nullable_to_non_nullable
                      as String,
            nameEn: null == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String,
            orderIdx: null == orderIdx
                ? _value.orderIdx
                : orderIdx // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RequestTypeDtoImplCopyWith<$Res>
    implements $RequestTypeDtoCopyWith<$Res> {
  factory _$$RequestTypeDtoImplCopyWith(
    _$RequestTypeDtoImpl value,
    $Res Function(_$RequestTypeDtoImpl) then,
  ) = __$$RequestTypeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String nameVi,
    String nameEn,
    String icon,
    String color,
    int orderIdx,
  });
}

/// @nodoc
class __$$RequestTypeDtoImplCopyWithImpl<$Res>
    extends _$RequestTypeDtoCopyWithImpl<$Res, _$RequestTypeDtoImpl>
    implements _$$RequestTypeDtoImplCopyWith<$Res> {
  __$$RequestTypeDtoImplCopyWithImpl(
    _$RequestTypeDtoImpl _value,
    $Res Function(_$RequestTypeDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RequestTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? nameVi = null,
    Object? nameEn = null,
    Object? icon = null,
    Object? color = null,
    Object? orderIdx = null,
  }) {
    return _then(
      _$RequestTypeDtoImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        nameVi: null == nameVi
            ? _value.nameVi
            : nameVi // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: null == nameEn
            ? _value.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
        orderIdx: null == orderIdx
            ? _value.orderIdx
            : orderIdx // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestTypeDtoImpl implements _RequestTypeDto {
  const _$RequestTypeDtoImpl({
    required this.code,
    this.nameVi = '',
    this.nameEn = '',
    this.icon = '',
    this.color = '',
    this.orderIdx = 0,
  });

  factory _$RequestTypeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestTypeDtoImplFromJson(json);

  @override
  final String code;
  @override
  @JsonKey()
  final String nameVi;
  @override
  @JsonKey()
  final String nameEn;
  @override
  @JsonKey()
  final String icon;
  @override
  @JsonKey()
  final String color;
  @override
  @JsonKey()
  final int orderIdx;

  @override
  String toString() {
    return 'RequestTypeDto(code: $code, nameVi: $nameVi, nameEn: $nameEn, icon: $icon, color: $color, orderIdx: $orderIdx)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestTypeDtoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.nameVi, nameVi) || other.nameVi == nameVi) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.orderIdx, orderIdx) ||
                other.orderIdx == orderIdx));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, nameVi, nameEn, icon, color, orderIdx);

  /// Create a copy of RequestTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestTypeDtoImplCopyWith<_$RequestTypeDtoImpl> get copyWith =>
      __$$RequestTypeDtoImplCopyWithImpl<_$RequestTypeDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestTypeDtoImplToJson(this);
  }
}

abstract class _RequestTypeDto implements RequestTypeDto {
  const factory _RequestTypeDto({
    required final String code,
    final String nameVi,
    final String nameEn,
    final String icon,
    final String color,
    final int orderIdx,
  }) = _$RequestTypeDtoImpl;

  factory _RequestTypeDto.fromJson(Map<String, dynamic> json) =
      _$RequestTypeDtoImpl.fromJson;

  @override
  String get code;
  @override
  String get nameVi;
  @override
  String get nameEn;
  @override
  String get icon;
  @override
  String get color;
  @override
  int get orderIdx;

  /// Create a copy of RequestTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestTypeDtoImplCopyWith<_$RequestTypeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
