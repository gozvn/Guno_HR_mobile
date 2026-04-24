import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:gu_hr_mobile/features/requests/data/requests_api.dart';

// ---------------------------------------------------------------------------
// Minimal Dio mock — we stub individual methods directly.

class MockDio extends Mock implements Dio {}

// ---------------------------------------------------------------------------
// Helpers

Response<Map<String, dynamic>> _resp(Map<String, dynamic> data) => Response(
      data: data,
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );

DioException _dioError(int status) => DioException(
      response: Response(
        statusCode: status,
        requestOptions: RequestOptions(path: ''),
      ),
      requestOptions: RequestOptions(path: ''),
      type: DioExceptionType.badResponse,
    );

void main() {
  late MockDio dio;
  late RequestsApi api;

  setUp(() {
    dio = MockDio();
    api = RequestsApi(dio);
    // Mocktail requires fallback for named params.
    registerFallbackValue(RequestOptions(path: ''));
  });

  // ---------------------------------------------------------------------------
  // approve

  group('RequestsApi.approve', () {
    test('success — finalApproved=false returns ApproveResult correctly', () async {
      when(() => dio.post<Map<String, dynamic>>(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((_) async => _resp({
            'ok': true,
            'nextApproverId': 5,
            'finalApproved': false,
          }));

      final result = await api.approve(42, comment: 'LGTM');

      expect(result.ok, isTrue);
      expect(result.nextApproverId, 5);
      expect(result.finalApproved, isFalse);
    });

    test('success — finalApproved=true with no nextApprover', () async {
      when(() => dio.post<Map<String, dynamic>>(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((_) async => _resp({
            'ok': true,
            'nextApproverId': null,
            'finalApproved': true,
          }));

      final result = await api.approve(42);

      expect(result.finalApproved, isTrue);
      expect(result.nextApproverId, isNull);
    });

    test('approve without comment does not include comment key in payload', () async {
      Map<String, dynamic>? capturedData;
      when(() => dio.post<Map<String, dynamic>>(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((inv) async {
        capturedData = inv.namedArguments[#data] as Map<String, dynamic>;
        return _resp({'ok': true, 'finalApproved': true});
      });

      await api.approve(1);

      expect(capturedData, isNotNull);
      expect(capturedData!.containsKey('comment'), isFalse);
    });

    test('403 response throws DioException', () async {
      when(() => dio.post<Map<String, dynamic>>(
            any(),
            data: any(named: 'data'),
          )).thenThrow(_dioError(403));

      expect(() => api.approve(99), throwsA(isA<DioException>()));
    });
  });

  // ---------------------------------------------------------------------------
  // reject

  group('RequestsApi.reject', () {
    test('success — no exception thrown', () async {
      when(() => dio.post<void>(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      await expectLater(
        api.reject(42, comment: 'Không hợp lệ'),
        completes,
      );
    });

    test('400 response — comment required — throws DioException', () async {
      when(() => dio.post<void>(
            any(),
            data: any(named: 'data'),
          )).thenThrow(_dioError(400));

      expect(
        () => api.reject(42, comment: ''),
        throwsA(isA<DioException>()),
      );
    });

    test('reject payload always includes comment key', () async {
      Map<String, dynamic>? capturedData;
      when(() => dio.post<void>(
            any(),
            data: any(named: 'data'),
          )).thenAnswer((inv) async {
        capturedData = inv.namedArguments[#data] as Map<String, dynamic>;
        return Response(
            statusCode: 200, requestOptions: RequestOptions(path: ''));
      });

      await api.reject(1, comment: 'test reason');

      expect(capturedData!['comment'], 'test reason');
    });
  });

  // ---------------------------------------------------------------------------
  // pendingCount

  group('RequestsApi.pendingCount', () {
    test('returns integer from count field', () async {
      when(() => dio.get<Map<String, dynamic>>(any(),
              queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => _resp({'count': 7}));

      final count = await api.pendingCount();
      expect(count, 7);
    });

    test('returns zero when count is 0', () async {
      when(() => dio.get<Map<String, dynamic>>(any(),
              queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => _resp({'count': 0}));

      final count = await api.pendingCount();
      expect(count, 0);
    });
  });
}
