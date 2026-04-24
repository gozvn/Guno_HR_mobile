// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) {
  return _LocationDto.fromJson(json);
}

/// @nodoc
mixin _$LocationDto {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_lat')
  double? get gpsLat => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_lng')
  double? get gpsLng => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_radius_m')
  int get gpsRadiusM => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: _toBool)
  bool get isActive => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this LocationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationDtoCopyWith<LocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDtoCopyWith<$Res> {
  factory $LocationDtoCopyWith(
    LocationDto value,
    $Res Function(LocationDto) then,
  ) = _$LocationDtoCopyWithImpl<$Res, LocationDto>;
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    @JsonKey(name: 'gps_lat') double? gpsLat,
    @JsonKey(name: 'gps_lng') double? gpsLng,
    @JsonKey(name: 'gps_radius_m') int gpsRadiusM,
    @JsonKey(name: 'is_active', fromJson: _toBool) bool isActive,
    String? address,
    @JsonKey(name: 'created_at') String? createdAt,
  });
}

/// @nodoc
class _$LocationDtoCopyWithImpl<$Res, $Val extends LocationDto>
    implements $LocationDtoCopyWith<$Res> {
  _$LocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? gpsLat = freezed,
    Object? gpsLng = freezed,
    Object? gpsRadiusM = null,
    Object? isActive = null,
    Object? address = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            gpsLat: freezed == gpsLat
                ? _value.gpsLat
                : gpsLat // ignore: cast_nullable_to_non_nullable
                      as double?,
            gpsLng: freezed == gpsLng
                ? _value.gpsLng
                : gpsLng // ignore: cast_nullable_to_non_nullable
                      as double?,
            gpsRadiusM: null == gpsRadiusM
                ? _value.gpsRadiusM
                : gpsRadiusM // ignore: cast_nullable_to_non_nullable
                      as int,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationDtoImplCopyWith<$Res>
    implements $LocationDtoCopyWith<$Res> {
  factory _$$LocationDtoImplCopyWith(
    _$LocationDtoImpl value,
    $Res Function(_$LocationDtoImpl) then,
  ) = __$$LocationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    @JsonKey(name: 'gps_lat') double? gpsLat,
    @JsonKey(name: 'gps_lng') double? gpsLng,
    @JsonKey(name: 'gps_radius_m') int gpsRadiusM,
    @JsonKey(name: 'is_active', fromJson: _toBool) bool isActive,
    String? address,
    @JsonKey(name: 'created_at') String? createdAt,
  });
}

