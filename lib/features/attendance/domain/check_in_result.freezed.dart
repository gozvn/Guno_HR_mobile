// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckInResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckinResponseDto response) success,
    required TResult Function(String pendingId) queuedOffline,
    required TResult Function(AppFailure failure) failed,
    required TResult Function(String serverMessage) outsideRadius,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckinResponseDto response)? success,
    TResult? Function(String pendingId)? queuedOffline,
    TResult? Function(AppFailure failure)? failed,
    TResult? Function(String serverMessage)? outsideRadius,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckinResponseDto response)? success,
    TResult Function(String pendingId)? queuedOffline,
    TResult Function(AppFailure failure)? failed,
    TResult Function(String serverMessage)? outsideRadius,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckInSuccess value) success,
    required TResult Function(CheckInQueuedOffline value) queuedOffline,
    required TResult Function(CheckInFailed value) failed,
    required TResult Function(CheckInOutsideRadius value) outsideRadius,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckInSuccess value)? success,
    TResult? Function(CheckInQueuedOffline value)? queuedOffline,
    TResult? Function(CheckInFailed value)? failed,
    TResult? Function(CheckInOutsideRadius value)? outsideRadius,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckInSuccess value)? success,
    TResult Function(CheckInQueuedOffline value)? queuedOffline,
    TResult Function(CheckInFailed value)? failed,
    TResult Function(CheckInOutsideRadius value)? outsideRadius,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInResultCopyWith<$Res> {
  factory $CheckInResultCopyWith(
    CheckInResult value,
    $Res Function(CheckInResult) then,
  ) = _$CheckInResultCopyWithImpl<$Res, CheckInResult>;
}

/// @nodoc
class _$CheckInResultCopyWithImpl<$Res, $Val extends CheckInResult>
    implements $CheckInResultCopyWith<$Res> {
  _$CheckInResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckInSuccessImplCopyWith<$Res> {
  factory _$$CheckInSuccessImplCopyWith(
    _$CheckInSuccessImpl value,
    $Res Function(_$CheckInSuccessImpl) then,
  ) = __$$CheckInSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckinResponseDto response});

  $CheckinResponseDtoCopyWith<$Res> get response;
}

/// @nodoc
class __$$CheckInSuccessImplCopyWithImpl<$Res>
    extends _$CheckInResultCopyWithImpl<$Res, _$CheckInSuccessImpl>
    implements _$$CheckInSuccessImplCopyWith<$Res> {
  __$$CheckInSuccessImplCopyWithImpl(
    _$CheckInSuccessImpl _value,
    $Res Function(_$CheckInSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? response = null}) {
    return _then(
      _$CheckInSuccessImpl(
        null == response
            ? _value.response
            : response // ignore: cast_nullable_to_non_nullable
                  as CheckinResponseDto,
      ),
    );
  }

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckinResponseDtoCopyWith<$Res> get response {
    return $CheckinResponseDtoCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$CheckInSuccessImpl implements CheckInSuccess {
  const _$CheckInSuccessImpl(this.response);

  @override
  final CheckinResponseDto response;

  @override
  String toString() {
    return 'CheckInResult.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInSuccessImplCopyWith<_$CheckInSuccessImpl> get copyWith =>
      __$$CheckInSuccessImplCopyWithImpl<_$CheckInSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckinResponseDto response) success,
    required TResult Function(String pendingId) queuedOffline,
    required TResult Function(AppFailure failure) failed,
    required TResult Function(String serverMessage) outsideRadius,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckinResponseDto response)? success,
    TResult? Function(String pendingId)? queuedOffline,
    TResult? Function(AppFailure failure)? failed,
    TResult? Function(String serverMessage)? outsideRadius,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckinResponseDto response)? success,
    TResult Function(String pendingId)? queuedOffline,
    TResult Function(AppFailure failure)? failed,
    TResult Function(String serverMessage)? outsideRadius,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckInSuccess value) success,
    required TResult Function(CheckInQueuedOffline value) queuedOffline,
    required TResult Function(CheckInFailed value) failed,
    required TResult Function(CheckInOutsideRadius value) outsideRadius,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckInSuccess value)? success,
    TResult? Function(CheckInQueuedOffline value)? queuedOffline,
    TResult? Function(CheckInFailed value)? failed,
    TResult? Function(CheckInOutsideRadius value)? outsideRadius,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckInSuccess value)? success,
    TResult Function(CheckInQueuedOffline value)? queuedOffline,
    TResult Function(CheckInFailed value)? failed,
    TResult Function(CheckInOutsideRadius value)? outsideRadius,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CheckInSuccess implements CheckInResult {
  const factory CheckInSuccess(final CheckinResponseDto response) =
      _$CheckInSuccessImpl;

  CheckinResponseDto get response;

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInSuccessImplCopyWith<_$CheckInSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckInQueuedOfflineImplCopyWith<$Res> {
  factory _$$CheckInQueuedOfflineImplCopyWith(
    _$CheckInQueuedOfflineImpl value,
    $Res Function(_$CheckInQueuedOfflineImpl) then,
  ) = __$$CheckInQueuedOfflineImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pendingId});
}

