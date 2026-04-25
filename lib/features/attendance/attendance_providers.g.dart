// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$attendanceApiHash() => r'608c0bf50b62406c0a094610260a7ba38da4d614';

/// See also [attendanceApi].
@ProviderFor(attendanceApi)
final attendanceApiProvider = AutoDisposeProvider<AttendanceApi>.internal(
  attendanceApi,
  name: r'attendanceApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attendanceApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AttendanceApiRef = AutoDisposeProviderRef<AttendanceApi>;
String _$locationsApiHash() => r'11b0aaab6246b3cdf5bd5d1cb37e677837c2d07c';

/// See also [locationsApi].
@ProviderFor(locationsApi)
final locationsApiProvider = AutoDisposeProvider<LocationsApi>.internal(
  locationsApi,
  name: r'locationsApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationsApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationsApiRef = AutoDisposeProviderRef<LocationsApi>;
String _$geolocationServiceHash() =>
    r'04dfdb853bd443a5698d05dabefbe8325244f871';

/// See also [geolocationService].
@ProviderFor(geolocationService)
final geolocationServiceProvider =
    AutoDisposeProvider<GeolocationService>.internal(
      geolocationService,
      name: r'geolocationServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$geolocationServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GeolocationServiceRef = AutoDisposeProviderRef<GeolocationService>;
String _$photoCompressorHash() => r'b1a31c120ae3658c23cd0a80829f4f0170804f82';

/// See also [photoCompressor].
@ProviderFor(photoCompressor)
final photoCompressorProvider = AutoDisposeProvider<PhotoCompressor>.internal(
  photoCompressor,
  name: r'photoCompressorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$photoCompressorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PhotoCompressorRef = AutoDisposeProviderRef<PhotoCompressor>;
String _$cameraServiceHash() => r'f2328f9d3732a3529b2b2928d39854eb8ae07bf9';

/// See also [cameraService].
@ProviderFor(cameraService)
final cameraServiceProvider = AutoDisposeProvider<CameraService>.internal(
  cameraService,
  name: r'cameraServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cameraServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CameraServiceRef = AutoDisposeProviderRef<CameraService>;
String _$checkInSubmitterHash() => r'e3df372ecc351271d4e3059ba22c7a2515a7e5ec';

/// See also [checkInSubmitter].
@ProviderFor(checkInSubmitter)
final checkInSubmitterProvider = AutoDisposeProvider<CheckInSubmitter>.internal(
  checkInSubmitter,
  name: r'checkInSubmitterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkInSubmitterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CheckInSubmitterRef = AutoDisposeProviderRef<CheckInSubmitter>;
String _$offlineRetryWorkerHash() =>
    r'f2a1829a5fc056ea09a65ee0b79a6d6fcdf366ed';

/// See also [offlineRetryWorker].
@ProviderFor(offlineRetryWorker)
final offlineRetryWorkerProvider =
    AutoDisposeProvider<OfflineRetryWorker>.internal(
      offlineRetryWorker,
      name: r'offlineRetryWorkerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$offlineRetryWorkerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OfflineRetryWorkerRef = AutoDisposeProviderRef<OfflineRetryWorker>;
String _$todayAttendanceHash() => r'39c3a713cd5807f1751951f71b82afb092813949';

/// Today's record for the authenticated user.
/// Server requires explicit employee_id (numeric); resolve from JWT-backed user.
///
/// Copied from [todayAttendance].
@ProviderFor(todayAttendance)
final todayAttendanceProvider =
    AutoDisposeFutureProvider<AttendanceRecordDto?>.internal(
      todayAttendance,
      name: r'todayAttendanceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$todayAttendanceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodayAttendanceRef = AutoDisposeFutureProviderRef<AttendanceRecordDto?>;
String _$monthlyAttendanceHash() => r'79c9e51c358c1c3470d162f4069712d2da56033e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Monthly attendance for [year]/[month] — family provider.
///
/// Copied from [monthlyAttendance].
@ProviderFor(monthlyAttendance)
const monthlyAttendanceProvider = MonthlyAttendanceFamily();

/// Monthly attendance for [year]/[month] — family provider.
///
/// Copied from [monthlyAttendance].
class MonthlyAttendanceFamily extends Family<AsyncValue<MonthlyAttendanceDto>> {
  /// Monthly attendance for [year]/[month] — family provider.
  ///
  /// Copied from [monthlyAttendance].
  const MonthlyAttendanceFamily();

  /// Monthly attendance for [year]/[month] — family provider.
  ///
  /// Copied from [monthlyAttendance].
  MonthlyAttendanceProvider call({required String month}) {
    return MonthlyAttendanceProvider(month: month);
  }

  @override
  MonthlyAttendanceProvider getProviderOverride(
    covariant MonthlyAttendanceProvider provider,
  ) {
    return call(month: provider.month);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'monthlyAttendanceProvider';
}

/// Monthly attendance for [year]/[month] — family provider.
///
/// Copied from [monthlyAttendance].
class MonthlyAttendanceProvider
    extends AutoDisposeFutureProvider<MonthlyAttendanceDto> {
  /// Monthly attendance for [year]/[month] — family provider.
  ///
  /// Copied from [monthlyAttendance].
  MonthlyAttendanceProvider({required String month})
    : this._internal(
        (ref) => monthlyAttendance(ref as MonthlyAttendanceRef, month: month),
        from: monthlyAttendanceProvider,
        name: r'monthlyAttendanceProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$monthlyAttendanceHash,
        dependencies: MonthlyAttendanceFamily._dependencies,
        allTransitiveDependencies:
            MonthlyAttendanceFamily._allTransitiveDependencies,
        month: month,
      );

  MonthlyAttendanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
  }) : super.internal();

  final String month;

  @override
  Override overrideWith(
    FutureOr<MonthlyAttendanceDto> Function(MonthlyAttendanceRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MonthlyAttendanceProvider._internal(
        (ref) => create(ref as MonthlyAttendanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        month: month,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MonthlyAttendanceDto> createElement() {
    return _MonthlyAttendanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthlyAttendanceProvider && other.month == month;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MonthlyAttendanceRef
    on AutoDisposeFutureProviderRef<MonthlyAttendanceDto> {
  /// The parameter `month` of this provider.
  String get month;
}

class _MonthlyAttendanceProviderElement
    extends AutoDisposeFutureProviderElement<MonthlyAttendanceDto>
    with MonthlyAttendanceRef {
  _MonthlyAttendanceProviderElement(super.provider);

  @override
  String get month => (origin as MonthlyAttendanceProvider).month;
}

String _$hasApprovedWfhTodayHash() =>
    r'f65f5e84b2c6b56a0eb34cd22b7e96f86706881f';

/// See also [hasApprovedWfhToday].
@ProviderFor(hasApprovedWfhToday)
final hasApprovedWfhTodayProvider = AutoDisposeFutureProvider<bool>.internal(
  hasApprovedWfhToday,
  name: r'hasApprovedWfhTodayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasApprovedWfhTodayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HasApprovedWfhTodayRef = AutoDisposeFutureProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
