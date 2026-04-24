// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_flow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkInFlowControllerHash() =>
    r'023b35bfbc96204ddb674b7f3ccbd61abc383280';

/// Wizard state controller for the 4-step check-in flow.
/// Holds partial state across steps; submits via CheckInSubmitter on step 3.
///
/// Copied from [CheckInFlowController].
@ProviderFor(CheckInFlowController)
final checkInFlowControllerProvider =
    AutoDisposeNotifierProvider<
      CheckInFlowController,
      CheckInFlowState
    >.internal(
      CheckInFlowController.new,
      name: r'checkInFlowControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$checkInFlowControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CheckInFlowController = AutoDisposeNotifier<CheckInFlowState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
