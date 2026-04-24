// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leaveApiHash() => r'63abc83cb251e3396d32662579a071cce15f6478';

/// See also [leaveApi].
@ProviderFor(leaveApi)
final leaveApiProvider = AutoDisposeProvider<LeaveApi>.internal(
  leaveApi,
  name: r'leaveApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$leaveApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LeaveApiRef = AutoDisposeProviderRef<LeaveApi>;
String _$leaveBalancesHash() => r'85d0c42f661cd21f6cf7eea07f9c2a89c76c4c3e';

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

/// Leave balances for a given year. Server filters by JWT (employee sees own).
///
/// Copied from [leaveBalances].
@ProviderFor(leaveBalances)
const leaveBalancesProvider = LeaveBalancesFamily();

/// Leave balances for a given year. Server filters by JWT (employee sees own).
///
/// Copied from [leaveBalances].
class LeaveBalancesFamily extends Family<AsyncValue<List<LeaveBalanceDto>>> {
  /// Leave balances for a given year. Server filters by JWT (employee sees own).
  ///
  /// Copied from [leaveBalances].
  const LeaveBalancesFamily();

  /// Leave balances for a given year. Server filters by JWT (employee sees own).
  ///
  /// Copied from [leaveBalances].
  LeaveBalancesProvider call(int year) {
    return LeaveBalancesProvider(year);
  }

  @override
  LeaveBalancesProvider getProviderOverride(
    covariant LeaveBalancesProvider provider,
  ) {
    return call(provider.year);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'leaveBalancesProvider';
}

/// Leave balances for a given year. Server filters by JWT (employee sees own).
///
/// Copied from [leaveBalances].
class LeaveBalancesProvider
    extends AutoDisposeFutureProvider<List<LeaveBalanceDto>> {
  /// Leave balances for a given year. Server filters by JWT (employee sees own).
  ///
  /// Copied from [leaveBalances].
  LeaveBalancesProvider(int year)
    : this._internal(
        (ref) => leaveBalances(ref as LeaveBalancesRef, year),
        from: leaveBalancesProvider,
        name: r'leaveBalancesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leaveBalancesHash,
        dependencies: LeaveBalancesFamily._dependencies,
        allTransitiveDependencies:
            LeaveBalancesFamily._allTransitiveDependencies,
        year: year,
      );

  LeaveBalancesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.year,
  }) : super.internal();

  final int year;

  @override
  Override overrideWith(
    FutureOr<List<LeaveBalanceDto>> Function(LeaveBalancesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeaveBalancesProvider._internal(
        (ref) => create(ref as LeaveBalancesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        year: year,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LeaveBalanceDto>> createElement() {
    return _LeaveBalancesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeaveBalancesProvider && other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LeaveBalancesRef on AutoDisposeFutureProviderRef<List<LeaveBalanceDto>> {
  /// The parameter `year` of this provider.
  int get year;
}

class _LeaveBalancesProviderElement
    extends AutoDisposeFutureProviderElement<List<LeaveBalanceDto>>
    with LeaveBalancesRef {
  _LeaveBalancesProviderElement(super.provider);

  @override
  int get year => (origin as LeaveBalancesProvider).year;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
