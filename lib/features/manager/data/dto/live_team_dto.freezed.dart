// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_team_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LiveTeamMemberDto _$LiveTeamMemberDtoFromJson(Map<String, dynamic> json) {
  return _LiveTeamMemberDto.fromJson(json);
}

/// @nodoc
mixin _$LiveTeamMemberDto {
  int get id =>
      throw _privateConstructorUsedError; // roster row id (for PUT/DELETE)
  @JsonKey(name: 'employee_id')
  int get employeeId => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError; // host | editor
  @JsonKey(fromJson: _toBool)
  bool get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'emp_code')
  String? get empCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;

  /// Serializes this LiveTeamMemberDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveTeamMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveTeamMemberDtoCopyWith<LiveTeamMemberDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveTeamMemberDtoCopyWith<$Res> {
  factory $LiveTeamMemberDtoCopyWith(
    LiveTeamMemberDto value,
    $Res Function(LiveTeamMemberDto) then,
  ) = _$LiveTeamMemberDtoCopyWithImpl<$Res, LiveTeamMemberDto>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'employee_id') int employeeId,
    String role,
    @JsonKey(fromJson: _toBool) bool active,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'emp_code') String? empCode,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
  });
}

/// @nodoc
class _$LiveTeamMemberDtoCopyWithImpl<$Res, $Val extends LiveTeamMemberDto>
    implements $LiveTeamMemberDtoCopyWith<$Res> {
  _$LiveTeamMemberDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveTeamMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? role = null,
    Object? active = null,
    Object? fullName = null,
    Object? empCode = freezed,
    Object? avatarUrl = freezed,
    Object? position = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            employeeId: null == employeeId
                ? _value.employeeId
                : employeeId // ignore: cast_nullable_to_non_nullable
                      as int,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            active: null == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                      as bool,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            empCode: freezed == empCode
                ? _value.empCode
                : empCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LiveTeamMemberDtoImplCopyWith<$Res>
    implements $LiveTeamMemberDtoCopyWith<$Res> {
  factory _$$LiveTeamMemberDtoImplCopyWith(
    _$LiveTeamMemberDtoImpl value,
    $Res Function(_$LiveTeamMemberDtoImpl) then,
  ) = __$$LiveTeamMemberDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'employee_id') int employeeId,
    String role,
    @JsonKey(fromJson: _toBool) bool active,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'emp_code') String? empCode,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
  });
}