/// @nodoc
class __$$LocationDtoImplCopyWithImpl<$Res>
    extends _$LocationDtoCopyWithImpl<$Res, _$LocationDtoImpl>
    implements _$$LocationDtoImplCopyWith<$Res> {
  __$$LocationDtoImplCopyWithImpl(
    _$LocationDtoImpl _value,
    $Res Function(_$LocationDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? gpsLat = freezed,
    Object? gpsLng = freezed,
    Object? gpsRadiusM = null,
    Object? isActive = null,
    Object? address = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$LocationDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        gpsLat: freezed == gpsLat
            ? _value.gpsLat
            : gpsLat // ignore: cast_nullable_to_non_nullable
                  as double?,
        gpsLng: freezed == gpsLng
            ? _value.gpsLng
            : gpsLng // ignore: cast_nullable_to_non_nullable
                  as double?,
        gpsRadiusM: null == gpsRadiusM
            ? _value.gpsRadiusM
            : gpsRadiusM // ignore: cast_nullable_to_non_nullable
                  as int,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationDtoImpl implements _LocationDto {
  const _$LocationDtoImpl({
    required this.id,
    required this.code,
    required this.name,
    @JsonKey(name: 'gps_lat') this.gpsLat,
    @JsonKey(name: 'gps_lng') this.gpsLng,
    @JsonKey(name: 'gps_radius_m') this.gpsRadiusM = 500,
    @JsonKey(name: 'is_active', fromJson: _toBool) this.isActive = true,
    this.address,
    @JsonKey(name: 'created_at') this.createdAt,
  });

  factory _$LocationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  @JsonKey(name: 'gps_lat')
  final double? gpsLat;
  @override
  @JsonKey(name: 'gps_lng')
  final double? gpsLng;
  @override
  @JsonKey(name: 'gps_radius_m')
  final int gpsRadiusM;
  @override
  @JsonKey(name: 'is_active', fromJson: _toBool)
  final bool isActive;
  @override
  final String? address;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'LocationDto(id: $id, code: $code, name: $name, gpsLat: $gpsLat, gpsLng: $gpsLng, gpsRadiusM: $gpsRadiusM, isActive: $isActive, address: $address, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gpsLat, gpsLat) || other.gpsLat == gpsLat) &&
            (identical(other.gpsLng, gpsLng) || other.gpsLng == gpsLng) &&
            (identical(other.gpsRadiusM, gpsRadiusM) ||
                other.gpsRadiusM == gpsRadiusM) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    name,
    gpsLat,
    gpsLng,
    gpsRadiusM,
    isActive,
    address,
    createdAt,
  );

  /// Create a copy of LocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDtoImplCopyWith<_$LocationDtoImpl> get copyWith =>
      __$$LocationDtoImplCopyWithImpl<_$LocationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDtoImplToJson(this);
  }
}

abstract class _LocationDto implements LocationDto {
  const factory _LocationDto({
    required final int id,
    required final String code,
    required final String name,
    @JsonKey(name: 'gps_lat') final double? gpsLat,
    @JsonKey(name: 'gps_lng') final double? gpsLng,
    @JsonKey(name: 'gps_radius_m') final int gpsRadiusM,
    @JsonKey(name: 'is_active', fromJson: _toBool) final bool isActive,
    final String? address,
    @JsonKey(name: 'created_at') final String? createdAt,
  }) = _$LocationDtoImpl;

  factory _LocationDto.fromJson(Map<String, dynamic> json) =
      _$LocationDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(name: 'gps_lat')
  double? get gpsLat;
  @override
  @JsonKey(name: 'gps_lng')
  double? get gpsLng;
  @override
  @JsonKey(name: 'gps_radius_m')
  int get gpsRadiusM;
  @override
  @JsonKey(name: 'is_active', fromJson: _toBool)
  bool get isActive;
  @override
  String? get address;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of LocationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationDtoImplCopyWith<_$LocationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NearestLocationDto _$NearestLocationDtoFromJson(Map<String, dynamic> json) {
  return _NearestLocationDto.fromJson(json);
}

/// @nodoc
mixin _$NearestLocationDto {
  NearestLocationEntryDto? get nearest => throw _privateConstructorUsedError;

  /// Serializes this NearestLocationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearestLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearestLocationDtoCopyWith<NearestLocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearestLocationDtoCopyWith<$Res> {
  factory $NearestLocationDtoCopyWith(
    NearestLocationDto value,
    $Res Function(NearestLocationDto) then,
  ) = _$NearestLocationDtoCopyWithImpl<$Res, NearestLocationDto>;
  @useResult
  $Res call({NearestLocationEntryDto? nearest});

  $NearestLocationEntryDtoCopyWith<$Res>? get nearest;
}

/// @nodoc
class _$NearestLocationDtoCopyWithImpl<$Res, $Val extends NearestLocationDto>
    implements $NearestLocationDtoCopyWith<$Res> {
  _$NearestLocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearestLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nearest = freezed}) {
    return _then(
      _value.copyWith(
            nearest: freezed == nearest
                ? _value.nearest
                : nearest // ignore: cast_nullable_to_non_nullable
                      as NearestLocationEntryDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of NearestLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NearestLocationEntryDtoCopyWith<$Res>? get nearest {
    if (_value.nearest == null) {
      return null;
    }

    return $NearestLocationEntryDtoCopyWith<$Res>(_value.nearest!, (value) {
      return _then(_value.copyWith(nearest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NearestLocationDtoImplCopyWith<$Res>
    implements $NearestLocationDtoCopyWith<$Res> {
  factory _$$NearestLocationDtoImplCopyWith(
    _$NearestLocationDtoImpl value,
    $Res Function(_$NearestLocationDtoImpl) then,
  ) = __$$NearestLocationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NearestLocationEntryDto? nearest});

  @override
  $NearestLocationEntryDtoCopyWith<$Res>? get nearest;
}

/// @nodoc
class __$$NearestLocationDtoImplCopyWithImpl<$Res>
    extends _$NearestLocationDtoCopyWithImpl<$Res, _$NearestLocationDtoImpl>
    implements _$$NearestLocationDtoImplCopyWith<$Res> {
  __$$NearestLocationDtoImplCopyWithImpl(
    _$NearestLocationDtoImpl _value,
    $Res Function(_$NearestLocationDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NearestLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nearest = freezed}) {
    return _then(
      _$NearestLocationDtoImpl(
        nearest: freezed == nearest
            ? _value.nearest
            : nearest // ignore: cast_nullable_to_non_nullable
                  as NearestLocationEntryDto?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NearestLocationDtoImpl implements _NearestLocationDto {
  const _$NearestLocationDtoImpl({this.nearest});

  factory _$NearestLocationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearestLocationDtoImplFromJson(json);

  @override
  final NearestLocationEntryDto? nearest;

  @override
  String toString() {
    return 'NearestLocationDto(nearest: $nearest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearestLocationDtoImpl &&
            (identical(other.nearest, nearest) || other.nearest == nearest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nearest);

  /// Create a copy of NearestLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearestLocationDtoImplCopyWith<_$NearestLocationDtoImpl> get copyWith =>
      __$$NearestLocationDtoImplCopyWithImpl<_$NearestLocationDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NearestLocationDtoImplToJson(this);
  }
}

abstract class _NearestLocationDto implements NearestLocationDto {
  const factory _NearestLocationDto({final NearestLocationEntryDto? nearest}) =
      _$NearestLocationDtoImpl;

  factory _NearestLocationDto.fromJson(Map<String, dynamic> json) =
      _$NearestLocationDtoImpl.fromJson;

  @override
  NearestLocationEntryDto? get nearest;

  /// Create a copy of NearestLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearestLocationDtoImplCopyWith<_$NearestLocationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NearestLocationEntryDto _$NearestLocationEntryDtoFromJson(
  Map<String, dynamic> json,
) {
  return _NearestLocationEntryDto.fromJson(json);
}

/// @nodoc
mixin _$NearestLocationEntryDto {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_m')
  double get distanceM => throw _privateConstructorUsedError;

  /// Serializes this NearestLocationEntryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearestLocationEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearestLocationEntryDtoCopyWith<NearestLocationEntryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearestLocationEntryDtoCopyWith<$Res> {
  factory $NearestLocationEntryDtoCopyWith(
    NearestLocationEntryDto value,
    $Res Function(NearestLocationEntryDto) then,
  ) = _$NearestLocationEntryDtoCopyWithImpl<$Res, NearestLocationEntryDto>;
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    @JsonKey(name: 'distance_m') double distanceM,
  });
}

/// @nodoc
class _$NearestLocationEntryDtoCopyWithImpl<
  $Res,
  $Val extends NearestLocationEntryDto
>
    implements $NearestLocationEntryDtoCopyWith<$Res> {
  _$NearestLocationEntryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearestLocationEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? distanceM = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            distanceM: null == distanceM
                ? _value.distanceM
                : distanceM // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NearestLocationEntryDtoImplCopyWith<$Res>
    implements $NearestLocationEntryDtoCopyWith<$Res> {
  factory _$$NearestLocationEntryDtoImplCopyWith(
    _$NearestLocationEntryDtoImpl value,
    $Res Function(_$NearestLocationEntryDtoImpl) then,
  ) = __$$NearestLocationEntryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    @JsonKey(name: 'distance_m') double distanceM,
  });
}

/// @nodoc
class __$$NearestLocationEntryDtoImplCopyWithImpl<$Res>
    extends
        _$NearestLocationEntryDtoCopyWithImpl<
          $Res,
          _$NearestLocationEntryDtoImpl
        >
    implements _$$NearestLocationEntryDtoImplCopyWith<$Res> {
  __$$NearestLocationEntryDtoImplCopyWithImpl(
    _$NearestLocationEntryDtoImpl _value,
    $Res Function(_$NearestLocationEntryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NearestLocationEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? distanceM = null,
  }) {
    return _then(
      _$NearestLocationEntryDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        distanceM: null == distanceM
            ? _value.distanceM
            : distanceM // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NearestLocationEntryDtoImpl implements _NearestLocationEntryDto {
  const _$NearestLocationEntryDtoImpl({
    required this.id,
    required this.code,
    required this.name,
    @JsonKey(name: 'distance_m') required this.distanceM,
  });

  factory _$NearestLocationEntryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearestLocationEntryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  @JsonKey(name: 'distance_m')
  final double distanceM;

  @override
  String toString() {
    return 'NearestLocationEntryDto(id: $id, code: $code, name: $name, distanceM: $distanceM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearestLocationEntryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.distanceM, distanceM) ||
                other.distanceM == distanceM));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, distanceM);

  /// Create a copy of NearestLocationEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearestLocationEntryDtoImplCopyWith<_$NearestLocationEntryDtoImpl>
  get copyWith =>
      __$$NearestLocationEntryDtoImplCopyWithImpl<
        _$NearestLocationEntryDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearestLocationEntryDtoImplToJson(this);
  }
}

abstract class _NearestLocationEntryDto implements NearestLocationEntryDto {
  const factory _NearestLocationEntryDto({
    required final int id,
    required final String code,
    required final String name,
    @JsonKey(name: 'distance_m') required final double distanceM,
  }) = _$NearestLocationEntryDtoImpl;

  factory _NearestLocationEntryDto.fromJson(Map<String, dynamic> json) =
      _$NearestLocationEntryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(name: 'distance_m')
  double get distanceM;

  /// Create a copy of NearestLocationEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearestLocationEntryDtoImplCopyWith<_$NearestLocationEntryDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
