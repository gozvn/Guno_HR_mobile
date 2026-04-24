// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_request_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateRequestPayload _$CreateRequestPayloadFromJson(Map<String, dynamic> json) {
  return _CreateRequestPayload.fromJson(json);
}

/// @nodoc
mixin _$CreateRequestPayload {
  String get type => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  List<String> get attachmentUrls => throw _privateConstructorUsedError;

  /// Serializes this CreateRequestPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRequestPayloadCopyWith<CreateRequestPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRequestPayloadCopyWith<$Res> {
  factory $CreateRequestPayloadCopyWith(
    CreateRequestPayload value,
    $Res Function(CreateRequestPayload) then,
  ) = _$CreateRequestPayloadCopyWithImpl<$Res, CreateRequestPayload>;
  @useResult
  $Res call({
    String type,
    String startDate,
    String endDate,
    String? reason,
    List<String> attachmentUrls,
  });
}

/// @nodoc
class _$CreateRequestPayloadCopyWithImpl<
  $Res,
  $Val extends CreateRequestPayload
>
    implements $CreateRequestPayloadCopyWith<$Res> {
  _$CreateRequestPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = freezed,
    Object? attachmentUrls = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
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
            attachmentUrls: null == attachmentUrls
                ? _value.attachmentUrls
                : attachmentUrls // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateRequestPayloadImplCopyWith<$Res>
    implements $CreateRequestPayloadCopyWith<$Res> {
  factory _$$CreateRequestPayloadImplCopyWith(
    _$CreateRequestPayloadImpl value,
    $Res Function(_$CreateRequestPayloadImpl) then,
  ) = __$$CreateRequestPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    String startDate,
    String endDate,
    String? reason,
    List<String> attachmentUrls,
  });
}

/// @nodoc
class __$$CreateRequestPayloadImplCopyWithImpl<$Res>
    extends _$CreateRequestPayloadCopyWithImpl<$Res, _$CreateRequestPayloadImpl>
    implements _$$CreateRequestPayloadImplCopyWith<$Res> {
  __$$CreateRequestPayloadImplCopyWithImpl(
    _$CreateRequestPayloadImpl _value,
    $Res Function(_$CreateRequestPayloadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = freezed,
    Object? attachmentUrls = null,
  }) {
    return _then(
      _$CreateRequestPayloadImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
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
        attachmentUrls: null == attachmentUrls
            ? _value._attachmentUrls
            : attachmentUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRequestPayloadImpl implements _CreateRequestPayload {
  const _$CreateRequestPayloadImpl({
    required this.type,
    required this.startDate,
    required this.endDate,
    this.reason,
    final List<String> attachmentUrls = const [],
  }) : _attachmentUrls = attachmentUrls;

  factory _$CreateRequestPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRequestPayloadImplFromJson(json);

  @override
  final String type;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final String? reason;
  final List<String> _attachmentUrls;
  @override
  @JsonKey()
  List<String> get attachmentUrls {
    if (_attachmentUrls is EqualUnmodifiableListView) return _attachmentUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachmentUrls);
  }

  @override
  String toString() {
    return 'CreateRequestPayload(type: $type, startDate: $startDate, endDate: $endDate, reason: $reason, attachmentUrls: $attachmentUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRequestPayloadImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            const DeepCollectionEquality().equals(
              other._attachmentUrls,
              _attachmentUrls,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    startDate,
    endDate,
    reason,
    const DeepCollectionEquality().hash(_attachmentUrls),
  );

  /// Create a copy of CreateRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRequestPayloadImplCopyWith<_$CreateRequestPayloadImpl>
  get copyWith =>
      __$$CreateRequestPayloadImplCopyWithImpl<_$CreateRequestPayloadImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRequestPayloadImplToJson(this);
  }
}

abstract class _CreateRequestPayload implements CreateRequestPayload {
  const factory _CreateRequestPayload({
    required final String type,
    required final String startDate,
    required final String endDate,
    final String? reason,
    final List<String> attachmentUrls,
  }) = _$CreateRequestPayloadImpl;

  factory _CreateRequestPayload.fromJson(Map<String, dynamic> json) =
      _$CreateRequestPayloadImpl.fromJson;

  @override
  String get type;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  String? get reason;
  @override
  List<String> get attachmentUrls;

  /// Create a copy of CreateRequestPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRequestPayloadImplCopyWith<_$CreateRequestPayloadImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AttachmentUploadResult _$AttachmentUploadResultFromJson(
  Map<String, dynamic> json,
) {
  return _AttachmentUploadResult.fromJson(json);
}

/// @nodoc
mixin _$AttachmentUploadResult {
  String get url => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;

  /// Serializes this AttachmentUploadResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttachmentUploadResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachmentUploadResultCopyWith<AttachmentUploadResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentUploadResultCopyWith<$Res> {
  factory $AttachmentUploadResultCopyWith(
    AttachmentUploadResult value,
    $Res Function(AttachmentUploadResult) then,
  ) = _$AttachmentUploadResultCopyWithImpl<$Res, AttachmentUploadResult>;
  @useResult
  $Res call({String url, String filename});
}

/// @nodoc
class _$AttachmentUploadResultCopyWithImpl<
  $Res,
  $Val extends AttachmentUploadResult
>
    implements $AttachmentUploadResultCopyWith<$Res> {
  _$AttachmentUploadResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttachmentUploadResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null, Object? filename = null}) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            filename: null == filename
                ? _value.filename
                : filename // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttachmentUploadResultImplCopyWith<$Res>
    implements $AttachmentUploadResultCopyWith<$Res> {
  factory _$$AttachmentUploadResultImplCopyWith(
    _$AttachmentUploadResultImpl value,
    $Res Function(_$AttachmentUploadResultImpl) then,
  ) = __$$AttachmentUploadResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String filename});
}

