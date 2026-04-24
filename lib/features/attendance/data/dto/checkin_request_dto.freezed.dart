// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckinRequestDto _$CheckinRequestDtoFromJson(Map<String, dynamic> json) {
  return _CheckinRequestDto.fromJson(json);
}

/// @nodoc
mixin _$CheckinRequestDto {
  @JsonKey(name: 'gps_lat')
  double? get gpsLat => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_lng')
  double? get gpsLng => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_code')
  String? get locationCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_base64')
  String? get photoBase64 => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this CheckinRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckinRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckinRequestDtoCopyWith<CheckinRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinRequestDtoCopyWith<$Res> {
  factory $CheckinRequestDtoCopyWith(
    CheckinRequestDto value,
    $Res Function(CheckinRequestDto) then,
  ) = _$CheckinRequestDtoCopyWithImpl<$Res, CheckinRequestDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'gps_lat') double? gpsLat,
    @JsonKey(name: 'gps_lng') double? gpsLng,
    @JsonKey(name: 'location_code') String? locationCode,
    @JsonKey(name: 'photo_base64') String? photoBase64,
    String? note,
  });
}

/// @nodoc
class _$CheckinRequestDtoCopyWithImpl<$Res, $Val extends CheckinRequestDto>
    implements $CheckinRequestDtoCopyWith<$Res> {
  _$CheckinRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckinRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gpsLat = freezed,
    Object? gpsLng = freezed,
    Object? locationCode = freezed,
    Object? photoBase64 = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            gpsLat: freezed == gpsLat
                ? _value.gpsLat
                : gpsLat // ignore: cast_nullable_to_non_nullable
                      as double?,
            gpsLng: freezed == gpsLng
                ? _value.gpsLng
                : gpsLng // ignore: cast_nullable_to_non_nullable
                      as double?,
            locationCode: freezed == locationCode
                ? _value.locationCode
                : locationCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoBase64: freezed == photoBase64
                ? _value.photoBase64
                : photoBase64 // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckinRequestDtoImplCopyWith<$Res>
    implements $CheckinRequestDtoCopyWith<$Res> {
  factory _$$CheckinRequestDtoImplCopyWith(
    _$CheckinRequestDtoImpl value,
    $Res Function(_$CheckinRequestDtoImpl) then,
  ) = __$$CheckinRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'gps_lat') double? gpsLat,
    @JsonKey(name: 'gps_lng') double? gpsLng,
    @JsonKey(name: 'location_code') String? locationCode,
    @JsonKey(name: 'photo_base64') String? photoBase64,
    String? note,
  });
}

/// @nodoc
class __$$CheckinRequestDtoImplCopyWithImpl<$Res>
    extends _$CheckinRequestDtoCopyWithImpl<$Res, _$CheckinRequestDtoImpl>
    implements _$$CheckinRequestDtoImplCopyWith<$Res> {
  __$$CheckinRequestDtoImplCopyWithImpl(
    _$CheckinRequestDtoImpl _value,
    $Res Function(_$CheckinRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckinRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gpsLat = freezed,
    Object? gpsLng = freezed,
    Object? locationCode = freezed,
    Object? photoBase64 = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$CheckinRequestDtoImpl(
        gpsLat: freezed == gpsLat
            ? _value.gpsLat
            : gpsLat // ignore: cast_nullable_to_non_nullable
                  as double?,
        gpsLng: freezed == gpsLng
            ? _value.gpsLng
            : gpsLng // ignore: cast_nullable_to_non_nullable
                  as double?,
        locationCode: freezed == locationCode
            ? _value.locationCode
            : locationCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoBase64: freezed == photoBase64
            ? _value.photoBase64
            : photoBase64 // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckinRequestDtoImpl implements _CheckinRequestDto {
  const _$CheckinRequestDtoImpl({
    @JsonKey(name: 'gps_lat') this.gpsLat,
    @JsonKey(name: 'gps_lng') this.gpsLng,
    @JsonKey(name: 'location_code') this.locationCode,
    @JsonKey(name: 'photo_base64') this.photoBase64,
    this.note,
  });

  factory _$CheckinRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckinRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'gps_lat')
  final double? gpsLat;
  @override
  @JsonKey(name: 'gps_lng')
  final double? gpsLng;
  @override
  @JsonKey(name: 'location_code')
  final String? locationCode;
  @override
  @JsonKey(name: 'photo_base64')
  final String? photoBase64;
  @override
  final String? note;

  @override
  String toString() {
    return 'CheckinRequestDto(gpsLat: $gpsLat, gpsLng: $gpsLng, locationCode: $locationCode, photoBase64: $photoBase64, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckinRequestDtoImpl &&
            (identical(other.gpsLat, gpsLat) || other.gpsLat == gpsLat) &&
            (identical(other.gpsLng, gpsLng) || other.gpsLng == gpsLng) &&
            (identical(other.locationCode, locationCode) ||
                other.locationCode == locationCode) &&
            (identical(other.photoBase64, photoBase64) ||
                other.photoBase64 == photoBase64) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, gpsLat, gpsLng, locationCode, photoBase64, note);

  /// Create a copy of CheckinRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckinRequestDtoImplCopyWith<_$CheckinRequestDtoImpl> get copyWith =>
      __$$CheckinRequestDtoImplCopyWithImpl<_$CheckinRequestDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckinRequestDtoImplToJson(this);
  }
}

abstract class _CheckinRequestDto implements CheckinRequestDto {
  const factory _CheckinRequestDto({
    @JsonKey(name: 'gps_lat') final double? gpsLat,
    @JsonKey(name: 'gps_lng') final double? gpsLng,
    @JsonKey(name: 'location_code') final String? locationCode,
    @JsonKey(name: 'photo_base64') final String? photoBase64,
    final String? note,
  }) = _$CheckinRequestDtoImpl;

  factory _CheckinRequestDto.fromJson(Map<String, dynamic> json) =
      _$CheckinRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'gps_lat')
  double? get gpsLat;
  @override
  @JsonKey(name: 'gps_lng')
  double? get gpsLng;
  @override
  @JsonKey(name: 'location_code')
  String? get locationCode;
  @override
  @JsonKey(name: 'photo_base64')
  String? get photoBase64;
  @override
  String? get note;

  /// Create a copy of CheckinRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckinRequestDtoImplCopyWith<_$CheckinRequestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WfhCheckinRequestDto _$WfhCheckinRequestDtoFromJson(Map<String, dynamic> json) {
  return _WfhCheckinRequestDto.fromJson(json);
}

