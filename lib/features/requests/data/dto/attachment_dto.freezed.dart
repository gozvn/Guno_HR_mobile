// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attachment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AttachmentDto _$AttachmentDtoFromJson(Map<String, dynamic> json) {
  return _AttachmentDto.fromJson(json);
}

/// @nodoc
mixin _$AttachmentDto {
  int get id => throw _privateConstructorUsedError;
  int get requestId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  String? get uploadedAt => throw _privateConstructorUsedError;

  /// Serializes this AttachmentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttachmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachmentDtoCopyWith<AttachmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentDtoCopyWith<$Res> {
  factory $AttachmentDtoCopyWith(
    AttachmentDto value,
    $Res Function(AttachmentDto) then,
  ) = _$AttachmentDtoCopyWithImpl<$Res, AttachmentDto>;
  @useResult
  $Res call({
    int id,
    int requestId,
    String url,
    String filename,
    String? uploadedAt,
  });
}

/// @nodoc
class _$AttachmentDtoCopyWithImpl<$Res, $Val extends AttachmentDto>
    implements $AttachmentDtoCopyWith<$Res> {
  _$AttachmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttachmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestId = null,
    Object? url = null,
    Object? filename = null,
    Object? uploadedAt = freezed,
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
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            filename: null == filename
                ? _value.filename
                : filename // ignore: cast_nullable_to_non_nullable
                      as String,
            uploadedAt: freezed == uploadedAt
                ? _value.uploadedAt
                : uploadedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttachmentDtoImplCopyWith<$Res>
    implements $AttachmentDtoCopyWith<$Res> {
  factory _$$AttachmentDtoImplCopyWith(
    _$AttachmentDtoImpl value,
    $Res Function(_$AttachmentDtoImpl) then,
  ) = __$$AttachmentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int requestId,
    String url,
    String filename,
    String? uploadedAt,
  });
}

/// @nodoc
class __$$AttachmentDtoImplCopyWithImpl<$Res>
    extends _$AttachmentDtoCopyWithImpl<$Res, _$AttachmentDtoImpl>
    implements _$$AttachmentDtoImplCopyWith<$Res> {
  __$$AttachmentDtoImplCopyWithImpl(
    _$AttachmentDtoImpl _value,
    $Res Function(_$AttachmentDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AttachmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestId = null,
    Object? url = null,
    Object? filename = null,
    Object? uploadedAt = freezed,
  }) {
    return _then(
      _$AttachmentDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        requestId: null == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as int,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        filename: null == filename
            ? _value.filename
            : filename // ignore: cast_nullable_to_non_nullable
                  as String,
        uploadedAt: freezed == uploadedAt
            ? _value.uploadedAt
            : uploadedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AttachmentDtoImpl implements _AttachmentDto {
  const _$AttachmentDtoImpl({
    required this.id,
    required this.requestId,
    required this.url,
    required this.filename,
    this.uploadedAt,
  });

  factory _$AttachmentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int requestId;
  @override
  final String url;
  @override
  final String filename;
  @override
  final String? uploadedAt;

  @override
  String toString() {
    return 'AttachmentDto(id: $id, requestId: $requestId, url: $url, filename: $filename, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, requestId, url, filename, uploadedAt);

  /// Create a copy of AttachmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentDtoImplCopyWith<_$AttachmentDtoImpl> get copyWith =>
      __$$AttachmentDtoImplCopyWithImpl<_$AttachmentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentDtoImplToJson(this);
  }
}

abstract class _AttachmentDto implements AttachmentDto {
  const factory _AttachmentDto({
    required final int id,
    required final int requestId,
    required final String url,
    required final String filename,
    final String? uploadedAt,
  }) = _$AttachmentDtoImpl;

  factory _AttachmentDto.fromJson(Map<String, dynamic> json) =
      _$AttachmentDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get requestId;
  @override
  String get url;
  @override
  String get filename;
  @override
  String? get uploadedAt;

  /// Create a copy of AttachmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachmentDtoImplCopyWith<_$AttachmentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
