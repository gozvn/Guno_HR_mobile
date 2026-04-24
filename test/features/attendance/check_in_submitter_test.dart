import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:gu_hr_mobile/features/attendance/data/attendance_api.dart';
import 'package:gu_hr_mobile/features/attendance/data/dto/checkin_request_dto.dart';
import 'package:gu_hr_mobile/features/attendance/data/dto/checkin_response_dto.dart';
import 'package:gu_hr_mobile/features/attendance/data/local/attendance_database.dart';
import 'package:gu_hr_mobile/features/attendance/data/local/pending_checkins_dao.dart';
import 'package:gu_hr_mobile/features/attendance/domain/check_in_result.dart';
import 'package:gu_hr_mobile/features/attendance/services/check_in_submitter.dart';

// ---------------------------------------------------------------------------
// Mocks

class MockAttendanceApi extends Mock implements AttendanceApi {}
class MockPendingCheckinsDao extends Mock implements PendingCheckinsDao {}

// Fake companions for mocktail fallback registration.
class FakeCheckinRequestDto extends Fake implements CheckinRequestDto {}
class FakePendingCheckinsCompanion extends Fake
    implements PendingCheckinsCompanion {}

// ---------------------------------------------------------------------------
// Helpers

Stream<List<ConnectivityResult>> onlineStream() =>
    Stream.value([ConnectivityResult.wifi]);

Stream<List<ConnectivityResult>> offlineStream() =>
    Stream.value([ConnectivityResult.none]);

DioException _dio4xx(String errorMsg, {int status = 400}) => DioException(
      requestOptions: RequestOptions(path: '/mobile-checkin'),
      response: Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: status,
        data: {'error': errorMsg},
      ),
      type: DioExceptionType.badResponse,
    );

DioException _dio5xx() => DioException(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 500,
        data: {'error': 'Internal Server Error'},
      ),
      type: DioExceptionType.badResponse,
    );

DioException _dioNetwork() => DioException(
      requestOptions: RequestOptions(path: ''),
      type: DioExceptionType.connectionError,
    );

// ---------------------------------------------------------------------------

void main() {
  late MockAttendanceApi api;
  late MockPendingCheckinsDao dao;

  setUpAll(() {
    registerFallbackValue(FakeCheckinRequestDto());
    registerFallbackValue(FakePendingCheckinsCompanion());
  });

  setUp(() {
    api = MockAttendanceApi();
    dao = MockPendingCheckinsDao();
    when(() => dao.insert(any())).thenAnswer((_) async {});
  });

  CheckInSubmitter make(Stream<List<ConnectivityResult>> connectivity) =>
      CheckInSubmitter(
        api: api,
        dao: dao,
      );

  // ---------------------------------------------------------------------------
  group('online — success', () {
    test('returns CheckInSuccess on 200', () async {
      const resp = CheckinResponseDto(ok: true, attendanceId: 42);
      when(() => api.mobileCheckin(any())).thenAnswer((_) async => resp);

      final result = await make(onlineStream()).submit(type: 'checkin');

      expect(result, isA<CheckInSuccess>());
      expect((result as CheckInSuccess).response.attendanceId, 42);
      verifyNever(() => dao.insert(any()));
    });
  });

  // ---------------------------------------------------------------------------
  group('online — idempotent 400', () {
    test('returns CheckInSuccess when server says already checked in', () async {
      when(() => api.mobileCheckin(any()))
          .thenThrow(_dio4xx('Đã check-in lúc 08:30 hôm nay'));

      final result = await make(onlineStream()).submit(type: 'checkin');

      expect(result, isA<CheckInSuccess>());
      // Must NOT be queued — server already accepted it previously.
      verifyNever(() => dao.insert(any()));
    });

    test('returns CheckInSuccess when server says already checked out', () async {
      when(() => api.mobileCheckin(any()))
          .thenThrow(_dio4xx('Đã check-out hôm nay'));

      final result = await make(onlineStream()).submit(type: 'checkin');

      expect(result, isA<CheckInSuccess>());
    });
  });

  // ---------------------------------------------------------------------------
  group('online — outside radius 400', () {
    test('returns CheckInOutsideRadius with server message', () async {
      const msg =
          'Chấm công ngoài văn phòng (cách 350m). Tạo đơn WFH...';
      when(() => api.mobileCheckin(any()))
          .thenThrow(_dio4xx(msg));

      final result = await make(onlineStream()).submit(type: 'checkin');

      expect(result, isA<CheckInOutsideRadius>());
      expect((result as CheckInOutsideRadius).serverMessage, contains('350m'));
      verifyNever(() => dao.insert(any()));
    });
  });

  // ---------------------------------------------------------------------------
  group('online — retryable errors queue to drift', () {
    test('queues on 5xx', () async {
      when(() => api.mobileCheckin(any())).thenThrow(_dio5xx());

      final result = await make(onlineStream()).submit(type: 'checkin');

      expect(result, isA<CheckInQueuedOffline>());
      verify(() => dao.insert(any())).called(1);
    });

    test('queues on connection error (no response)', () async {
      when(() => api.mobileCheckin(any())).thenThrow(_dioNetwork());

      final result = await make(onlineStream()).submit(type: 'checkin');

      expect(result, isA<CheckInQueuedOffline>());
      verify(() => dao.insert(any())).called(1);
    });
  });

  // ---------------------------------------------------------------------------
  group('offline path', () {
    test('queues immediately without calling API', () async {
      final result = await make(offlineStream()).submit(type: 'checkin');

      expect(result, isA<CheckInQueuedOffline>());
      verify(() => dao.insert(any())).called(1);
      verifyNever(() => api.mobileCheckin(any()));
    });
  });

  // ---------------------------------------------------------------------------
  group('checkout type routing', () {
    test('calls mobileCheckout endpoint for type=checkout', () async {
      const resp = CheckinResponseDto(ok: true);
      when(() => api.mobileCheckout(any())).thenAnswer((_) async => resp);

      final result = await make(onlineStream()).submit(type: 'checkout');

      expect(result, isA<CheckInSuccess>());
      verify(() => api.mobileCheckout(any())).called(1);
      verifyNever(() => api.mobileCheckin(any()));
    });
  });
}