/// @nodoc
mixin _$WfhCheckinRequestDto {
  @JsonKey(name: 'photo_base64')
  String? get photoBase64 => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this WfhCheckinRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WfhCheckinRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WfhCheckinRequestDtoCopyWith<WfhCheckinRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WfhCheckinRequestDtoCopyWith<$Res> {
  factory $WfhCheckinRequestDtoCopyWith(
    WfhCheckinRequestDto value,
    $Res Function(WfhCheckinRequestDto) then,
  ) = _$WfhCheckinRequestDtoCopyWithImpl<$Res, WfhCheckinRequestDto>;
  @useResult
  $Res call({@JsonKey(name: 'photo_base64') String? photoBase64, String? note});
}

/// @nodoc
class _$WfhCheckinRequestDtoCopyWithImpl<
  $Res,
  $Val extends WfhCheckinRequestDto
>
    implements $WfhCheckinRequestDtoCopyWith<$Res> {
  _$WfhCheckinRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WfhCheckinRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? photoBase64 = freezed, Object? note = freezed}) {
    return _then(
      _value.copyWith(
            photoBase64: freezed == photoBase64
                ? _value.photoBase64
                : photoBase64 // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WfhCheckinRequestDtoImplCopyWith<$Res>
    implements $WfhCheckinRequestDtoCopyWith<$Res> {
  factory _$$WfhCheckinRequestDtoImplCopyWith(
    _$WfhCheckinRequestDtoImpl value,
    $Res Function(_$WfhCheckinRequestDtoImpl) then,
  ) = __$$WfhCheckinRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'photo_base64') String? photoBase64, String? note});
}

/// @nodoc
class __$$WfhCheckinRequestDtoImplCopyWithImpl<$Res>
    extends _$WfhCheckinRequestDtoCopyWithImpl<$Res, _$WfhCheckinRequestDtoImpl>
    implements _$$WfhCheckinRequestDtoImplCopyWith<$Res> {
  __$$WfhCheckinRequestDtoImplCopyWithImpl(
    _$WfhCheckinRequestDtoImpl _value,
    $Res Function(_$WfhCheckinRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WfhCheckinRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? photoBase64 = freezed, Object? note = freezed}) {
    return _then(
      _$WfhCheckinRequestDtoImpl(
        photoBase64: freezed == photoBase64
            ? _value.photoBase64
            : photoBase64 // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WfhCheckinRequestDtoImpl implements _WfhCheckinRequestDto {
  const _$WfhCheckinRequestDtoImpl({
    @JsonKey(name: 'photo_base64') this.photoBase64,
    this.note,
  });

  factory _$WfhCheckinRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WfhCheckinRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'photo_base64')
  final String? photoBase64;
  @override
  final String? note;

  @override
  String toString() {
    return 'WfhCheckinRequestDto(photoBase64: $photoBase64, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WfhCheckinRequestDtoImpl &&
            (identical(other.photoBase64, photoBase64) ||
                other.photoBase64 == photoBase64) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, photoBase64, note);

  /// Create a copy of WfhCheckinRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WfhCheckinRequestDtoImplCopyWith<_$WfhCheckinRequestDtoImpl>
  get copyWith =>
      __$$WfhCheckinRequestDtoImplCopyWithImpl<_$WfhCheckinRequestDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WfhCheckinRequestDtoImplToJson(this);
  }
}

abstract class _WfhCheckinRequestDto implements WfhCheckinRequestDto {
  const factory _WfhCheckinRequestDto({
    @JsonKey(name: 'photo_base64') final String? photoBase64,
    final String? note,
  }) = _$WfhCheckinRequestDtoImpl;

  factory _WfhCheckinRequestDto.fromJson(Map<String, dynamic> json) =
      _$WfhCheckinRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'photo_base64')
  String? get photoBase64;
  @override
  String? get note;

  /// Create a copy of WfhCheckinRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WfhCheckinRequestDtoImplCopyWith<_$WfhCheckinRequestDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
