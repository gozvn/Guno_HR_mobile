// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$companyApiHash() => r'c7cf0e43a0ab49a287acbdfa1f2d53a6c5d8aea5';

/// See also [companyApi].
@ProviderFor(companyApi)
final companyApiProvider = AutoDisposeProvider<CompanyApi>.internal(
  companyApi,
  name: r'companyApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$companyApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompanyApiRef = AutoDisposeProviderRef<CompanyApi>;
String _$companyCalendarHash() => r'ff90c0ff5f2deec13e83f0e8eb051eef26684eb6';

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

/// See also [companyCalendar].
@ProviderFor(companyCalendar)
const companyCalendarProvider = CompanyCalendarFamily();

/// See also [companyCalendar].
class CompanyCalendarFamily extends Family<AsyncValue<List<CalendarEntryDto>>> {
  /// See also [companyCalendar].
  const CompanyCalendarFamily();

  /// See also [companyCalendar].
  CompanyCalendarProvider call(int year, int month) {
    return CompanyCalendarProvider(year, month);
  }

  @override
  CompanyCalendarProvider getProviderOverride(
    covariant CompanyCalendarProvider provider,
  ) {
    return call(provider.year, provider.month);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'companyCalendarProvider';
}

/// See also [companyCalendar].
class CompanyCalendarProvider
    extends AutoDisposeFutureProvider<List<CalendarEntryDto>> {
  /// See also [companyCalendar].
  CompanyCalendarProvider(int year, int month)
    : this._internal(
        (ref) => companyCalendar(ref as CompanyCalendarRef, year, month),
        from: companyCalendarProvider,
        name: r'companyCalendarProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$companyCalendarHash,
        dependencies: CompanyCalendarFamily._dependencies,
        allTransitiveDependencies:
            CompanyCalendarFamily._allTransitiveDependencies,
        year: year,
        month: month,
      );

  CompanyCalendarProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.year,
    required this.month,
  }) : super.internal();

  final int year;
  final int month;

  @override
  Override overrideWith(
    FutureOr<List<CalendarEntryDto>> Function(CompanyCalendarRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CompanyCalendarProvider._internal(
        (ref) => create(ref as CompanyCalendarRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        year: year,
        month: month,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CalendarEntryDto>> createElement() {
    return _CompanyCalendarProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyCalendarProvider &&
        other.year == year &&
        other.month == month;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CompanyCalendarRef
    on AutoDisposeFutureProviderRef<List<CalendarEntryDto>> {
  /// The parameter `year` of this provider.
  int get year;

  /// The parameter `month` of this provider.
  int get month;
}

class _CompanyCalendarProviderElement
    extends AutoDisposeFutureProviderElement<List<CalendarEntryDto>>
    with CompanyCalendarRef {
  _CompanyCalendarProviderElement(super.provider);

  @override
  int get year => (origin as CompanyCalendarProvider).year;
  @override
  int get month => (origin as CompanyCalendarProvider).month;
}

String _$companyDocsHash() => r'ae783a5ff5dcb5aca2a1db6d246e8b298fe39e9d';

/// See also [companyDocs].
@ProviderFor(companyDocs)
final companyDocsProvider =
    AutoDisposeFutureProvider<List<CompanyDocDto>>.internal(
      companyDocs,
      name: r'companyDocsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$companyDocsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompanyDocsRef = AutoDisposeFutureProviderRef<List<CompanyDocDto>>;
String _$companyDocTreeHash() => r'848a6ca21db6110b5eef726d5165794a8db46f20';

/// See also [companyDocTree].
@ProviderFor(companyDocTree)
final companyDocTreeProvider =
    AutoDisposeFutureProvider<List<DocNode>>.internal(
      companyDocTree,
      name: r'companyDocTreeProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$companyDocTreeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompanyDocTreeRef = AutoDisposeFutureProviderRef<List<DocNode>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
