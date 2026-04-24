import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/app_failure.dart';
import '../../attendance_providers.dart';
import '../../domain/check_in_flow_state.dart';
import '../../domain/check_in_result.dart';
import '../../domain/location_check.dart';

part 'check_in_flow_controller.g.dart';

/// Wizard state controller for the 4-step check-in flow.
/// Holds partial state across steps; submits via CheckInSubmitter on step 3.
@riverpod
class CheckInFlowController extends _$CheckInFlowController {
  @override
  CheckInFlowState build() => const CheckInFlowState();

  void setType(String type) => state = state.copyWith(type: type);
  void nextStep() => state = state.copyWith(step: state.step + 1);
  void prevStep() =>
      state = state.copyWith(step: (state.step - 1).clamp(0, 3));
  void setPosition(Position position) =>
      state = state.copyWith(position: position);
  void setLocationCheck(LocationCheck check) =>
      state = state.copyWith(locationCheck: check);
  // ignore: avoid_dynamic_calls — photoFile is File but domain state uses dynamic to avoid dart:io in freezed
  void setPhotoFile(dynamic file) => state = state.copyWith(photoFile: file);
  void setNote(String note) => state = state.copyWith(note: note);
  void setError(String? msg) => state = state.copyWith(errorMessage: msg);
  void reset() => state = const CheckInFlowState();

  Future<CheckInResult> submit() async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      final s = state;
      return await ref.read(checkInSubmitterProvider).submit(
            type: s.type,
            gpsLat: s.position?.latitude,
            gpsLng: s.position?.longitude,
            locationCode: switch (s.locationCheck) {
              LocationInRadius(:final locationCode) => locationCode,
              LocationOutsideRadius(:final locationCode) => locationCode,
              _ => null,
            },
            photoFile: s.photoFile,
            userNote: s.note,
          );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      return CheckInResult.failed(AppFailure.unknown(e));
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }
}