/// @nodoc
class __$$LiveTeamMemberDtoImplCopyWithImpl<$Res>
    extends _$LiveTeamMemberDtoCopyWithImpl<$Res, _$LiveTeamMemberDtoImpl>
    implements _$$LiveTeamMemberDtoImplCopyWith<$Res> {
  __$$LiveTeamMemberDtoImplCopyWithImpl(
    _$LiveTeamMemberDtoImpl _value,
    $Res Function(_$LiveTeamMemberDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiveTeamMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? role = null,
    Object? active = null,
    Object? fullName = null,
    Object? empCode = freezed,
    Object? avatarUrl = freezed,
    Object? position = freezed,
  }) {
    return _then(
      _$LiveTeamMemberDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        employeeId: null == employeeId
            ? _value.employeeId
            : employeeId // ignore: cast_nullable_to_non_nullable
                  as int,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        active: null == active
            ? _value.active
            : active // ignore: cast_nullable_to_non_nullable
                  as bool,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        empCode: freezed == empCode
            ? _value.empCode
            : empCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveTeamMemberDtoImpl implements _LiveTeamMemberDto {
  const _$LiveTeamMemberDtoImpl({
    required this.id,
    @JsonKey(name: 'employee_id') required this.employeeId,
    required this.role,
    @JsonKey(fromJson: _toBool) this.active = true,
    @JsonKey(name: 'full_name') required this.fullName,
    @JsonKey(name: 'emp_code') this.empCode,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    this.position,
  });

  factory _$LiveTeamMemberDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveTeamMemberDtoImplFromJson(json);

  @override
  final int id;
  // roster row id (for PUT/DELETE)
  @override
  @JsonKey(name: 'employee_id')
  final int employeeId;
  @override
  final String role;
  // host | editor
  @override
  @JsonKey(fromJson: _toBool)
  final bool active;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'emp_code')
  final String? empCode;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String? position;

  @override
  String toString() {
    return 'LiveTeamMemberDto(id: $id, employeeId: $employeeId, role: $role, active: $active, fullName: $fullName, empCode: $empCode, avatarUrl: $avatarUrl, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveTeamMemberDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.empCode, empCode) || other.empCode == empCode) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    employeeId,
    role,
    active,
    fullName,
    empCode,
    avatarUrl,
    position,
  );

  /// Create a copy of LiveTeamMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveTeamMemberDtoImplCopyWith<_$LiveTeamMemberDtoImpl> get copyWith =>
      __$$LiveTeamMemberDtoImplCopyWithImpl<_$LiveTeamMemberDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveTeamMemberDtoImplToJson(this);
  }
}

abstract class _LiveTeamMemberDto implements LiveTeamMemberDto {
  const factory _LiveTeamMemberDto({
    required final int id,
    @JsonKey(name: 'employee_id') required final int employeeId,
    required final String role,
    @JsonKey(fromJson: _toBool) final bool active,
    @JsonKey(name: 'full_name') required final String fullName,
    @JsonKey(name: 'emp_code') final String? empCode,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    final String? position,
  }) = _$LiveTeamMemberDtoImpl;

  factory _LiveTeamMemberDto.fromJson(Map<String, dynamic> json) =
      _$LiveTeamMemberDtoImpl.fromJson;

  @override
  int get id; // roster row id (for PUT/DELETE)
  @override
  @JsonKey(name: 'employee_id')
  int get employeeId;
  @override
  String get role; // host | editor
  @override
  @JsonKey(fromJson: _toBool)
  bool get active;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  @JsonKey(name: 'emp_code')
  String? get empCode;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String? get position;

  /// Create a copy of LiveTeamMemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveTeamMemberDtoImplCopyWith<_$LiveTeamMemberDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveChannelDto _$LiveChannelDtoFromJson(Map<String, dynamic> json) {
  return _LiveChannelDto.fromJson(json);
}

/// @nodoc
mixin _$LiveChannelDto {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  /// Serializes this LiveChannelDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveChannelDtoCopyWith<LiveChannelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveChannelDtoCopyWith<$Res> {
  factory $LiveChannelDtoCopyWith(
    LiveChannelDto value,
    $Res Function(LiveChannelDto) then,
  ) = _$LiveChannelDtoCopyWithImpl<$Res, LiveChannelDto>;
  @useResult
  $Res call({String code, String name, String? icon});
}

/// @nodoc
class _$LiveChannelDtoCopyWithImpl<$Res, $Val extends LiveChannelDto>
    implements $LiveChannelDtoCopyWith<$Res> {
  _$LiveChannelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? icon = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LiveChannelDtoImplCopyWith<$Res>
    implements $LiveChannelDtoCopyWith<$Res> {
  factory _$$LiveChannelDtoImplCopyWith(
    _$LiveChannelDtoImpl value,
    $Res Function(_$LiveChannelDtoImpl) then,
  ) = __$$LiveChannelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String? icon});
}

/// @nodoc
class __$$LiveChannelDtoImplCopyWithImpl<$Res>
    extends _$LiveChannelDtoCopyWithImpl<$Res, _$LiveChannelDtoImpl>
    implements _$$LiveChannelDtoImplCopyWith<$Res> {
  __$$LiveChannelDtoImplCopyWithImpl(
    _$LiveChannelDtoImpl _value,
    $Res Function(_$LiveChannelDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiveChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? icon = freezed,
  }) {
    return _then(
      _$LiveChannelDtoImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveChannelDtoImpl implements _LiveChannelDto {
  const _$LiveChannelDtoImpl({
    required this.code,
    required this.name,
    this.icon,
  });

  factory _$LiveChannelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveChannelDtoImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String? icon;

  @override
  String toString() {
    return 'LiveChannelDto(code: $code, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveChannelDtoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, icon);

  /// Create a copy of LiveChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveChannelDtoImplCopyWith<_$LiveChannelDtoImpl> get copyWith =>
      __$$LiveChannelDtoImplCopyWithImpl<_$LiveChannelDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveChannelDtoImplToJson(this);
  }
}

abstract class _LiveChannelDto implements LiveChannelDto {
  const factory _LiveChannelDto({
    required final String code,
    required final String name,
    final String? icon,
  }) = _$LiveChannelDtoImpl;

  factory _LiveChannelDto.fromJson(Map<String, dynamic> json) =
      _$LiveChannelDtoImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String? get icon;

  /// Create a copy of LiveChannelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveChannelDtoImplCopyWith<_$LiveChannelDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmployeeSearchDto _$EmployeeSearchDtoFromJson(Map<String, dynamic> json) {
  return _EmployeeSearchDto.fromJson(json);
}

/// @nodoc
mixin _$EmployeeSearchDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'emp_code')
  String? get empCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;

  /// Serializes this EmployeeSearchDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeSearchDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeSearchDtoCopyWith<EmployeeSearchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeSearchDtoCopyWith<$Res> {
  factory $EmployeeSearchDtoCopyWith(
    EmployeeSearchDto value,
    $Res Function(EmployeeSearchDto) then,
  ) = _$EmployeeSearchDtoCopyWithImpl<$Res, EmployeeSearchDto>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'emp_code') String? empCode,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
  });
}

