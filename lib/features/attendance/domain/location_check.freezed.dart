// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LocationCheck {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )
    inRadius,
    required TResult Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )
    outsideRadius,
    required TResult Function() unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )?
    inRadius,
    TResult? Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )?
    outsideRadius,
    TResult? Function()? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )?
    inRadius,
    TResult Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )?
    outsideRadius,
    TResult Function()? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInRadius value) inRadius,
    required TResult Function(LocationOutsideRadius value) outsideRadius,
    required TResult Function(LocationUnknown value) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationInRadius value)? inRadius,
    TResult? Function(LocationOutsideRadius value)? outsideRadius,
    TResult? Function(LocationUnknown value)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInRadius value)? inRadius,
    TResult Function(LocationOutsideRadius value)? outsideRadius,
    TResult Function(LocationUnknown value)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCheckCopyWith<$Res> {
  factory $LocationCheckCopyWith(
    LocationCheck value,
    $Res Function(LocationCheck) then,
  ) = _$LocationCheckCopyWithImpl<$Res, LocationCheck>;
}

/// @nodoc
class _$LocationCheckCopyWithImpl<$Res, $Val extends LocationCheck>
    implements $LocationCheckCopyWith<$Res> {
  _$LocationCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationCheck
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LocationInRadiusImplCopyWith<$Res> {
  factory _$$LocationInRadiusImplCopyWith(
    _$LocationInRadiusImpl value,
    $Res Function(_$LocationInRadiusImpl) then,
  ) = __$$LocationInRadiusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String locationCode,
    String locationName,
    double distanceM,
    int radiusM,
  });
}

/// @nodoc
class __$$LocationInRadiusImplCopyWithImpl<$Res>
    extends _$LocationCheckCopyWithImpl<$Res, _$LocationInRadiusImpl>
    implements _$$LocationInRadiusImplCopyWith<$Res> {
  __$$LocationInRadiusImplCopyWithImpl(
    _$LocationInRadiusImpl _value,
    $Res Function(_$LocationInRadiusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationCode = null,
    Object? locationName = null,
    Object? distanceM = null,
    Object? radiusM = null,
  }) {
    return _then(
      _$LocationInRadiusImpl(
        locationCode: null == locationCode
            ? _value.locationCode
            : locationCode // ignore: cast_nullable_to_non_nullable
                  as String,
        locationName: null == locationName
            ? _value.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String,
        distanceM: null == distanceM
            ? _value.distanceM
            : distanceM // ignore: cast_nullable_to_non_nullable
                  as double,
        radiusM: null == radiusM
            ? _value.radiusM
            : radiusM // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$LocationInRadiusImpl implements LocationInRadius {
  const _$LocationInRadiusImpl({
    required this.locationCode,
    required this.locationName,
    required this.distanceM,
    required this.radiusM,
  });

  @override
  final String locationCode;
  @override
  final String locationName;
  @override
  final double distanceM;
  @override
  final int radiusM;

  @override
  String toString() {
    return 'LocationCheck.inRadius(locationCode: $locationCode, locationName: $locationName, distanceM: $distanceM, radiusM: $radiusM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationInRadiusImpl &&
            (identical(other.locationCode, locationCode) ||
                other.locationCode == locationCode) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.distanceM, distanceM) ||
                other.distanceM == distanceM) &&
            (identical(other.radiusM, radiusM) || other.radiusM == radiusM));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, locationCode, locationName, distanceM, radiusM);

  /// Create a copy of LocationCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationInRadiusImplCopyWith<_$LocationInRadiusImpl> get copyWith =>
      __$$LocationInRadiusImplCopyWithImpl<_$LocationInRadiusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )
    inRadius,
    required TResult Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )
    outsideRadius,
    required TResult Function() unknown,
  }) {
    return inRadius(locationCode, locationName, distanceM, radiusM);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )?
    inRadius,
    TResult? Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )?
    outsideRadius,
    TResult? Function()? unknown,
  }) {
    return inRadius?.call(locationCode, locationName, distanceM, radiusM);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )?
    inRadius,
    TResult Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )?
    outsideRadius,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (inRadius != null) {
      return inRadius(locationCode, locationName, distanceM, radiusM);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInRadius value) inRadius,
    required TResult Function(LocationOutsideRadius value) outsideRadius,
    required TResult Function(LocationUnknown value) unknown,
  }) {
    return inRadius(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationInRadius value)? inRadius,
    TResult? Function(LocationOutsideRadius value)? outsideRadius,
    TResult? Function(LocationUnknown value)? unknown,
  }) {
    return inRadius?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInRadius value)? inRadius,
    TResult Function(LocationOutsideRadius value)? outsideRadius,
    TResult Function(LocationUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (inRadius != null) {
      return inRadius(this);
    }
    return orElse();
  }
}

abstract class LocationInRadius implements LocationCheck {
  const factory LocationInRadius({
    required final String locationCode,
    required final String locationName,
    required final double distanceM,
    required final int radiusM,
  }) = _$LocationInRadiusImpl;

  String get locationCode;
  String get locationName;
  double get distanceM;
  int get radiusM;

  /// Create a copy of LocationCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationInRadiusImplCopyWith<_$LocationInRadiusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationOutsideRadiusImplCopyWith<$Res> {
  factory _$$LocationOutsideRadiusImplCopyWith(
    _$LocationOutsideRadiusImpl value,
    $Res Function(_$LocationOutsideRadiusImpl) then,
  ) = __$$LocationOutsideRadiusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String? locationCode,
    String? locationName,
    double distanceM,
    int radiusM,
  });
}

