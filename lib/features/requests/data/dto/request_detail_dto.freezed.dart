// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RequestDetailDto _$RequestDetailDtoFromJson(Map<String, dynamic> json) {
  return _RequestDetailDto.fromJson(json);
}

/// @nodoc
mixin _$RequestDetailDto {
  int get id => throw _privateConstructorUsedError;
  int get employeeId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get typeName => throw _privateConstructorUsedError;
  String? get typeIcon => throw _privateConstructorUsedError;
  List<ApprovalStepDto> get approvals => throw _privateConstructorUsedError;
  List<AttachmentDto> get attachments => throw _privateConstructorUsedError;

  /// Serializes this RequestDetailDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestDetailDtoCopyWith<RequestDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestDetailDtoCopyWith<$Res> {
  factory $RequestDetailDtoCopyWith(
    RequestDetailDto value,
    $Res Function(RequestDetailDto) then,
  ) = _$RequestDetailDtoCopyWithImpl<$Res, RequestDetailDto>;
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
    String? typeName,
    String? typeIcon,
    List<ApprovalStepDto> approvals,
    List<AttachmentDto> attachments,
  });
}

/// @nodoc
class _$RequestDetailDtoCopyWithImpl<$Res, $Val extends RequestDetailDto>
    implements $RequestDetailDtoCopyWith<$Res> {
  _$RequestDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestDetailDto
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
    Object? typeName = freezed,
    Object? typeIcon = freezed,
    Object? approvals = null,
    Object? attachments = null,
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
            typeName: freezed == typeName
                ? _value.typeName
                : typeName // ignore: cast_nullable_to_non_nullable
                      as String?,
            typeIcon: freezed == typeIcon
                ? _value.typeIcon
                : typeIcon // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvals: null == approvals
                ? _value.approvals
                : approvals // ignore: cast_nullable_to_non_nullable
                      as List<ApprovalStepDto>,
            attachments: null == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                      as List<AttachmentDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RequestDetailDtoImplCopyWith<$Res>
    implements $RequestDetailDtoCopyWith<$Res> {
  factory _$$RequestDetailDtoImplCopyWith(
    _$RequestDetailDtoImpl value,
    $Res Function(_$RequestDetailDtoImpl) then,
  ) = __$$RequestDetailDtoImplCopyWithImpl<$Res>;
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
    String? typeName,
    String? typeIcon,
    List<ApprovalStepDto> approvals,
    List<AttachmentDto> attachments,
  });
}

/// @nodoc
class __$$RequestDetailDtoImplCopyWithImpl<$Res>
    extends _$RequestDetailDtoCopyWithImpl<$Res, _$RequestDetailDtoImpl>
    implements _$$RequestDetailDtoImplCopyWith<$Res> {
  __$$RequestDetailDtoImplCopyWithImpl(
    _$RequestDetailDtoImpl _value,
    $Res Function(_$RequestDetailDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RequestDetailDto
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
    Object? typeName = freezed,
    Object? typeIcon = freezed,
    Object? approvals = null,
    Object? attachments = null,
  }) {
    return _then(
      _$RequestDetailDtoImpl(
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
        typeName: freezed == typeName
            ? _value.typeName
            : typeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        typeIcon: freezed == typeIcon
            ? _value.typeIcon
            : typeIcon // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvals: null == approvals
            ? _value._approvals
            : approvals // ignore: cast_nullable_to_non_nullable
                  as List<ApprovalStepDto>,
        attachments: null == attachments
            ? _value._attachments
            : attachments // ignore: cast_nullable_to_non_nullable
                  as List<AttachmentDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestDetailDtoImpl implements _RequestDetailDto {
  const _$RequestDetailDtoImpl({
    required this.id,
    required this.employeeId,
    required this.type,
    required this.status,
    required this.startDate,
    required this.endDate,
    this.reason,
    required this.createdAt,
    this.typeName,
    this.typeIcon,
    final List<ApprovalStepDto> approvals = const [],
    final List<AttachmentDto> attachments = const [],
  }) : _approvals = approvals,
       _attachments = attachments;

  factory _$RequestDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestDetailDtoImplFromJson(json);

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
  final String? typeName;
  @override
  final String? typeIcon;
  final List<ApprovalStepDto> _approvals;
  @override
  @JsonKey()
  List<ApprovalStepDto> get approvals {
    if (_approvals is EqualUnmodifiableListView) return _approvals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_approvals);
  }

  final List<AttachmentDto> _attachments;
  @override
  @JsonKey()
  List<AttachmentDto> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'RequestDetailDto(id: $id, employeeId: $employeeId, type: $type, status: $status, startDate: $startDate, endDate: $endDate, reason: $reason, createdAt: $createdAt, typeName: $typeName, typeIcon: $typeIcon, approvals: $approvals, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestDetailDtoImpl &&
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
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.typeIcon, typeIcon) ||
                other.typeIcon == typeIcon) &&
            const DeepCollectionEquality().equals(
              other._approvals,
              _approvals,
            ) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ));
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
    typeName,
    typeIcon,
    const DeepCollectionEquality().hash(_approvals),
    const DeepCollectionEquality().hash(_attachments),
  );

  /// Create a copy of RequestDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestDetailDtoImplCopyWith<_$RequestDetailDtoImpl> get copyWith =>
      __$$RequestDetailDtoImplCopyWithImpl<_$RequestDetailDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestDetailDtoImplToJson(this);
  }
}

abstract class _RequestDetailDto implements RequestDetailDto {
  const factory _RequestDetailDto({
    required final int id,
    required final int employeeId,
    required final String type,
    required final String status,
    required final String startDate,
    required final String endDate,
    final String? reason,
    required final String createdAt,
    final String? typeName,
    final String? typeIcon,
    final List<ApprovalStepDto> approvals,
    final List<AttachmentDto> attachments,
  }) = _$RequestDetailDtoImpl;

  factory _RequestDetailDto.fromJson(Map<String, dynamic> json) =
      _$RequestDetailDtoImpl.fromJson;

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
  String? get typeName;
  @override
  String? get typeIcon;
  @override
  List<ApprovalStepDto> get approvals;
  @override
  List<AttachmentDto> get attachments;

  /// Create a copy of RequestDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestDetailDtoImplCopyWith<_$RequestDetailDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
