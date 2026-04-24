// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_entry_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CalendarEntryDto _$CalendarEntryDtoFromJson(Map<String, dynamic> json) {
  return _CalendarEntryDto.fromJson(json);
}

/// @nodoc
mixin _$CalendarEntryDto {
  int get id => throw _privateConstructorUsedError;
  String get date =>
      throw _privateConstructorUsedError; // 'holiday' | 'working_saturday' | 'custom'
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this CalendarEntryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalendarEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarEntryDtoCopyWith<CalendarEntryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEntryDtoCopyWith<$Res> {
  factory $CalendarEntryDtoCopyWith(
    CalendarEntryDto value,
    $Res Function(CalendarEntryDto) then,
  ) = _$CalendarEntryDtoCopyWithImpl<$Res, CalendarEntryDto>;
  @useResult
  $Res call({
    int id,
    String date,
    String type,
    String name,
    String? description,
  });
}

/// @nodoc
class _$CalendarEntryDtoCopyWithImpl<$Res, $Val extends CalendarEntryDto>
    implements $CalendarEntryDtoCopyWith<$Res> {
  _$CalendarEntryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? type = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CalendarEntryDtoImplCopyWith<$Res>
    implements $CalendarEntryDtoCopyWith<$Res> {
  factory _$$CalendarEntryDtoImplCopyWith(
    _$CalendarEntryDtoImpl value,
    $Res Function(_$CalendarEntryDtoImpl) then,
  ) = __$$CalendarEntryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String date,
    String type,
    String name,
    String? description,
  });
}

/// @nodoc
class __$$CalendarEntryDtoImplCopyWithImpl<$Res>
    extends _$CalendarEntryDtoCopyWithImpl<$Res, _$CalendarEntryDtoImpl>
    implements _$$CalendarEntryDtoImplCopyWith<$Res> {
  __$$CalendarEntryDtoImplCopyWithImpl(
    _$CalendarEntryDtoImpl _value,
    $Res Function(_$CalendarEntryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalendarEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? type = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(
      _$CalendarEntryDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarEntryDtoImpl implements _CalendarEntryDto {
  const _$CalendarEntryDtoImpl({
    required this.id,
    required this.date,
    required this.type,
    required this.name,
    this.description,
  });

  factory _$CalendarEntryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarEntryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String date;
  // 'holiday' | 'working_saturday' | 'custom'
  @override
  final String type;
  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'CalendarEntryDto(id: $id, date: $date, type: $type, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarEntryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, type, name, description);

  /// Create a copy of CalendarEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarEntryDtoImplCopyWith<_$CalendarEntryDtoImpl> get copyWith =>
      __$$CalendarEntryDtoImplCopyWithImpl<_$CalendarEntryDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarEntryDtoImplToJson(this);
  }
}

abstract class _CalendarEntryDto implements CalendarEntryDto {
  const factory _CalendarEntryDto({
    required final int id,
    required final String date,
    required final String type,
    required final String name,
    final String? description,
  }) = _$CalendarEntryDtoImpl;

  factory _CalendarEntryDto.fromJson(Map<String, dynamic> json) =
      _$CalendarEntryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get date; // 'holiday' | 'working_saturday' | 'custom'
  @override
  String get type;
  @override
  String get name;
  @override
  String? get description;

  /// Create a copy of CalendarEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarEntryDtoImplCopyWith<_$CalendarEntryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
