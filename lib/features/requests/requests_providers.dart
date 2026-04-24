/// Paged list, detail, HT, and create-request notifier providers.
/// DB + types-cache providers live in requests_db_providers.dart.
library;

import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dashboard/dashboard_providers.dart';
import '../leave/leave_providers.dart';
import 'data/dto/create_request_payload.dart';
import 'data/dto/ht_request_dto.dart';
import 'data/dto/request_detail_dto.dart';
import 'data/dto/request_dto.dart';
import 'domain/request_filters.dart';
import 'requests_db_providers.dart';

// Re-export so feature files need only one import.
export 'requests_db_providers.dart'
    show
        requestsDatabaseProvider,
        requestsApiProvider,
        requestTypesProvider,
        RequestsApiRef,
        RequestTypesRef;

part 'requests_providers.freezed.dart';
part 'requests_providers.g.dart';

// ---------------------------------------------------------------------------
// My requests — paged list

typedef PagedRequests = ({List<RequestDto> items, int total});

@riverpod
Future<PagedRequests> myRequests(Ref ref, RequestFilters filters) =>
    ref.watch(requestsApiProvider).list(
          status: filters.status,
          type: filters.type,
          month: filters.month,
          limit: 20,
          offset: filters.offset,
        );

// ---------------------------------------------------------------------------
// Request detail

@riverpod
Future<RequestDetailDto> requestDetail(Ref ref, int id) =>
    ref.watch(requestsApiProvider).byId(id);

// ---------------------------------------------------------------------------
// HappyTime list

@riverpod
Future<List<HtRequestDto>> htRequests(Ref ref, String? month) =>
    ref.watch(requestsApiProvider).htList(month: month);

// ---------------------------------------------------------------------------
// Create request state + notifier

@freezed
class CreateRequestState with _$CreateRequestState {
  const factory CreateRequestState.idle() = _Idle;
  const factory CreateRequestState.step1() = _Step1;
  const factory CreateRequestState.step2({
    required String typeCode,
    String? startDate,
    String? endDate,
    String? reason,
    @Default([]) List<File> pendingFiles,
    @Default([]) List<String> uploadedUrls,
    @Default(false) bool uploading,
  }) = _Step2;
  const factory CreateRequestState.submitting({
    required String typeCode,
    required String startDate,
    required String endDate,
    String? reason,
    required List<String> uploadedUrls,
  }) = _Submitting;
  const factory CreateRequestState.success({required int requestId}) = _Success;
  const factory CreateRequestState.error({required String message}) = _Error;
}

@riverpod
class CreateRequestNotifier extends _$CreateRequestNotifier {
  @override
  CreateRequestState build() => const CreateRequestState.idle();

  void startFlow() => state = const CreateRequestState.step1();

  void selectType(String code) =>
      state = CreateRequestState.step2(typeCode: code);

  void updateDates(String start, String end) {
    if (state case _Step2 s) {
      state = s.copyWith(startDate: start, endDate: end);
    }
  }

  void updateReason(String reason) {
    if (state case _Step2 s) {
      state = s.copyWith(reason: reason.isEmpty ? null : reason);
    }
  }

  void addFile(File file) {
    if (state case _Step2 s) {
      state = s.copyWith(pendingFiles: [...s.pendingFiles, file]);
    }
  }

  void removeFile(int index) {
    if (state case _Step2 s) {
      final files = List<File>.from(s.pendingFiles)..removeAt(index);
      state = s.copyWith(pendingFiles: files);
    }
  }

  Future<void> uploadAndSubmit() async {
    if (state case _Step2 s) {
      if (s.startDate == null || s.endDate == null) return;
      final api = ref.read(requestsApiProvider);

      state = s.copyWith(uploading: true);
      List<String> urls = List.from(s.uploadedUrls);
      try {
        if (s.pendingFiles.isNotEmpty) {
          final results = await Future.wait(
            s.pendingFiles.map((f) => api.uploadAttachment(f)),
          );
          urls = [...urls, ...results.map((r) => r.url)];
        }
      } catch (e) {
        state =
            CreateRequestState.error(message: 'Upload ảnh thất bại: $e');
        return;
      }

      state = CreateRequestState.submitting(
        typeCode: s.typeCode,
        startDate: s.startDate!,
        endDate: s.endDate!,
        reason: s.reason,
        uploadedUrls: urls,
      );

      try {
        final result = await api.create(
          CreateRequestPayload(
            type: s.typeCode,
            startDate: s.startDate!,
            endDate: s.endDate!,
            reason: s.reason,
            attachmentUrls: urls,
          ),
        );
        ref.invalidate(myRequestsProvider);
        ref.invalidate(dashboardProvider);
        ref.invalidate(leaveBalancesProvider(DateTime.now().year));
        state = CreateRequestState.success(requestId: result.id);
      } catch (e) {
        state = CreateRequestState.error(message: e.toString());
      }
    }
  }

  void reset() => state = const CreateRequestState.idle();
}
