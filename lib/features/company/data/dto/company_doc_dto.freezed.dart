// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_doc_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CompanyDocDto _$CompanyDocDtoFromJson(Map<String, dynamic> json) {
  return _CompanyDocDto.fromJson(json);
}

/// @nodoc
mixin _$CompanyDocDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  int? get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError; // 'folder' | 'file'
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'mime_type')
  String? get mimeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_size')
  int? get fileSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_url')
  String? get fileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CompanyDocDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompanyDocDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyDocDtoCopyWith<CompanyDocDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyDocDtoCopyWith<$Res> {
  factory $CompanyDocDtoCopyWith(
    CompanyDocDto value,
    $Res Function(CompanyDocDto) then,
  ) = _$CompanyDocDtoCopyWithImpl<$Res, CompanyDocDto>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'parent_id') int? parentId,
    String name,
    String type,
    @JsonKey(name: 'mime_type') String? mimeType,
    @JsonKey(name: 'file_size') int? fileSize,
    @JsonKey(name: 'file_url') String? fileUrl,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$CompanyDocDtoCopyWithImpl<$Res, $Val extends CompanyDocDto>
    implements $CompanyDocDtoCopyWith<$Res> {
  _$CompanyDocDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompanyDocDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? name = null,
    Object? type = null,
    Object? mimeType = freezed,
    Object? fileSize = freezed,
    Object? fileUrl = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            mimeType: freezed == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileSize: freezed == fileSize
                ? _value.fileSize
                : fileSize // ignore: cast_nullable_to_non_nullable
                      as int?,
            fileUrl: freezed == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CompanyDocDtoImplCopyWith<$Res>
    implements $CompanyDocDtoCopyWith<$Res> {
  factory _$$CompanyDocDtoImplCopyWith(
    _$CompanyDocDtoImpl value,
    $Res Function(_$CompanyDocDtoImpl) then,
  ) = __$$CompanyDocDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'parent_id') int? parentId,
    String name,
    String type,
    @JsonKey(name: 'mime_type') String? mimeType,
    @JsonKey(name: 'file_size') int? fileSize,
    @JsonKey(name: 'file_url') String? fileUrl,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$CompanyDocDtoImplCopyWithImpl<$Res>
    extends _$CompanyDocDtoCopyWithImpl<$Res, _$CompanyDocDtoImpl>
    implements _$$CompanyDocDtoImplCopyWith<$Res> {
  __$$CompanyDocDtoImplCopyWithImpl(
    _$CompanyDocDtoImpl _value,
    $Res Function(_$CompanyDocDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompanyDocDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? name = null,
    Object? type = null,
    Object? mimeType = freezed,
    Object? fileSize = freezed,
    Object? fileUrl = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$CompanyDocDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        mimeType: freezed == mimeType
            ? _value.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileSize: freezed == fileSize
            ? _value.fileSize
            : fileSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        fileUrl: freezed == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyDocDtoImpl implements _CompanyDocDto {
  const _$CompanyDocDtoImpl({
    required this.id,
    @JsonKey(name: 'parent_id') this.parentId,
    required this.name,
    required this.type,
    @JsonKey(name: 'mime_type') this.mimeType,
    @JsonKey(name: 'file_size') this.fileSize,
    @JsonKey(name: 'file_url') this.fileUrl,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$CompanyDocDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyDocDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'parent_id')
  final int? parentId;
  @override
  final String name;
  // 'folder' | 'file'
  @override
  final String type;
  @override
  @JsonKey(name: 'mime_type')
  final String? mimeType;
  @override
  @JsonKey(name: 'file_size')
  final int? fileSize;
  @override
  @JsonKey(name: 'file_url')
  final String? fileUrl;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'CompanyDocDto(id: $id, parentId: $parentId, name: $name, type: $type, mimeType: $mimeType, fileSize: $fileSize, fileUrl: $fileUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyDocDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    parentId,
    name,
    type,
    mimeType,
    fileSize,
    fileUrl,
    createdAt,
  );

  /// Create a copy of CompanyDocDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyDocDtoImplCopyWith<_$CompanyDocDtoImpl> get copyWith =>
      __$$CompanyDocDtoImplCopyWithImpl<_$CompanyDocDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyDocDtoImplToJson(this);
  }
}

abstract class _CompanyDocDto implements CompanyDocDto {
  const factory _CompanyDocDto({
    required final int id,
    @JsonKey(name: 'parent_id') final int? parentId,
    required final String name,
    required final String type,
    @JsonKey(name: 'mime_type') final String? mimeType,
    @JsonKey(name: 'file_size') final int? fileSize,
    @JsonKey(name: 'file_url') final String? fileUrl,
    @JsonKey(name: 'created_at') required final String createdAt,
  }) = _$CompanyDocDtoImpl;

  factory _CompanyDocDto.fromJson(Map<String, dynamic> json) =
      _$CompanyDocDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'parent_id')
  int? get parentId;
  @override
  String get name; // 'folder' | 'file'
  @override
  String get type;
  @override
  @JsonKey(name: 'mime_type')
  String? get mimeType;
  @override
  @JsonKey(name: 'file_size')
  int? get fileSize;
  @override
  @JsonKey(name: 'file_url')
  String? get fileUrl;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of CompanyDocDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyDocDtoImplCopyWith<_$CompanyDocDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
