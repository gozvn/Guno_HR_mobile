// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportsApiHash() => r'a45c5d003aa07cf2e89c27507ec6543d32dd0365';

/// See also [reportsApi].
@ProviderFor(reportsApi)
final reportsApiProvider = AutoDisposeProvider<ReportsApi>.internal(
  reportsApi,
  name: r'reportsApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reportsApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReportsApiRef = AutoDisposeProviderRef<ReportsApi>;
String _$monthlyAttendanceReportHash() =>
    r'9ce0625844165af2a1a8e53e3e5a693d7f3e4241';

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

/// See also [monthlyAttendanceReport].
@ProviderFor(monthlyAttendanceReport)
const monthlyAttendanceReportProvider = MonthlyAttendanceReportFamily();

/// See also [monthlyAttendanceReport].
class MonthlyAttendanceReportFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [monthlyAttendanceReport].
  const MonthlyAttendanceReportFamily();

  /// See also [monthlyAttendanceReport].
  MonthlyAttendanceReportProvider call({String? month, int? departmentId}) {
    return MonthlyAttendanceReportProvider(
      month: month,
      departmentId: departmentId,
    );
  }

  @override
  MonthlyAttendanceReportProvider getProviderOverride(
    covariant MonthlyAttendanceReportProvider provider,
  ) {
    return call(month: provider.month, departmentId: provider.departmentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'monthlyAttendanceReportProvider';
}

/// See also [monthlyAttendanceReport].
class MonthlyAttendanceReportProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [monthlyAttendanceReport].
  MonthlyAttendanceReportProvider({String? month, int? departmentId})
    : this._internal(
        (ref) => monthlyAttendanceReport(
          ref as MonthlyAttendanceReportRef,
          month: month,
          departmentId: departmentId,
        ),
        from: monthlyAttendanceReportProvider,
        name: r'monthlyAttendanceReportProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$monthlyAttendanceReportHash,
        dependencies: MonthlyAttendanceReportFamily._dependencies,
        allTransitiveDependencies:
            MonthlyAttendanceReportFamily._allTransitiveDependencies,
        month: month,
        departmentId: departmentId,
      );

  MonthlyAttendanceReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
    required this.departmentId,
  }) : super.internal();

  final String? month;
  final int? departmentId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(MonthlyAttendanceReportRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MonthlyAttendanceReportProvider._internal(
        (ref) => create(ref as MonthlyAttendanceReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        month: month,
        departmentId: departmentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _MonthlyAttendanceReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthlyAttendanceReportProvider &&
        other.month == month &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, departmentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MonthlyAttendanceReportRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `month` of this provider.
  String? get month;

  /// The parameter `departmentId` of this provider.
  int? get departmentId;
}

class _MonthlyAttendanceReportProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with MonthlyAttendanceReportRef {
  _MonthlyAttendanceReportProviderElement(super.provider);

  @override
  String? get month => (origin as MonthlyAttendanceReportProvider).month;
  @override
  int? get departmentId =>
      (origin as MonthlyAttendanceReportProvider).departmentId;
}

String _$leaveBalanceReportHash() =>
    r'93a75743b6d7e6f566a89895edf61fe253ddaabe';

/// See also [leaveBalanceReport].
@ProviderFor(leaveBalanceReport)
const leaveBalanceReportProvider = LeaveBalanceReportFamily();

/// See also [leaveBalanceReport].
class LeaveBalanceReportFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [leaveBalanceReport].
  const LeaveBalanceReportFamily();

  /// See also [leaveBalanceReport].
  LeaveBalanceReportProvider call({int? year, int? departmentId}) {
    return LeaveBalanceReportProvider(year: year, departmentId: departmentId);
  }

  @override
  LeaveBalanceReportProvider getProviderOverride(
    covariant LeaveBalanceReportProvider provider,
  ) {
    return call(year: provider.year, departmentId: provider.departmentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'leaveBalanceReportProvider';
}

/// See also [leaveBalanceReport].
class LeaveBalanceReportProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [leaveBalanceReport].
  LeaveBalanceReportProvider({int? year, int? departmentId})
    : this._internal(
        (ref) => leaveBalanceReport(
          ref as LeaveBalanceReportRef,
          year: year,
          departmentId: departmentId,
        ),
        from: leaveBalanceReportProvider,
        name: r'leaveBalanceReportProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leaveBalanceReportHash,
        dependencies: LeaveBalanceReportFamily._dependencies,
        allTransitiveDependencies:
            LeaveBalanceReportFamily._allTransitiveDependencies,
        year: year,
        departmentId: departmentId,
      );

  LeaveBalanceReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.year,
    required this.departmentId,
  }) : super.internal();

  final int? year;
  final int? departmentId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(LeaveBalanceReportRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeaveBalanceReportProvider._internal(
        (ref) => create(ref as LeaveBalanceReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        year: year,
        departmentId: departmentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _LeaveBalanceReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeaveBalanceReportProvider &&
        other.year == year &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);
    hash = _SystemHash.combine(hash, departmentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LeaveBalanceReportRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `year` of this provider.
  int? get year;

  /// The parameter `departmentId` of this provider.
  int? get departmentId;
}

class _LeaveBalanceReportProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with LeaveBalanceReportRef {
  _LeaveBalanceReportProviderElement(super.provider);

  @override
  int? get year => (origin as LeaveBalanceReportProvider).year;
  @override
  int? get departmentId => (origin as LeaveBalanceReportProvider).departmentId;
}

String _$requestsReportHash() => r'a747e8bc4f361a1242c1e42bcfe93fd40ea1d0be';

/// See also [requestsReport].
@ProviderFor(requestsReport)
const requestsReportProvider = RequestsReportFamily();

/// See also [requestsReport].
class RequestsReportFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [requestsReport].
  const RequestsReportFamily();

  /// See also [requestsReport].
  RequestsReportProvider call({
    String? fromDate,
    String? toDate,
    String? type,
    String? status,
    int limit = 200,
  }) {
    return RequestsReportProvider(
      fromDate: fromDate,
      toDate: toDate,
      type: type,
      status: status,
      limit: limit,
    );
  }

  @override
  RequestsReportProvider getProviderOverride(
    covariant RequestsReportProvider provider,
  ) {
    return call(
      fromDate: provider.fromDate,
      toDate: provider.toDate,
      type: provider.type,
      status: provider.status,
      limit: provider.limit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'requestsReportProvider';
}

/// See also [requestsReport].
class RequestsReportProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [requestsReport].
  RequestsReportProvider({
    String? fromDate,
    String? toDate,
    String? type,
    String? status,
    int limit = 200,
  }) : this._internal(
         (ref) => requestsReport(
           ref as RequestsReportRef,
           fromDate: fromDate,
           toDate: toDate,
           type: type,
           status: status,
           limit: limit,
         ),
         from: requestsReportProvider,
         name: r'requestsReportProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$requestsReportHash,
         dependencies: RequestsReportFamily._dependencies,
         allTransitiveDependencies:
             RequestsReportFamily._allTransitiveDependencies,
         fromDate: fromDate,
         toDate: toDate,
         type: type,
         status: status,
         limit: limit,
       );

  RequestsReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fromDate,
    required this.toDate,
    required this.type,
    required this.status,
    required this.limit,
  }) : super.internal();

  final String? fromDate;
  final String? toDate;
  final String? type;
  final String? status;
  final int limit;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(RequestsReportRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RequestsReportProvider._internal(
        (ref) => create(ref as RequestsReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fromDate: fromDate,
        toDate: toDate,
        type: type,
        status: status,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _RequestsReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RequestsReportProvider &&
        other.fromDate == fromDate &&
        other.toDate == toDate &&
        other.type == type &&
        other.status == status &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fromDate.hashCode);
    hash = _SystemHash.combine(hash, toDate.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RequestsReportRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `fromDate` of this provider.
  String? get fromDate;

  /// The parameter `toDate` of this provider.
  String? get toDate;

  /// The parameter `type` of this provider.
  String? get type;

  /// The parameter `status` of this provider.
  String? get status;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _RequestsReportProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with RequestsReportRef {
  _RequestsReportProviderElement(super.provider);

  @override
  String? get fromDate => (origin as RequestsReportProvider).fromDate;
  @override
  String? get toDate => (origin as RequestsReportProvider).toDate;
  @override
  String? get type => (origin as RequestsReportProvider).type;
  @override
  String? get status => (origin as RequestsReportProvider).status;
  @override
  int get limit => (origin as RequestsReportProvider).limit;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
