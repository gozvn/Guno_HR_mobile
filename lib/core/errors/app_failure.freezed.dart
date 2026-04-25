// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? required) forbidden,
    required TResult Function(int code, String? message) server,
    required TResult Function(String message) validation,
    required TResult Function(Object error) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? required)? forbidden,
    TResult? Function(int code, String? message)? server,
    TResult? Function(String message)? validation,
    TResult? Function(Object error)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? required)? forbidden,
    TResult Function(int code, String? message)? server,
    TResult Function(String message)? validation,
    TResult Function(Object error)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Server value) server,
    required TResult Function(_Validation value) validation,
    required TResult Function(_Unknown value) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Server value)? server,
    TResult? Function(_Validation value)? validation,
    TResult? Function(_Unknown value)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Server value)? server,
    TResult Function(_Validation value)? validation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
    AppFailure value,
    $Res Function(AppFailure) then,
  ) = _$AppFailureCopyWithImpl<$Res, AppFailure>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res, $Val extends AppFailure>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NetworkImplCopyWith<$Res> {
  factory _$$NetworkImplCopyWith(
    _$NetworkImpl value,
    $Res Function(_$NetworkImpl) then,
  ) = __$$NetworkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$NetworkImpl>
    implements _$$NetworkImplCopyWith<$Res> {
  __$$NetworkImplCopyWithImpl(
    _$NetworkImpl _value,
    $Res Function(_$NetworkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NetworkImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NetworkImpl implements _Network {
  const _$NetworkImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppFailure.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      __$$NetworkImplCopyWithImpl<_$NetworkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? required) forbidden,
    required TResult Function(int code, String? message) server,
    required TResult Function(String message) validation,
    required TResult Function(Object error) unknown,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? required)? forbidden,
    TResult? Function(int code, String? message)? server,
    TResult? Function(String message)? validation,
    TResult? Function(Object error)? unknown,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? required)? forbidden,
    TResult Function(int code, String? message)? server,
    TResult Function(String message)? validation,
    TResult Function(Object error)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Server value) server,
    required TResult Function(_Validation value) validation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Server value)? server,
    TResult? Function(_Validation value)? validation,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Server value)? server,
    TResult Function(_Validation value)? validation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _Network implements AppFailure {
  const factory _Network(final String message) = _$NetworkImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
    _$UnauthorizedImpl value,
    $Res Function(_$UnauthorizedImpl) then,
  ) = __$$UnauthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
    _$UnauthorizedImpl _value,
    $Res Function(_$UnauthorizedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed}) {
    return _then(
      _$UnauthorizedImpl(
        freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UnauthorizedImpl implements _Unauthorized {
  const _$UnauthorizedImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppFailure.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      __$$UnauthorizedImplCopyWithImpl<_$UnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? required) forbidden,
    required TResult Function(int code, String? message) server,
    required TResult Function(String message) validation,
    required TResult Function(Object error) unknown,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? required)? forbidden,
    TResult? Function(int code, String? message)? server,
    TResult? Function(String message)? validation,
    TResult? Function(Object error)? unknown,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? required)? forbidden,
    TResult Function(int code, String? message)? server,
    TResult Function(String message)? validation,
    TResult Function(Object error)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Server value) server,
    required TResult Function(_Validation value) validation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Server value)? server,
    TResult? Function(_Validation value)? validation,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Server value)? server,
    TResult Function(_Validation value)? validation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements AppFailure {
  const factory _Unauthorized([final String? message]) = _$UnauthorizedImpl;

  String? get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForbiddenImplCopyWith<$Res> {
  factory _$$ForbiddenImplCopyWith(
    _$ForbiddenImpl value,
    $Res Function(_$ForbiddenImpl) then,
  ) = __$$ForbiddenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? required});
}

/// @nodoc
class __$$ForbiddenImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$ForbiddenImpl>
    implements _$$ForbiddenImplCopyWith<$Res> {
  __$$ForbiddenImplCopyWithImpl(
    _$ForbiddenImpl _value,
    $Res Function(_$ForbiddenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? required = freezed}) {
    return _then(
      _$ForbiddenImpl(
        freezed == required
            ? _value.required
            : required // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ForbiddenImpl implements _Forbidden {
  const _$ForbiddenImpl(this.required);

  @override
  final String? required;

  @override
  String toString() {
    return 'AppFailure.forbidden(required: $required)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForbiddenImpl &&
            (identical(other.required, required) ||
                other.required == required));
  }

  @override
  int get hashCode => Object.hash(runtimeType, required);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForbiddenImplCopyWith<_$ForbiddenImpl> get copyWith =>
      __$$ForbiddenImplCopyWithImpl<_$ForbiddenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? required) forbidden,
    required TResult Function(int code, String? message) server,
    required TResult Function(String message) validation,
    required TResult Function(Object error) unknown,
  }) {
    return forbidden(required);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? required)? forbidden,
    TResult? Function(int code, String? message)? server,
    TResult? Function(String message)? validation,
    TResult? Function(Object error)? unknown,
  }) {
    return forbidden?.call(required);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? required)? forbidden,
    TResult Function(int code, String? message)? server,
    TResult Function(String message)? validation,
    TResult Function(Object error)? unknown,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(required);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Server value) server,
    required TResult Function(_Validation value) validation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return forbidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Server value)? server,
    TResult? Function(_Validation value)? validation,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return forbidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Server value)? server,
    TResult Function(_Validation value)? validation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(this);
    }
    return orElse();
  }
}

