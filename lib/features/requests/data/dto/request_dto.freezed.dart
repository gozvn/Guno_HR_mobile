// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RequestDto _$RequestDtoFromJson(Map<String, dynamic> json) {
  return _RequestDto.fromJson(json);
}

/// @nodoc
mixin _$RequestDto {
  int get id => throw _privateConstructorUsedError;
  int get employeeId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get typeName => throw _privateConstructorUsedError;
  String? get typeIcon =>
      throw _privateConstructorUsedError; // Present when manager queries pending list — server joins employee table.
  @JsonKey(name: 'employee_name')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_avatar_url')
  String? get employeeAvatarUrl => throw _privateConstructorUsedError;

  /// Serializes this RequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestDtoCopyWith<RequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestDtoCopyWith<$Res> {
  factory $RequestDtoCopyWith(
    RequestDto value,
    $Res Function(RequestDto) then,
  ) = _$RequestDtoCopyWithImpl<$Res, RequestDto>;
  @useResult
  $Res call({
    int id,
    int employeeId,
    String type,
    String status,
    String startDate,
    String endDate,
    String? reason,
    String createdAt,
    String? updatedAt,
    String? typeName,
    String? typeIcon,
    @JsonKey(name: 'employee_name') String? employeeName,
    @JsonKey(name: 'employee_avatar_url') String? employeeAvatarUrl,
  });
}

/// @nodoc
class _$RequestDtoCopyWithImpl<$Res, $Val extends RequestDto>
    implements $RequestDtoCopyWith<$Res> {
  _$RequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? type = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? typeName = freezed,
    Object? typeIcon = freezed,
    Object? employeeName = freezed,
    Object? employeeAvatarUrl = freezed,
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            typeName: freezed == typeName
                ? _value.typeName
                : typeName // ignore: cast_nullable_to_non_nullable
                      as String?,
            typeIcon: freezed == typeIcon
                ? _value.typeIcon
                : typeIcon // ignore: cast_nullable_to_non_nullable
                      as String?,
            employeeName: freezed == employeeName
                ? _value.employeeName
                : employeeName // ignore: cast_nullable_to_non_nullable
                      as String?,
            employeeAvatarUrl: freezed == employeeAvatarUrl
                ? _value.employeeAvatarUrl
                : employeeAvatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RequestDtoImplCopyWith<$Res>
    implements $RequestDtoCopyWith<$Res> {
  factory _$$RequestDtoImplCopyWith(
    _$RequestDtoImpl value,
    $Res Function(_$RequestDtoImpl) then,
  ) = __$$RequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int employeeId,
    String type,
    String status,
    String startDate,
    String endDate,
    String? reason,
    String createdAt,
    String? updatedAt,
    String? typeName,
    String? typeIcon,
    @JsonKey(name: 'employee_name') String? employeeName,
    @JsonKey(name: 'employee_avatar_url') String? employeeAvatarUrl,
  });
}

/// @nodoc
class __$$RequestDtoImplCopyWithImpl<$Res>
    extends _$RequestDtoCopyWithImpl<$Res, _$RequestDtoImpl>
    implements _$$RequestDtoImplCopyWith<$Res> {
  __$$RequestDtoImplCopyWithImpl(
    _$RequestDtoImpl _value,
    $Res Function(_$RequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = null,
    Object? type = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? typeName = freezed,
    Object? typeIcon = freezed,
    Object? employeeName = freezed,
    Object? employeeAvatarUrl = freezed,
  }) {
    return _then(
      _$RequestDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        employeeId: null == employeeId
            ? _value.employeeId
            : employeeId // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        typeName: freezed == typeName
            ? _value.typeName
            : typeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        typeIcon: freezed == typeIcon
            ? _value.typeIcon
            : typeIcon // ignore: cast_nullable_to_non_nullable
                  as String?,
        employeeName: freezed == employeeName
            ? _value.employeeName
            : employeeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        employeeAvatarUrl: freezed == employeeAvatarUrl
            ? _value.employeeAvatarUrl
            : employeeAvatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestDtoImpl implements _RequestDto {
  const _$RequestDtoImpl({
    required this.id,
    required this.employeeId,
    required this.type,
    required this.status,
    required this.startDate,
    required this.endDate,
    this.reason,
    required this.createdAt,
    this.updatedAt,
    this.typeName,
    this.typeIcon,
    @JsonKey(name: 'employee_name') this.employeeName,
    @JsonKey(name: 'employee_avatar_url') this.employeeAvatarUrl,
  });

  factory _$RequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int employeeId;
  @override
  final String type;
  @override
  final String status;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final String? reason;
  @override
  final String createdAt;
  @override
  final String? updatedAt;
  @override
  final String? typeName;
  @override
  final String? typeIcon;
  // Present when manager queries pending list — server joins employee table.
  @override
  @JsonKey(name: 'employee_name')
  final String? employeeName;
  @override
  @JsonKey(name: 'employee_avatar_url')
  final String? employeeAvatarUrl;

  @override
  String toString() {
    return 'RequestDto(id: $id, employeeId: $employeeId, type: $type, status: $status, startDate: $startDate, endDate: $endDate, reason: $reason, createdAt: $createdAt, updatedAt: $updatedAt, typeName: $typeName, typeIcon: $typeIcon, employeeName: $employeeName, employeeAvatarUrl: $employeeAvatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.typeIcon, typeIcon) ||
                other.typeIcon == typeIcon) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeeAvatarUrl, employeeAvatarUrl) ||
                other.employeeAvatarUrl == employeeAvatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    employeeId,
    type,
    status,
    startDate,
    endDate,
    reason,
    createdAt,
    updatedAt,
    typeName,
    typeIcon,
    employeeName,
    employeeAvatarUrl,
  );

  /// Create a copy of RequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestDtoImplCopyWith<_$RequestDtoImpl> get copyWith =>
      __$$RequestDtoImplCopyWithImpl<_$RequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestDtoImplToJson(this);
  }
}

abstract class _RequestDto implements RequestDto {
  const factory _RequestDto({
    required final int id,
    required final int employeeId,
    required final String type,
    required final String status,
    required final String startDate,
    required final String endDate,
    final String? reason,
    required final String createdAt,
    final String? updatedAt,
    final String? typeName,
    final String? typeIcon,
    @JsonKey(name: 'employee_name') final String? employeeName,
    @JsonKey(name: 'employee_avatar_url') final String? employeeAvatarUrl,
  }) = _$RequestDtoImpl;

  factory _RequestDto.fromJson(Map<String, dynamic> json) =
      _$RequestDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get employeeId;
  @override
  String get type;
  @override
  String get status;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  String? get reason;
  @override
  String get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get typeName;
  @override
  String? get typeIcon; // Present when manager queries pending list — server joins employee table.
  @override
  @JsonKey(name: 'employee_name')
  String? get employeeName;
  @override
  @JsonKey(name: 'employee_avatar_url')
  String? get employeeAvatarUrl;

  /// Create a copy of RequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestDtoImplCopyWith<_$RequestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
