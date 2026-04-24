// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_db_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$requestsApiHash() => r'540c1c2ef703219fe877b615dff93f415d0bda8d';

/// See also [requestsApi].
@ProviderFor(requestsApi)
final requestsApiProvider = AutoDisposeProvider<RequestsApi>.internal(
  requestsApi,
  name: r'requestsApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requestsApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RequestsApiRef = AutoDisposeProviderRef<RequestsApi>;
String _$requestTypesHash() => r'e7c6b01ba50f503e1213d0e2b25ef9446ef07643';

/// See also [requestTypes].
@ProviderFor(requestTypes)
final requestTypesProvider =
    AutoDisposeFutureProvider<List<RequestTypeDto>>.internal(
      requestTypes,
      name: r'requestTypesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$requestTypesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RequestTypesRef = AutoDisposeFutureProviderRef<List<RequestTypeDto>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