/// @nodoc
class __$$AttachmentUploadResultImplCopyWithImpl<$Res>
    extends
        _$AttachmentUploadResultCopyWithImpl<$Res, _$AttachmentUploadResultImpl>
    implements _$$AttachmentUploadResultImplCopyWith<$Res> {
  __$$AttachmentUploadResultImplCopyWithImpl(
    _$AttachmentUploadResultImpl _value,
    $Res Function(_$AttachmentUploadResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AttachmentUploadResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null, Object? filename = null}) {
    return _then(
      _$AttachmentUploadResultImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        filename: null == filename
            ? _value.filename
            : filename // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AttachmentUploadResultImpl implements _AttachmentUploadResult {
  const _$AttachmentUploadResultImpl({
    required this.url,
    required this.filename,
  });

  factory _$AttachmentUploadResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentUploadResultImplFromJson(json);

  @override
  final String url;
  @override
  final String filename;

  @override
  String toString() {
    return 'AttachmentUploadResult(url: $url, filename: $filename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentUploadResultImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.filename, filename) ||
                other.filename == filename));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, filename);

  /// Create a copy of AttachmentUploadResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentUploadResultImplCopyWith<_$AttachmentUploadResultImpl>
  get copyWith =>
      __$$AttachmentUploadResultImplCopyWithImpl<_$AttachmentUploadResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentUploadResultImplToJson(this);
  }
}

abstract class _AttachmentUploadResult implements AttachmentUploadResult {
  const factory _AttachmentUploadResult({
    required final String url,
    required final String filename,
  }) = _$AttachmentUploadResultImpl;

  factory _AttachmentUploadResult.fromJson(Map<String, dynamic> json) =
      _$AttachmentUploadResultImpl.fromJson;

  @override
  String get url;
  @override
  String get filename;

  /// Create a copy of AttachmentUploadResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachmentUploadResultImplCopyWith<_$AttachmentUploadResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CreatedRequest _$CreatedRequestFromJson(Map<String, dynamic> json) {
  return _CreatedRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatedRequest {
  int get id => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // Server sends camelCase 'firstApproverId' despite snake_case build.yaml global setting.
  @JsonKey(name: 'firstApproverId')
  int? get firstApproverId => throw _privateConstructorUsedError;

  /// Serializes this CreatedRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatedRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatedRequestCopyWith<CreatedRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedRequestCopyWith<$Res> {
  factory $CreatedRequestCopyWith(
    CreatedRequest value,
    $Res Function(CreatedRequest) then,
  ) = _$CreatedRequestCopyWithImpl<$Res, CreatedRequest>;
  @useResult
  $Res call({
    int id,
    String status,
    @JsonKey(name: 'firstApproverId') int? firstApproverId,
  });
}

/// @nodoc
class _$CreatedRequestCopyWithImpl<$Res, $Val extends CreatedRequest>
    implements $CreatedRequestCopyWith<$Res> {
  _$CreatedRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatedRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? firstApproverId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            firstApproverId: freezed == firstApproverId
                ? _value.firstApproverId
                : firstApproverId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreatedRequestImplCopyWith<$Res>
    implements $CreatedRequestCopyWith<$Res> {
  factory _$$CreatedRequestImplCopyWith(
    _$CreatedRequestImpl value,
    $Res Function(_$CreatedRequestImpl) then,
  ) = __$$CreatedRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String status,
    @JsonKey(name: 'firstApproverId') int? firstApproverId,
  });
}

/// @nodoc
class __$$CreatedRequestImplCopyWithImpl<$Res>
    extends _$CreatedRequestCopyWithImpl<$Res, _$CreatedRequestImpl>
    implements _$$CreatedRequestImplCopyWith<$Res> {
  __$$CreatedRequestImplCopyWithImpl(
    _$CreatedRequestImpl _value,
    $Res Function(_$CreatedRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatedRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? firstApproverId = freezed,
  }) {
    return _then(
      _$CreatedRequestImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        firstApproverId: freezed == firstApproverId
            ? _value.firstApproverId
            : firstApproverId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatedRequestImpl implements _CreatedRequest {
  const _$CreatedRequestImpl({
    required this.id,
    required this.status,
    @JsonKey(name: 'firstApproverId') this.firstApproverId,
  });

  factory _$CreatedRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatedRequestImplFromJson(json);

  @override
  final int id;
  @override
  final String status;
  // Server sends camelCase 'firstApproverId' despite snake_case build.yaml global setting.
  @override
  @JsonKey(name: 'firstApproverId')
  final int? firstApproverId;

  @override
  String toString() {
    return 'CreatedRequest(id: $id, status: $status, firstApproverId: $firstApproverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.firstApproverId, firstApproverId) ||
                other.firstApproverId == firstApproverId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, firstApproverId);

  /// Create a copy of CreatedRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedRequestImplCopyWith<_$CreatedRequestImpl> get copyWith =>
      __$$CreatedRequestImplCopyWithImpl<_$CreatedRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatedRequestImplToJson(this);
  }
}

abstract class _CreatedRequest implements CreatedRequest {
  const factory _CreatedRequest({
    required final int id,
    required final String status,
    @JsonKey(name: 'firstApproverId') final int? firstApproverId,
  }) = _$CreatedRequestImpl;

  factory _CreatedRequest.fromJson(Map<String, dynamic> json) =
      _$CreatedRequestImpl.fromJson;

  @override
  int get id;
  @override
  String get status; // Server sends camelCase 'firstApproverId' despite snake_case build.yaml global setting.
  @override
  @JsonKey(name: 'firstApproverId')
  int? get firstApproverId;

  /// Create a copy of CreatedRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatedRequestImplCopyWith<_$CreatedRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
