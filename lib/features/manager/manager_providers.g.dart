// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$managerDashboardApiHash() =>
    r'3f5a5ceb66258c3c9f70acc286295f4fc06475e6';

/// See also [managerDashboardApi].
@ProviderFor(managerDashboardApi)
final managerDashboardApiProvider =
    AutoDisposeProvider<ManagerDashboardApi>.internal(
      managerDashboardApi,
      name: r'managerDashboardApiProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$managerDashboardApiHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ManagerDashboardApiRef = AutoDisposeProviderRef<ManagerDashboardApi>;
String _$liveTeamApiHash() => r'31ace96aafe4ed3d64c89acbd66c6e09c1895480';

/// See also [liveTeamApi].
@ProviderFor(liveTeamApi)
final liveTeamApiProvider = AutoDisposeProvider<LiveTeamApi>.internal(
  liveTeamApi,
  name: r'liveTeamApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveTeamApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LiveTeamApiRef = AutoDisposeProviderRef<LiveTeamApi>;
String _$liveShiftsApiHash() => r'a6ec6e82838bfdb9496bc11d67c95e299fba1128';

/// See also [liveShiftsApi].
@ProviderFor(liveShiftsApi)
final liveShiftsApiProvider = AutoDisposeProvider<LiveShiftsApi>.internal(
  liveShiftsApi,
  name: r'liveShiftsApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveShiftsApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LiveShiftsApiRef = AutoDisposeProviderRef<LiveShiftsApi>;
String _$isManagerHash() => r'50959768e94aedb37e301700970f76528f810bfc';

/// See also [isManager].
@ProviderFor(isManager)
final isManagerProvider = AutoDisposeProvider<bool>.internal(
  isManager,
  name: r'isManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsManagerRef = AutoDisposeProviderRef<bool>;
String _$managerDashboardHash() => r'359fca301553183e4b22d18fc62c29bb38a2bf87';

/// See also [managerDashboard].
@ProviderFor(managerDashboard)
final managerDashboardProvider =
    AutoDisposeFutureProvider<ManagerDashboardDto>.internal(
      managerDashboard,
      name: r'managerDashboardProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$managerDashboardHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ManagerDashboardRef = AutoDisposeFutureProviderRef<ManagerDashboardDto>;
String _$dashboardTimerHash() => r'03dce85bf0b78952b320c8b33de5b3abfca06211';

/// See also [dashboardTimer].
@ProviderFor(dashboardTimer)
final dashboardTimerProvider = AutoDisposeStreamProvider<int>.internal(
  dashboardTimer,
  name: r'dashboardTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DashboardTimerRef = AutoDisposeStreamProviderRef<int>;
String _$pendingApprovalsHash() => r'2ae7e4e2a1a2e861eaa868ceffe9564eab5946a1';

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

/// See also [pendingApprovals].
@ProviderFor(pendingApprovals)
const pendingApprovalsProvider = PendingApprovalsFamily();

/// See also [pendingApprovals].
class PendingApprovalsFamily extends Family<AsyncValue<List<RequestDto>>> {
  /// See also [pendingApprovals].
  const PendingApprovalsFamily();

  /// See also [pendingApprovals].
  PendingApprovalsProvider call(String? typeFilter) {
    return PendingApprovalsProvider(typeFilter);
  }

  @override
  PendingApprovalsProvider getProviderOverride(
    covariant PendingApprovalsProvider provider,
  ) {
    return call(provider.typeFilter);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pendingApprovalsProvider';
}

/// See also [pendingApprovals].
class PendingApprovalsProvider
    extends AutoDisposeFutureProvider<List<RequestDto>> {
  /// See also [pendingApprovals].
  PendingApprovalsProvider(String? typeFilter)
    : this._internal(
        (ref) => pendingApprovals(ref as PendingApprovalsRef, typeFilter),
        from: pendingApprovalsProvider,
        name: r'pendingApprovalsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pendingApprovalsHash,
        dependencies: PendingApprovalsFamily._dependencies,
        allTransitiveDependencies:
            PendingApprovalsFamily._allTransitiveDependencies,
        typeFilter: typeFilter,
      );

  PendingApprovalsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.typeFilter,
  }) : super.internal();

  final String? typeFilter;

  @override
  Override overrideWith(
    FutureOr<List<RequestDto>> Function(PendingApprovalsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PendingApprovalsProvider._internal(
        (ref) => create(ref as PendingApprovalsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        typeFilter: typeFilter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RequestDto>> createElement() {
    return _PendingApprovalsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PendingApprovalsProvider && other.typeFilter == typeFilter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, typeFilter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PendingApprovalsRef on AutoDisposeFutureProviderRef<List<RequestDto>> {
  /// The parameter `typeFilter` of this provider.
  String? get typeFilter;
}

class _PendingApprovalsProviderElement
    extends AutoDisposeFutureProviderElement<List<RequestDto>>
    with PendingApprovalsRef {
  _PendingApprovalsProviderElement(super.provider);

  @override
  String? get typeFilter => (origin as PendingApprovalsProvider).typeFilter;
}

String _$pendingCountHash() => r'30fc53bb20e09af7afba04e20d76eb2f6860bbea';

/// See also [pendingCount].
@ProviderFor(pendingCount)
final pendingCountProvider = AutoDisposeStreamProvider<int>.internal(
  pendingCount,
  name: r'pendingCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingCountRef = AutoDisposeStreamProviderRef<int>;
String _$liveTeamMembersHash() => r'ba88dcef2d0ae82a12a0d6312d1e2af3c563af01';

/// See also [liveTeamMembers].
@ProviderFor(liveTeamMembers)
final liveTeamMembersProvider =
    AutoDisposeFutureProvider<List<LiveTeamMemberDto>>.internal(
      liveTeamMembers,
      name: r'liveTeamMembersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$liveTeamMembersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LiveTeamMembersRef =
    AutoDisposeFutureProviderRef<List<LiveTeamMemberDto>>;
String _$liveChannelsHash() => r'b613f9449f8267c9961f93174eb17ddbbb1c4c44';

/// See also [liveChannels].
@ProviderFor(liveChannels)
final liveChannelsProvider =
    AutoDisposeFutureProvider<List<LiveChannelDto>>.internal(
      liveChannels,
      name: r'liveChannelsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$liveChannelsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LiveChannelsRef = AutoDisposeFutureProviderRef<List<LiveChannelDto>>;
String _$liveShiftsHash() => r'000747298be62b4cbaad45e9703f3ca9e79a1cb1';

/// See also [liveShifts].
@ProviderFor(liveShifts)
const liveShiftsProvider = LiveShiftsFamily();

/// See also [liveShifts].
class LiveShiftsFamily extends Family<AsyncValue<List<LiveShiftDto>>> {
  /// See also [liveShifts].
  const LiveShiftsFamily();

  /// See also [liveShifts].
  LiveShiftsProvider call({String? date, String? channel}) {
    return LiveShiftsProvider(date: date, channel: channel);
  }

  @override
  LiveShiftsProvider getProviderOverride(
    covariant LiveShiftsProvider provider,
  ) {
    return call(date: provider.date, channel: provider.channel);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'liveShiftsProvider';
}

/// See also [liveShifts].
class LiveShiftsProvider extends AutoDisposeFutureProvider<List<LiveShiftDto>> {
  /// See also [liveShifts].
  LiveShiftsProvider({String? date, String? channel})
    : this._internal(
        (ref) => liveShifts(ref as LiveShiftsRef, date: date, channel: channel),
        from: liveShiftsProvider,
        name: r'liveShiftsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$liveShiftsHash,
        dependencies: LiveShiftsFamily._dependencies,
        allTransitiveDependencies: LiveShiftsFamily._allTransitiveDependencies,
        date: date,
        channel: channel,
      );

  LiveShiftsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
    required this.channel,
  }) : super.internal();

  final String? date;
  final String? channel;

  @override
  Override overrideWith(
    FutureOr<List<LiveShiftDto>> Function(LiveShiftsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LiveShiftsProvider._internal(
        (ref) => create(ref as LiveShiftsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
        channel: channel,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LiveShiftDto>> createElement() {
    return _LiveShiftsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LiveShiftsProvider &&
        other.date == date &&
        other.channel == channel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, channel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LiveShiftsRef on AutoDisposeFutureProviderRef<List<LiveShiftDto>> {
  /// The parameter `date` of this provider.
  String? get date;

  /// The parameter `channel` of this provider.
  String? get channel;
}

class _LiveShiftsProviderElement
    extends AutoDisposeFutureProviderElement<List<LiveShiftDto>>
    with LiveShiftsRef {
  _LiveShiftsProviderElement(super.provider);

  @override
  String? get date => (origin as LiveShiftsProvider).date;
  @override
  String? get channel => (origin as LiveShiftsProvider).channel;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