abstract class _Forbidden implements AppFailure {
  const factory _Forbidden(final String? required) = _$ForbiddenImpl;

  String? get required;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForbiddenImplCopyWith<_$ForbiddenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerImplCopyWith<$Res> {
  factory _$$ServerImplCopyWith(
    _$ServerImpl value,
    $Res Function(_$ServerImpl) then,
  ) = __$$ServerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int code, String? message});
}

/// @nodoc
class __$$ServerImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$ServerImpl>
    implements _$$ServerImplCopyWith<$Res> {
  __$$ServerImplCopyWithImpl(
    _$ServerImpl _value,
    $Res Function(_$ServerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? code = null, Object? message = freezed}) {
    return _then(
      _$ServerImpl(
        null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as int,
        freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ServerImpl implements _Server {
  const _$ServerImpl(this.code, this.message);

  @override
  final int code;
  @override
  final String? message;

  @override
  String toString() {
    return 'AppFailure.server(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerImplCopyWith<_$ServerImpl> get copyWith =>
      __$$ServerImplCopyWithImpl<_$ServerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? required) forbidden,
    required TResult Function(int code, String? message) server,
    required TResult Function(String message) validation,
    required TResult Function(Object error) unknown,
  }) {
    return server(code, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? required)? forbidden,
    TResult? Function(int code, String? message)? server,
    TResult? Function(String message)? validation,
    TResult? Function(Object error)? unknown,
  }) {
    return server?.call(code, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? required)? forbidden,
    TResult Function(int code, String? message)? server,
    TResult Function(String message)? validation,
    TResult Function(Object error)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(code, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Server value) server,
    required TResult Function(_Validation value) validation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Server value)? server,
    TResult? Function(_Validation value)? validation,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Server value)? server,
    TResult Function(_Validation value)? validation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _Server implements AppFailure {
  const factory _Server(final int code, final String? message) = _$ServerImpl;

  int get code;
  String? get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerImplCopyWith<_$ServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationImplCopyWith<$Res> {
  factory _$$ValidationImplCopyWith(
    _$ValidationImpl value,
    $Res Function(_$ValidationImpl) then,
  ) = __$$ValidationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ValidationImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$ValidationImpl>
    implements _$$ValidationImplCopyWith<$Res> {
  __$$ValidationImplCopyWithImpl(
    _$ValidationImpl _value,
    $Res Function(_$ValidationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ValidationImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ValidationImpl implements _Validation {
  const _$ValidationImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppFailure.validation(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationImplCopyWith<_$ValidationImpl> get copyWith =>
      __$$ValidationImplCopyWithImpl<_$ValidationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? required) forbidden,
    required TResult Function(int code, String? message) server,
    required TResult Function(String message) validation,
    required TResult Function(Object error) unknown,
  }) {
    return validation(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? required)? forbidden,
    TResult? Function(int code, String? message)? server,
    TResult? Function(String message)? validation,
    TResult? Function(Object error)? unknown,
  }) {
    return validation?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? required)? forbidden,
    TResult Function(int code, String? message)? server,
    TResult Function(String message)? validation,
    TResult Function(Object error)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Server value) server,
    required TResult Function(_Validation value) validation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Server value)? server,
    TResult? Function(_Validation value)? validation,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Server value)? server,
    TResult Function(_Validation value)? validation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class _Validation implements AppFailure {
  const factory _Validation(final String message) = _$ValidationImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationImplCopyWith<_$ValidationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
    _$UnknownImpl value,
    $Res Function(_$UnknownImpl) then,
  ) = __$$UnknownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
    _$UnknownImpl _value,
    $Res Function(_$UnknownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(_$UnknownImpl(null == error ? _value.error : error));
  }
}

/// @nodoc

class _$UnknownImpl implements _Unknown {
  const _$UnknownImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'AppFailure.unknown(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      __$$UnknownImplCopyWithImpl<_$UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? required) forbidden,
    required TResult Function(int code, String? message) server,
    required TResult Function(String message) validation,
    required TResult Function(Object error) unknown,
  }) {
    return unknown(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? required)? forbidden,
    TResult? Function(int code, String? message)? server,
    TResult? Function(String message)? validation,
    TResult? Function(Object error)? unknown,
  }) {
    return unknown?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? required)? forbidden,
    TResult Function(int code, String? message)? server,
    TResult Function(String message)? validation,
    TResult Function(Object error)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Forbidden value) forbidden,
    required TResult Function(_Server value) server,
    required TResult Function(_Validation value) validation,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Forbidden value)? forbidden,
    TResult? Function(_Server value)? server,
    TResult? Function(_Validation value)? validation,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Forbidden value)? forbidden,
    TResult Function(_Server value)? server,
    TResult Function(_Validation value)? validation,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements AppFailure {
  const factory _Unknown(final Object error) = _$UnknownImpl;

  Object get error;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