/// @nodoc
class _$EmployeeSearchDtoCopyWithImpl<$Res, $Val extends EmployeeSearchDto>
    implements $EmployeeSearchDtoCopyWith<$Res> {
  _$EmployeeSearchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeSearchDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? empCode = freezed,
    Object? avatarUrl = freezed,
    Object? position = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            empCode: freezed == empCode
                ? _value.empCode
                : empCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmployeeSearchDtoImplCopyWith<$Res>
    implements $EmployeeSearchDtoCopyWith<$Res> {
  factory _$$EmployeeSearchDtoImplCopyWith(
    _$EmployeeSearchDtoImpl value,
    $Res Function(_$EmployeeSearchDtoImpl) then,
  ) = __$$EmployeeSearchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'emp_code') String? empCode,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
  });
}

/// @nodoc
class __$$EmployeeSearchDtoImplCopyWithImpl<$Res>
    extends _$EmployeeSearchDtoCopyWithImpl<$Res, _$EmployeeSearchDtoImpl>
    implements _$$EmployeeSearchDtoImplCopyWith<$Res> {
  __$$EmployeeSearchDtoImplCopyWithImpl(
    _$EmployeeSearchDtoImpl _value,
    $Res Function(_$EmployeeSearchDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmployeeSearchDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? empCode = freezed,
    Object? avatarUrl = freezed,
    Object? position = freezed,
  }) {
    return _then(
      _$EmployeeSearchDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        empCode: freezed == empCode
            ? _value.empCode
            : empCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeSearchDtoImpl implements _EmployeeSearchDto {
  const _$EmployeeSearchDtoImpl({
    required this.id,
    @JsonKey(name: 'full_name') required this.fullName,
    @JsonKey(name: 'emp_code') this.empCode,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    this.position,
  });

  factory _$EmployeeSearchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeSearchDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'emp_code')
  final String? empCode;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String? position;

  @override
  String toString() {
    return 'EmployeeSearchDto(id: $id, fullName: $fullName, empCode: $empCode, avatarUrl: $avatarUrl, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeSearchDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.empCode, empCode) || other.empCode == empCode) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fullName, empCode, avatarUrl, position);

  /// Create a copy of EmployeeSearchDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeSearchDtoImplCopyWith<_$EmployeeSearchDtoImpl> get copyWith =>
      __$$EmployeeSearchDtoImplCopyWithImpl<_$EmployeeSearchDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeSearchDtoImplToJson(this);
  }
}

abstract class _EmployeeSearchDto implements EmployeeSearchDto {
  const factory _EmployeeSearchDto({
    required final int id,
    @JsonKey(name: 'full_name') required final String fullName,
    @JsonKey(name: 'emp_code') final String? empCode,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    final String? position,
  }) = _$EmployeeSearchDtoImpl;

  factory _EmployeeSearchDto.fromJson(Map<String, dynamic> json) =
      _$EmployeeSearchDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  @JsonKey(name: 'emp_code')
  String? get empCode;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String? get position;

  /// Create a copy of EmployeeSearchDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeSearchDtoImplCopyWith<_$EmployeeSearchDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