/// @nodoc
class __$$LocationOutsideRadiusImplCopyWithImpl<$Res>
    extends _$LocationCheckCopyWithImpl<$Res, _$LocationOutsideRadiusImpl>
    implements _$$LocationOutsideRadiusImplCopyWith<$Res> {
  __$$LocationOutsideRadiusImplCopyWithImpl(
    _$LocationOutsideRadiusImpl _value,
    $Res Function(_$LocationOutsideRadiusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationCode = freezed,
    Object? locationName = freezed,
    Object? distanceM = null,
    Object? radiusM = null,
  }) {
    return _then(
      _$LocationOutsideRadiusImpl(
        locationCode: freezed == locationCode
            ? _value.locationCode
            : locationCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationName: freezed == locationName
            ? _value.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        distanceM: null == distanceM
            ? _value.distanceM
            : distanceM // ignore: cast_nullable_to_non_nullable
                  as double,
        radiusM: null == radiusM
            ? _value.radiusM
            : radiusM // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$LocationOutsideRadiusImpl implements LocationOutsideRadius {
  const _$LocationOutsideRadiusImpl({
    required this.locationCode,
    required this.locationName,
    required this.distanceM,
    required this.radiusM,
  });

  @override
  final String? locationCode;
  @override
  final String? locationName;
  @override
  final double distanceM;
  @override
  final int radiusM;

  @override
  String toString() {
    return 'LocationCheck.outsideRadius(locationCode: $locationCode, locationName: $locationName, distanceM: $distanceM, radiusM: $radiusM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationOutsideRadiusImpl &&
            (identical(other.locationCode, locationCode) ||
                other.locationCode == locationCode) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.distanceM, distanceM) ||
                other.distanceM == distanceM) &&
            (identical(other.radiusM, radiusM) || other.radiusM == radiusM));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, locationCode, locationName, distanceM, radiusM);

  /// Create a copy of LocationCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationOutsideRadiusImplCopyWith<_$LocationOutsideRadiusImpl>
  get copyWith =>
      __$$LocationOutsideRadiusImplCopyWithImpl<_$LocationOutsideRadiusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )
    inRadius,
    required TResult Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )
    outsideRadius,
    required TResult Function() unknown,
  }) {
    return outsideRadius(locationCode, locationName, distanceM, radiusM);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )?
    inRadius,
    TResult? Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )?
    outsideRadius,
    TResult? Function()? unknown,
  }) {
    return outsideRadius?.call(locationCode, locationName, distanceM, radiusM);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )?
    inRadius,
    TResult Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )?
    outsideRadius,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (outsideRadius != null) {
      return outsideRadius(locationCode, locationName, distanceM, radiusM);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInRadius value) inRadius,
    required TResult Function(LocationOutsideRadius value) outsideRadius,
    required TResult Function(LocationUnknown value) unknown,
  }) {
    return outsideRadius(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationInRadius value)? inRadius,
    TResult? Function(LocationOutsideRadius value)? outsideRadius,
    TResult? Function(LocationUnknown value)? unknown,
  }) {
    return outsideRadius?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInRadius value)? inRadius,
    TResult Function(LocationOutsideRadius value)? outsideRadius,
    TResult Function(LocationUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (outsideRadius != null) {
      return outsideRadius(this);
    }
    return orElse();
  }
}

abstract class LocationOutsideRadius implements LocationCheck {
  const factory LocationOutsideRadius({
    required final String? locationCode,
    required final String? locationName,
    required final double distanceM,
    required final int radiusM,
  }) = _$LocationOutsideRadiusImpl;

  String? get locationCode;
  String? get locationName;
  double get distanceM;
  int get radiusM;

  /// Create a copy of LocationCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationOutsideRadiusImplCopyWith<_$LocationOutsideRadiusImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationUnknownImplCopyWith<$Res> {
  factory _$$LocationUnknownImplCopyWith(
    _$LocationUnknownImpl value,
    $Res Function(_$LocationUnknownImpl) then,
  ) = __$$LocationUnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocationUnknownImplCopyWithImpl<$Res>
    extends _$LocationCheckCopyWithImpl<$Res, _$LocationUnknownImpl>
    implements _$$LocationUnknownImplCopyWith<$Res> {
  __$$LocationUnknownImplCopyWithImpl(
    _$LocationUnknownImpl _value,
    $Res Function(_$LocationUnknownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationCheck
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LocationUnknownImpl implements LocationUnknown {
  const _$LocationUnknownImpl();

  @override
  String toString() {
    return 'LocationCheck.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LocationUnknownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )
    inRadius,
    required TResult Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )
    outsideRadius,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )?
    inRadius,
    TResult? Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )?
    outsideRadius,
    TResult? Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String locationCode,
      String locationName,
      double distanceM,
      int radiusM,
    )?
    inRadius,
    TResult Function(
      String? locationCode,
      String? locationName,
      double distanceM,
      int radiusM,
    )?
    outsideRadius,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInRadius value) inRadius,
    required TResult Function(LocationOutsideRadius value) outsideRadius,
    required TResult Function(LocationUnknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationInRadius value)? inRadius,
    TResult? Function(LocationOutsideRadius value)? outsideRadius,
    TResult? Function(LocationUnknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInRadius value)? inRadius,
    TResult Function(LocationOutsideRadius value)? outsideRadius,
    TResult Function(LocationUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class LocationUnknown implements LocationCheck {
  const factory LocationUnknown() = _$LocationUnknownImpl;
}
