// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckInFlowState {
  /// Which wizard step is active (0=permission, 1=location, 2=selfie, 3=confirm).
  int get step => throw _privateConstructorUsedError;

  /// 'checkin' | 'checkout' | 'wfh_checkin' | 'wfh_checkout'
  String get type => throw _privateConstructorUsedError;

  /// GPS fix (null until step 1 completes).
  Position? get position => throw _privateConstructorUsedError;

  /// Client-side location pre-check result.
  LocationCheck? get locationCheck => throw _privateConstructorUsedError;

  /// Compressed JPEG file ready for encoding.
  File? get photoFile => throw _privateConstructorUsedError;

  /// User-entered note (optional, step 3).
  String get note => throw _privateConstructorUsedError;

  /// True while submitting — disables confirm button.
  bool get isSubmitting => throw _privateConstructorUsedError;

  /// Non-null when submission completed.
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CheckInFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInFlowStateCopyWith<CheckInFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInFlowStateCopyWith<$Res> {
  factory $CheckInFlowStateCopyWith(
    CheckInFlowState value,
    $Res Function(CheckInFlowState) then,
  ) = _$CheckInFlowStateCopyWithImpl<$Res, CheckInFlowState>;
  @useResult
  $Res call({
    int step,
    String type,
    Position? position,
    LocationCheck? locationCheck,
    File? photoFile,
    String note,
    bool isSubmitting,
    String? errorMessage,
  });

  $LocationCheckCopyWith<$Res>? get locationCheck;
}

/// @nodoc
class _$CheckInFlowStateCopyWithImpl<$Res, $Val extends CheckInFlowState>
    implements $CheckInFlowStateCopyWith<$Res> {
  _$CheckInFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? type = null,
    Object? position = freezed,
    Object? locationCheck = freezed,
    Object? photoFile = freezed,
    Object? note = null,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            step: null == step
                ? _value.step
                : step // ignore: cast_nullable_to_non_nullable
                      as int,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as Position?,
            locationCheck: freezed == locationCheck
                ? _value.locationCheck
                : locationCheck // ignore: cast_nullable_to_non_nullable
                      as LocationCheck?,
            photoFile: freezed == photoFile
                ? _value.photoFile
                : photoFile // ignore: cast_nullable_to_non_nullable
                      as File?,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String,
            isSubmitting: null == isSubmitting
                ? _value.isSubmitting
                : isSubmitting // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckInFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCheckCopyWith<$Res>? get locationCheck {
    if (_value.locationCheck == null) {
      return null;
    }

    return $LocationCheckCopyWith<$Res>(_value.locationCheck!, (value) {
      return _then(_value.copyWith(locationCheck: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckInFlowStateImplCopyWith<$Res>
    implements $CheckInFlowStateCopyWith<$Res> {
  factory _$$CheckInFlowStateImplCopyWith(
    _$CheckInFlowStateImpl value,
    $Res Function(_$CheckInFlowStateImpl) then,
  ) = __$$CheckInFlowStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int step,
    String type,
    Position? position,
    LocationCheck? locationCheck,
    File? photoFile,
    String note,
    bool isSubmitting,
    String? errorMessage,
  });

  @override
  $LocationCheckCopyWith<$Res>? get locationCheck;
}

/// @nodoc
class __$$CheckInFlowStateImplCopyWithImpl<$Res>
    extends _$CheckInFlowStateCopyWithImpl<$Res, _$CheckInFlowStateImpl>
    implements _$$CheckInFlowStateImplCopyWith<$Res> {
  __$$CheckInFlowStateImplCopyWithImpl(
    _$CheckInFlowStateImpl _value,
    $Res Function(_$CheckInFlowStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? type = null,
    Object? position = freezed,
    Object? locationCheck = freezed,
    Object? photoFile = freezed,
    Object? note = null,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$CheckInFlowStateImpl(
        step: null == step
            ? _value.step
            : step // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as Position?,
        locationCheck: freezed == locationCheck
            ? _value.locationCheck
            : locationCheck // ignore: cast_nullable_to_non_nullable
                  as LocationCheck?,
        photoFile: freezed == photoFile
            ? _value.photoFile
            : photoFile // ignore: cast_nullable_to_non_nullable
                  as File?,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
        isSubmitting: null == isSubmitting
            ? _value.isSubmitting
            : isSubmitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CheckInFlowStateImpl implements _CheckInFlowState {
  const _$CheckInFlowStateImpl({
    this.step = 0,
    this.type = 'checkin',
    this.position,
    this.locationCheck,
    this.photoFile,
    this.note = '',
    this.isSubmitting = false,
    this.errorMessage,
  });

  /// Which wizard step is active (0=permission, 1=location, 2=selfie, 3=confirm).
  @override
  @JsonKey()
  final int step;

  /// 'checkin' | 'checkout' | 'wfh_checkin' | 'wfh_checkout'
  @override
  @JsonKey()
  final String type;

  /// GPS fix (null until step 1 completes).
  @override
  final Position? position;

  /// Client-side location pre-check result.
  @override
  final LocationCheck? locationCheck;

  /// Compressed JPEG file ready for encoding.
  @override
  final File? photoFile;

  /// User-entered note (optional, step 3).
  @override
  @JsonKey()
  final String note;

  /// True while submitting — disables confirm button.
  @override
  @JsonKey()
  final bool isSubmitting;

  /// Non-null when submission completed.
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CheckInFlowState(step: $step, type: $type, position: $position, locationCheck: $locationCheck, photoFile: $photoFile, note: $note, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInFlowStateImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.locationCheck, locationCheck) ||
                other.locationCheck == locationCheck) &&
            (identical(other.photoFile, photoFile) ||
                other.photoFile == photoFile) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    step,
    type,
    position,
    locationCheck,
    photoFile,
    note,
    isSubmitting,
    errorMessage,
  );

  /// Create a copy of CheckInFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInFlowStateImplCopyWith<_$CheckInFlowStateImpl> get copyWith =>
      __$$CheckInFlowStateImplCopyWithImpl<_$CheckInFlowStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CheckInFlowState implements CheckInFlowState {
  const factory _CheckInFlowState({
    final int step,
    final String type,
    final Position? position,
    final LocationCheck? locationCheck,
    final File? photoFile,
    final String note,
    final bool isSubmitting,
    final String? errorMessage,
  }) = _$CheckInFlowStateImpl;

  /// Which wizard step is active (0=permission, 1=location, 2=selfie, 3=confirm).
  @override
  int get step;

  /// 'checkin' | 'checkout' | 'wfh_checkin' | 'wfh_checkout'
  @override
  String get type;

  /// GPS fix (null until step 1 completes).
  @override
  Position? get position;

  /// Client-side location pre-check result.
  @override
  LocationCheck? get locationCheck;

  /// Compressed JPEG file ready for encoding.
  @override
  File? get photoFile;

  /// User-entered note (optional, step 3).
  @override
  String get note;

  /// True while submitting — disables confirm button.
  @override
  bool get isSubmitting;

  /// Non-null when submission completed.
  @override
  String? get errorMessage;

  /// Create a copy of CheckInFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInFlowStateImplCopyWith<_$CheckInFlowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
