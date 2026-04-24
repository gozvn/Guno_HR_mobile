// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'emp_code')
  String get empCode => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_name')
  String? get departmentName => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'managed_department_id')
  int? get managedDepartmentId => throw _privateConstructorUsedError; // Extended fields from /auth/me (audit line 167–188).
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'contract_type')
  String? get contractType => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_status')
  String? get workStatus => throw _privateConstructorUsedError;

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'emp_code') String empCode,
    String email,
    @JsonKey(name: 'full_name') String fullName,
    String? phone,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
    @JsonKey(name: 'department_id') int? departmentId,
    @JsonKey(name: 'department_name') String? departmentName,
    String role,
    @JsonKey(name: 'managed_department_id') int? managedDepartmentId,
    String? gender,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'contract_type') String? contractType,
    @JsonKey(name: 'work_status') String? workStatus,
  });
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? empCode = null,
    Object? email = null,
    Object? fullName = null,
    Object? phone = freezed,
    Object? avatarUrl = freezed,
    Object? position = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? role = null,
    Object? managedDepartmentId = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? startDate = freezed,
    Object? contractType = freezed,
    Object? workStatus = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            empCode: null == empCode
                ? _value.empCode
                : empCode // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as String?,
            departmentId: freezed == departmentId
                ? _value.departmentId
                : departmentId // ignore: cast_nullable_to_non_nullable
                      as int?,
            departmentName: freezed == departmentName
                ? _value.departmentName
                : departmentName // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            managedDepartmentId: freezed == managedDepartmentId
                ? _value.managedDepartmentId
                : managedDepartmentId // ignore: cast_nullable_to_non_nullable
                      as int?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            contractType: freezed == contractType
                ? _value.contractType
                : contractType // ignore: cast_nullable_to_non_nullable
                      as String?,
            workStatus: freezed == workStatus
                ? _value.workStatus
                : workStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
    _$UserDtoImpl value,
    $Res Function(_$UserDtoImpl) then,
  ) = __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'emp_code') String empCode,
    String email,
    @JsonKey(name: 'full_name') String fullName,
    String? phone,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
    @JsonKey(name: 'department_id') int? departmentId,
    @JsonKey(name: 'department_name') String? departmentName,
    String role,
    @JsonKey(name: 'managed_department_id') int? managedDepartmentId,
    String? gender,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'contract_type') String? contractType,
    @JsonKey(name: 'work_status') String? workStatus,
  });
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
    _$UserDtoImpl _value,
    $Res Function(_$UserDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? empCode = null,
    Object? email = null,
    Object? fullName = null,
    Object? phone = freezed,
    Object? avatarUrl = freezed,
    Object? position = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? role = null,
    Object? managedDepartmentId = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? startDate = freezed,
    Object? contractType = freezed,
    Object? workStatus = freezed,
  }) {
    return _then(
      _$UserDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        empCode: null == empCode
            ? _value.empCode
            : empCode // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
        departmentId: freezed == departmentId
            ? _value.departmentId
            : departmentId // ignore: cast_nullable_to_non_nullable
                  as int?,
        departmentName: freezed == departmentName
            ? _value.departmentName
            : departmentName // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        managedDepartmentId: freezed == managedDepartmentId
            ? _value.managedDepartmentId
            : managedDepartmentId // ignore: cast_nullable_to_non_nullable
                  as int?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        contractType: freezed == contractType
            ? _value.contractType
            : contractType // ignore: cast_nullable_to_non_nullable
                  as String?,
        workStatus: freezed == workStatus
            ? _value.workStatus
            : workStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl extends _UserDto {
  const _$UserDtoImpl({
    required this.id,
    @JsonKey(name: 'emp_code') required this.empCode,
    required this.email,
    @JsonKey(name: 'full_name') required this.fullName,
    this.phone,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    this.position,
    @JsonKey(name: 'department_id') this.departmentId,
    @JsonKey(name: 'department_name') this.departmentName,
    required this.role,
    @JsonKey(name: 'managed_department_id') this.managedDepartmentId,
    this.gender,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    @JsonKey(name: 'start_date') this.startDate,
    @JsonKey(name: 'contract_type') this.contractType,
    @JsonKey(name: 'work_status') this.workStatus,
  }) : super._();

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'emp_code')
  final String empCode;
  @override
  final String email;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String? position;
  @override
  @JsonKey(name: 'department_id')
  final int? departmentId;
  @override
  @JsonKey(name: 'department_name')
  final String? departmentName;
  @override
  final String role;
  @override
  @JsonKey(name: 'managed_department_id')
  final int? managedDepartmentId;
  // Extended fields from /auth/me (audit line 167–188).
  @override
  final String? gender;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'contract_type')
  final String? contractType;
  @override
  @JsonKey(name: 'work_status')
  final String? workStatus;

  @override
  String toString() {
    return 'UserDto(id: $id, empCode: $empCode, email: $email, fullName: $fullName, phone: $phone, avatarUrl: $avatarUrl, position: $position, departmentId: $departmentId, departmentName: $departmentName, role: $role, managedDepartmentId: $managedDepartmentId, gender: $gender, dateOfBirth: $dateOfBirth, startDate: $startDate, contractType: $contractType, workStatus: $workStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.empCode, empCode) || other.empCode == empCode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.managedDepartmentId, managedDepartmentId) ||
                other.managedDepartmentId == managedDepartmentId) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.contractType, contractType) ||
                other.contractType == contractType) &&
            (identical(other.workStatus, workStatus) ||
                other.workStatus == workStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    empCode,
    email,
    fullName,
    phone,
    avatarUrl,
    position,
    departmentId,
    departmentName,
    role,
    managedDepartmentId,
    gender,
    dateOfBirth,
    startDate,
    contractType,
    workStatus,
  );

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(this);
  }
}

abstract class _UserDto extends UserDto {
  const factory _UserDto({
    required final int id,
    @JsonKey(name: 'emp_code') required final String empCode,
    required final String email,
    @JsonKey(name: 'full_name') required final String fullName,
    final String? phone,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    final String? position,
    @JsonKey(name: 'department_id') final int? departmentId,
    @JsonKey(name: 'department_name') final String? departmentName,
    required final String role,
    @JsonKey(name: 'managed_department_id') final int? managedDepartmentId,
    final String? gender,
    @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
    @JsonKey(name: 'start_date') final String? startDate,
    @JsonKey(name: 'contract_type') final String? contractType,
    @JsonKey(name: 'work_status') final String? workStatus,
  }) = _$UserDtoImpl;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'emp_code')
  String get empCode;
  @override
  String get email;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String? get position;
  @override
  @JsonKey(name: 'department_id')
  int? get departmentId;
  @override
  @JsonKey(name: 'department_name')
  String? get departmentName;
  @override
  String get role;
  @override
  @JsonKey(name: 'managed_department_id')
  int? get managedDepartmentId; // Extended fields from /auth/me (audit line 167–188).
  @override
  String? get gender;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  @JsonKey(name: 'start_date')
  String? get startDate;
  @override
  @JsonKey(name: 'contract_type')
  String? get contractType;
  @override
  @JsonKey(name: 'work_status')
  String? get workStatus;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