/// @nodoc
class __$$CheckInQueuedOfflineImplCopyWithImpl<$Res>
    extends _$CheckInResultCopyWithImpl<$Res, _$CheckInQueuedOfflineImpl>
    implements _$$CheckInQueuedOfflineImplCopyWith<$Res> {
  __$$CheckInQueuedOfflineImplCopyWithImpl(
    _$CheckInQueuedOfflineImpl _value,
    $Res Function(_$CheckInQueuedOfflineImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pendingId = null}) {
    return _then(
      _$CheckInQueuedOfflineImpl(
        null == pendingId
            ? _value.pendingId
            : pendingId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CheckInQueuedOfflineImpl implements CheckInQueuedOffline {
  const _$CheckInQueuedOfflineImpl(this.pendingId);

  @override
  final String pendingId;

  @override
  String toString() {
    return 'CheckInResult.queuedOffline(pendingId: $pendingId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInQueuedOfflineImpl &&
            (identical(other.pendingId, pendingId) ||
                other.pendingId == pendingId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pendingId);

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInQueuedOfflineImplCopyWith<_$CheckInQueuedOfflineImpl>
  get copyWith =>
      __$$CheckInQueuedOfflineImplCopyWithImpl<_$CheckInQueuedOfflineImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckinResponseDto response) success,
    required TResult Function(String pendingId) queuedOffline,
    required TResult Function(AppFailure failure) failed,
    required TResult Function(String serverMessage) outsideRadius,
  }) {
    return queuedOffline(pendingId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckinResponseDto response)? success,
    TResult? Function(String pendingId)? queuedOffline,
    TResult? Function(AppFailure failure)? failed,
    TResult? Function(String serverMessage)? outsideRadius,
  }) {
    return queuedOffline?.call(pendingId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckinResponseDto response)? success,
    TResult Function(String pendingId)? queuedOffline,
    TResult Function(AppFailure failure)? failed,
    TResult Function(String serverMessage)? outsideRadius,
    required TResult orElse(),
  }) {
    if (queuedOffline != null) {
      return queuedOffline(pendingId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckInSuccess value) success,
    required TResult Function(CheckInQueuedOffline value) queuedOffline,
    required TResult Function(CheckInFailed value) failed,
    required TResult Function(CheckInOutsideRadius value) outsideRadius,
  }) {
    return queuedOffline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckInSuccess value)? success,
    TResult? Function(CheckInQueuedOffline value)? queuedOffline,
    TResult? Function(CheckInFailed value)? failed,
    TResult? Function(CheckInOutsideRadius value)? outsideRadius,
  }) {
    return queuedOffline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckInSuccess value)? success,
    TResult Function(CheckInQueuedOffline value)? queuedOffline,
    TResult Function(CheckInFailed value)? failed,
    TResult Function(CheckInOutsideRadius value)? outsideRadius,
    required TResult orElse(),
  }) {
    if (queuedOffline != null) {
      return queuedOffline(this);
    }
    return orElse();
  }
}

abstract class CheckInQueuedOffline implements CheckInResult {
  const factory CheckInQueuedOffline(final String pendingId) =
      _$CheckInQueuedOfflineImpl;

  String get pendingId;

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInQueuedOfflineImplCopyWith<_$CheckInQueuedOfflineImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckInFailedImplCopyWith<$Res> {
  factory _$$CheckInFailedImplCopyWith(
    _$CheckInFailedImpl value,
    $Res Function(_$CheckInFailedImpl) then,
  ) = __$$CheckInFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppFailure failure});

  $AppFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$CheckInFailedImplCopyWithImpl<$Res>
    extends _$CheckInResultCopyWithImpl<$Res, _$CheckInFailedImpl>
    implements _$$CheckInFailedImplCopyWith<$Res> {
  __$$CheckInFailedImplCopyWithImpl(
    _$CheckInFailedImpl _value,
    $Res Function(_$CheckInFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? failure = null}) {
    return _then(
      _$CheckInFailedImpl(
        null == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as AppFailure,
      ),
    );
  }

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppFailureCopyWith<$Res> get failure {
    return $AppFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$CheckInFailedImpl implements CheckInFailed {
  const _$CheckInFailedImpl(this.failure);

  @override
  final AppFailure failure;

  @override
  String toString() {
    return 'CheckInResult.failed(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInFailedImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInFailedImplCopyWith<_$CheckInFailedImpl> get copyWith =>
      __$$CheckInFailedImplCopyWithImpl<_$CheckInFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckinResponseDto response) success,
    required TResult Function(String pendingId) queuedOffline,
    required TResult Function(AppFailure failure) failed,
    required TResult Function(String serverMessage) outsideRadius,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckinResponseDto response)? success,
    TResult? Function(String pendingId)? queuedOffline,
    TResult? Function(AppFailure failure)? failed,
    TResult? Function(String serverMessage)? outsideRadius,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckinResponseDto response)? success,
    TResult Function(String pendingId)? queuedOffline,
    TResult Function(AppFailure failure)? failed,
    TResult Function(String serverMessage)? outsideRadius,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckInSuccess value) success,
    required TResult Function(CheckInQueuedOffline value) queuedOffline,
    required TResult Function(CheckInFailed value) failed,
    required TResult Function(CheckInOutsideRadius value) outsideRadius,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckInSuccess value)? success,
    TResult? Function(CheckInQueuedOffline value)? queuedOffline,
    TResult? Function(CheckInFailed value)? failed,
    TResult? Function(CheckInOutsideRadius value)? outsideRadius,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckInSuccess value)? success,
    TResult Function(CheckInQueuedOffline value)? queuedOffline,
    TResult Function(CheckInFailed value)? failed,
    TResult Function(CheckInOutsideRadius value)? outsideRadius,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class CheckInFailed implements CheckInResult {
  const factory CheckInFailed(final AppFailure failure) = _$CheckInFailedImpl;

  AppFailure get failure;

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInFailedImplCopyWith<_$CheckInFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckInOutsideRadiusImplCopyWith<$Res> {
  factory _$$CheckInOutsideRadiusImplCopyWith(
    _$CheckInOutsideRadiusImpl value,
    $Res Function(_$CheckInOutsideRadiusImpl) then,
  ) = __$$CheckInOutsideRadiusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serverMessage});
}

