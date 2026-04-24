// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approval_step_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApprovalStepDto _$ApprovalStepDtoFromJson(Map<String, dynamic> json) {
  return _ApprovalStepDto.fromJson(json);
}

/// @nodoc
mixin _$ApprovalStepDto {
  int get id => throw _privateConstructorUsedError;
  int get requestId => throw _privateConstructorUsedError;
  int get approverId => throw _privateConstructorUsedError;
  String get approverName => throw _privateConstructorUsedError;
  String? get approverAvatar => throw _privateConstructorUsedError;
  int get stepOrder => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get approvedAt => throw _privateConstructorUsedError;

  /// Serializes this ApprovalStepDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApprovalStepDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApprovalStepDtoCopyWith<ApprovalStepDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovalStepDtoCopyWith<$Res> {
  factory $ApprovalStepDtoCopyWith(
    ApprovalStepDto value,
    $Res Function(ApprovalStepDto) then,
  ) = _$ApprovalStepDtoCopyWithImpl<$Res, ApprovalStepDto>;
  @useResult
  $Res call({
    int id,
    int requestId,
    int approverId,
    String approverName,
    String? approverAvatar,
    int stepOrder,
    String status,
    String? comment,
    String? approvedAt,
  });
}

/// @nodoc
class _$ApprovalStepDtoCopyWithImpl<$Res, $Val extends ApprovalStepDto>
    implements $ApprovalStepDtoCopyWith<$Res> {
  _$ApprovalStepDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApprovalStepDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestId = null,
    Object? approverId = null,
    Object? approverName = null,
    Object? approverAvatar = freezed,
    Object? stepOrder = null,
    Object? status = null,
    Object? comment = freezed,
    Object? approvedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            requestId: null == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as int,
            approverId: null == approverId
                ? _value.approverId
                : approverId // ignore: cast_nullable_to_non_nullable
                      as int,
            approverName: null == approverName
                ? _value.approverName
                : approverName // ignore: cast_nullable_to_non_nullable
                      as String,
            approverAvatar: freezed == approverAvatar
                ? _value.approverAvatar
                : approverAvatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            stepOrder: null == stepOrder
                ? _value.stepOrder
                : stepOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvedAt: freezed == approvedAt
                ? _value.approvedAt
                : approvedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApprovalStepDtoImplCopyWith<$Res>
    implements $ApprovalStepDtoCopyWith<$Res> {
  factory _$$ApprovalStepDtoImplCopyWith(
    _$ApprovalStepDtoImpl value,
    $Res Function(_$ApprovalStepDtoImpl) then,
  ) = __$$ApprovalStepDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int requestId,
    int approverId,
    String approverName,
    String? approverAvatar,
    int stepOrder,
    String status,
    String? comment,
    String? approvedAt,
  });
}

/// @nodoc
class __$$ApprovalStepDtoImplCopyWithImpl<$Res>
    extends _$ApprovalStepDtoCopyWithImpl<$Res, _$ApprovalStepDtoImpl>
    implements _$$ApprovalStepDtoImplCopyWith<$Res> {
  __$$ApprovalStepDtoImplCopyWithImpl(
    _$ApprovalStepDtoImpl _value,
    $Res Function(_$ApprovalStepDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApprovalStepDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestId = null,
    Object? approverId = null,
    Object? approverName = null,
    Object? approverAvatar = freezed,
    Object? stepOrder = null,
    Object? status = null,
    Object? comment = freezed,
    Object? approvedAt = freezed,
  }) {
    return _then(
      _$ApprovalStepDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        requestId: null == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as int,
        approverId: null == approverId
            ? _value.approverId
            : approverId // ignore: cast_nullable_to_non_nullable
                  as int,
        approverName: null == approverName
            ? _value.approverName
            : approverName // ignore: cast_nullable_to_non_nullable
                  as String,
        approverAvatar: freezed == approverAvatar
            ? _value.approverAvatar
            : approverAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        stepOrder: null == stepOrder
            ? _value.stepOrder
            : stepOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvedAt: freezed == approvedAt
            ? _value.approvedAt
            : approvedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApprovalStepDtoImpl implements _ApprovalStepDto {
  const _$ApprovalStepDtoImpl({
    required this.id,
    required this.requestId,
    required this.approverId,
    required this.approverName,
    this.approverAvatar,
    required this.stepOrder,
    required this.status,
    this.comment,
    this.approvedAt,
  });

  factory _$ApprovalStepDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApprovalStepDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int requestId;
  @override
  final int approverId;
  @override
  final String approverName;
  @override
  final String? approverAvatar;
  @override
  final int stepOrder;
  @override
  final String status;
  @override
  final String? comment;
  @override
  final String? approvedAt;

  @override
  String toString() {
    return 'ApprovalStepDto(id: $id, requestId: $requestId, approverId: $approverId, approverName: $approverName, approverAvatar: $approverAvatar, stepOrder: $stepOrder, status: $status, comment: $comment, approvedAt: $approvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovalStepDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.approverId, approverId) ||
                other.approverId == approverId) &&
            (identical(other.approverName, approverName) ||
                other.approverName == approverName) &&
            (identical(other.approverAvatar, approverAvatar) ||
                other.approverAvatar == approverAvatar) &&
            (identical(other.stepOrder, stepOrder) ||
                other.stepOrder == stepOrder) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    requestId,
    approverId,
    approverName,
    approverAvatar,
    stepOrder,
    status,
    comment,
    approvedAt,
  );

  /// Create a copy of ApprovalStepDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovalStepDtoImplCopyWith<_$ApprovalStepDtoImpl> get copyWith =>
      __$$ApprovalStepDtoImplCopyWithImpl<_$ApprovalStepDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApprovalStepDtoImplToJson(this);
  }
}

abstract class _ApprovalStepDto implements ApprovalStepDto {
  const factory _ApprovalStepDto({
    required final int id,
    required final int requestId,
    required final int approverId,
    required final String approverName,
    final String? approverAvatar,
    required final int stepOrder,
    required final String status,
    final String? comment,
    final String? approvedAt,
  }) = _$ApprovalStepDtoImpl;

  factory _ApprovalStepDto.fromJson(Map<String, dynamic> json) =
      _$ApprovalStepDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get requestId;
  @override
  int get approverId;
  @override
  String get approverName;
  @override
  String? get approverAvatar;
  @override
  int get stepOrder;
  @override
  String get status;
  @override
  String? get comment;
  @override
  String? get approvedAt;

  /// Create a copy of ApprovalStepDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApprovalStepDtoImplCopyWith<_$ApprovalStepDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
