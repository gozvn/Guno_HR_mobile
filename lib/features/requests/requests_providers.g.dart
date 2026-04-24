// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myRequestsHash() => r'0159e6fea897b45c115c15f45703e3e0664b5238';

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

/// See also [myRequests].
@ProviderFor(myRequests)
const myRequestsProvider = MyRequestsFamily();

/// See also [myRequests].
class MyRequestsFamily extends Family<AsyncValue<PagedRequests>> {
  /// See also [myRequests].
  const MyRequestsFamily();

  /// See also [myRequests].
  MyRequestsProvider call(RequestFilters filters) {
    return MyRequestsProvider(filters);
  }

  @override
  MyRequestsProvider getProviderOverride(
    covariant MyRequestsProvider provider,
  ) {
    return call(provider.filters);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'myRequestsProvider';
}

/// See also [myRequests].
class MyRequestsProvider extends AutoDisposeFutureProvider<PagedRequests> {
  /// See also [myRequests].
  MyRequestsProvider(RequestFilters filters)
    : this._internal(
        (ref) => myRequests(ref as MyRequestsRef, filters),
        from: myRequestsProvider,
        name: r'myRequestsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$myRequestsHash,
        dependencies: MyRequestsFamily._dependencies,
        allTransitiveDependencies: MyRequestsFamily._allTransitiveDependencies,
        filters: filters,
      );

  MyRequestsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filters,
  }) : super.internal();

  final RequestFilters filters;

  @override
  Override overrideWith(
    FutureOr<PagedRequests> Function(MyRequestsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyRequestsProvider._internal(
        (ref) => create(ref as MyRequestsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filters: filters,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PagedRequests> createElement() {
    return _MyRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyRequestsProvider && other.filters == filters;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MyRequestsRef on AutoDisposeFutureProviderRef<PagedRequests> {
  /// The parameter `filters` of this provider.
  RequestFilters get filters;
}

class _MyRequestsProviderElement
    extends AutoDisposeFutureProviderElement<PagedRequests>
    with MyRequestsRef {
  _MyRequestsProviderElement(super.provider);

  @override
  RequestFilters get filters => (origin as MyRequestsProvider).filters;
}

String _$requestDetailHash() => r'0d8e88f5e73a0166ff11249778d29f7951123707';

/// See also [requestDetail].
@ProviderFor(requestDetail)
const requestDetailProvider = RequestDetailFamily();

/// See also [requestDetail].
class RequestDetailFamily extends Family<AsyncValue<RequestDetailDto>> {
  /// See also [requestDetail].
  const RequestDetailFamily();

  /// See also [requestDetail].
  RequestDetailProvider call(int id) {
    return RequestDetailProvider(id);
  }

  @override
  RequestDetailProvider getProviderOverride(
    covariant RequestDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'requestDetailProvider';
}

/// See also [requestDetail].
class RequestDetailProvider
    extends AutoDisposeFutureProvider<RequestDetailDto> {
  /// See also [requestDetail].
  RequestDetailProvider(int id)
    : this._internal(
        (ref) => requestDetail(ref as RequestDetailRef, id),
        from: requestDetailProvider,
        name: r'requestDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$requestDetailHash,
        dependencies: RequestDetailFamily._dependencies,
        allTransitiveDependencies:
            RequestDetailFamily._allTransitiveDependencies,
        id: id,
      );

  RequestDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<RequestDetailDto> Function(RequestDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RequestDetailProvider._internal(
        (ref) => create(ref as RequestDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RequestDetailDto> createElement() {
    return _RequestDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RequestDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RequestDetailRef on AutoDisposeFutureProviderRef<RequestDetailDto> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RequestDetailProviderElement
    extends AutoDisposeFutureProviderElement<RequestDetailDto>
    with RequestDetailRef {
  _RequestDetailProviderElement(super.provider);

  @override
  int get id => (origin as RequestDetailProvider).id;
}

String _$htRequestsHash() => r'517875ec062eef9d4144228503ffb6560d4665e2';

/// See also [htRequests].
@ProviderFor(htRequests)
const htRequestsProvider = HtRequestsFamily();

/// See also [htRequests].
class HtRequestsFamily extends Family<AsyncValue<List<HtRequestDto>>> {
  /// See also [htRequests].
  const HtRequestsFamily();

  /// See also [htRequests].
  HtRequestsProvider call(String? month) {
    return HtRequestsProvider(month);
  }

  @override
  HtRequestsProvider getProviderOverride(
    covariant HtRequestsProvider provider,
  ) {
    return call(provider.month);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'htRequestsProvider';
}

/// See also [htRequests].
class HtRequestsProvider extends AutoDisposeFutureProvider<List<HtRequestDto>> {
  /// See also [htRequests].
  HtRequestsProvider(String? month)
    : this._internal(
        (ref) => htRequests(ref as HtRequestsRef, month),
        from: htRequestsProvider,
        name: r'htRequestsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$htRequestsHash,
        dependencies: HtRequestsFamily._dependencies,
        allTransitiveDependencies: HtRequestsFamily._allTransitiveDependencies,
        month: month,
      );

  HtRequestsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
  }) : super.internal();

  final String? month;

  @override
  Override overrideWith(
    FutureOr<List<HtRequestDto>> Function(HtRequestsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HtRequestsProvider._internal(
        (ref) => create(ref as HtRequestsRef),
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
  AutoDisposeFutureProviderElement<List<HtRequestDto>> createElement() {
    return _HtRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HtRequestsProvider && other.month == month;
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
mixin HtRequestsRef on AutoDisposeFutureProviderRef<List<HtRequestDto>> {
  /// The parameter `month` of this provider.
  String? get month;
}

class _HtRequestsProviderElement
    extends AutoDisposeFutureProviderElement<List<HtRequestDto>>
    with HtRequestsRef {
  _HtRequestsProviderElement(super.provider);

  @override
  String? get month => (origin as HtRequestsProvider).month;
}

String _$createRequestNotifierHash() =>
    r'22bf2dd9425805a2321ba39b36f4aca6288a34db';

/// See also [CreateRequestNotifier].
@ProviderFor(CreateRequestNotifier)
final createRequestNotifierProvider =
    AutoDisposeNotifierProvider<
      CreateRequestNotifier,
      CreateRequestState
    >.internal(
      CreateRequestNotifier.new,
      name: r'createRequestNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$createRequestNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CreateRequestNotifier = AutoDisposeNotifier<CreateRequestState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