/// @nodoc
class __$$CheckInOutsideRadiusImplCopyWithImpl<$Res>
    extends _$CheckInResultCopyWithImpl<$Res, _$CheckInOutsideRadiusImpl>
    implements _$$CheckInOutsideRadiusImplCopyWith<$Res> {
  __$$CheckInOutsideRadiusImplCopyWithImpl(
    _$CheckInOutsideRadiusImpl _value,
    $Res Function(_$CheckInOutsideRadiusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? serverMessage = null}) {
    return _then(
      _$CheckInOutsideRadiusImpl(
        null == serverMessage
            ? _value.serverMessage
            : serverMessage // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CheckInOutsideRadiusImpl implements CheckInOutsideRadius {
  const _$CheckInOutsideRadiusImpl(this.serverMessage);

  @override
  final String serverMessage;

  @override
  String toString() {
    return 'CheckInResult.outsideRadius(serverMessage: $serverMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInOutsideRadiusImpl &&
            (identical(other.serverMessage, serverMessage) ||
                other.serverMessage == serverMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serverMessage);

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInOutsideRadiusImplCopyWith<_$CheckInOutsideRadiusImpl>
  get copyWith =>
      __$$CheckInOutsideRadiusImplCopyWithImpl<_$CheckInOutsideRadiusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckinResponseDto response) success,
    required TResult Function(String pendingId) queuedOffline,
    required TResult Function(AppFailure failure) failed,
    required TResult Function(String serverMessage) outsideRadius,
  }) {
    return outsideRadius(serverMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckinResponseDto response)? success,
    TResult? Function(String pendingId)? queuedOffline,
    TResult? Function(AppFailure failure)? failed,
    TResult? Function(String serverMessage)? outsideRadius,
  }) {
    return outsideRadius?.call(serverMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckinResponseDto response)? success,
    TResult Function(String pendingId)? queuedOffline,
    TResult Function(AppFailure failure)? failed,
    TResult Function(String serverMessage)? outsideRadius,
    required TResult orElse(),
  }) {
    if (outsideRadius != null) {
      return outsideRadius(serverMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckInSuccess value) success,
    required TResult Function(CheckInQueuedOffline value) queuedOffline,
    required TResult Function(CheckInFailed value) failed,
    required TResult Function(CheckInOutsideRadius value) outsideRadius,
  }) {
    return outsideRadius(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckInSuccess value)? success,
    TResult? Function(CheckInQueuedOffline value)? queuedOffline,
    TResult? Function(CheckInFailed value)? failed,
    TResult? Function(CheckInOutsideRadius value)? outsideRadius,
  }) {
    return outsideRadius?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckInSuccess value)? success,
    TResult Function(CheckInQueuedOffline value)? queuedOffline,
    TResult Function(CheckInFailed value)? failed,
    TResult Function(CheckInOutsideRadius value)? outsideRadius,
    required TResult orElse(),
  }) {
    if (outsideRadius != null) {
      return outsideRadius(this);
    }
    return orElse();
  }
}

abstract class CheckInOutsideRadius implements CheckInResult {
  const factory CheckInOutsideRadius(final String serverMessage) =
      _$CheckInOutsideRadiusImpl;

  String get serverMessage;

  /// Create a copy of CheckInResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInOutsideRadiusImplCopyWith<_$CheckInOutsideRadiusImpl>
  get copyWith => throw _privateConstructorUsedError;
}
