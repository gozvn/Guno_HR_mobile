import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gu_hr_mobile/core/api/error_mapper_interceptor.dart';
import 'package:gu_hr_mobile/core/errors/app_failure.dart';
import 'package:gu_hr_mobile/features/auth/data/auth_repository.dart';

// ---------------------------------------------------------------------------
// Helpers

DioException _dioTimeout() => DioException(
      requestOptions: RequestOptions(path: '/test'),
      type: DioExceptionType.connectionTimeout,
    );

DioException _dioReceiveTimeout() => DioException(
      requestOptions: RequestOptions(path: '/test'),
      type: DioExceptionType.receiveTimeout,
    );

DioException _dioConnectionError() => DioException(
      requestOptions: RequestOptions(path: '/test'),
      type: DioExceptionType.connectionError,
    );

DioException _dioStatus(int status, {String? errorMsg}) => DioException(
      requestOptions: RequestOptions(path: '/test'),
      response: Response(
        requestOptions: RequestOptions(path: '/test'),
        statusCode: status,
        data: errorMsg != null ? {'error': errorMsg} : null,
      ),
      type: DioExceptionType.badResponse,
    );

/// Minimal handler that captures next().
class _CapturingErrorHandler extends ErrorInterceptorHandler {
  _CapturingErrorHandler({required this.onNext});
  final void Function(DioException) onNext;

  @override
  void next(DioException err) => onNext(err);
}

/// Runs the interceptor's onError and extracts the [AppFailure] from the result.
AppFailure _map(DioException err) {
  final interceptor = ErrorMapperInterceptor();
  late DioException result;

  interceptor.onError(
    err,
    _CapturingErrorHandler(onNext: (e) => result = e),
  );

  final exc = result.error;
  if (exc is AppFailureException) return exc.failure;
  throw StateError('Expected AppFailureException but got $exc');
}

// ---------------------------------------------------------------------------
// Matchers using freezed .when() since private types aren't accessible.

bool _isNetwork(AppFailure f) =>
    f.when(network: (_) => true, unauthorized: () => false,
        forbidden: (_) => false, server: (_, __) => false,
        validation: (_) => false, unknown: (_) => false);

bool _isUnauthorized(AppFailure f) =>
    f.when(network: (_) => false, unauthorized: () => true,
        forbidden: (_) => false, server: (_, __) => false,
        validation: (_) => false, unknown: (_) => false);

bool _isForbidden(AppFailure f) =>
    f.when(network: (_) => false, unauthorized: () => false,
        forbidden: (_) => true, server: (_, __) => false,
        validation: (_) => false, unknown: (_) => false);

bool _isValidation(AppFailure f) =>
    f.when(network: (_) => false, unauthorized: () => false,
        forbidden: (_) => false, server: (_, __) => false,
        validation: (_) => true, unknown: (_) => false);

bool _isServer(AppFailure f) =>
    f.when(network: (_) => false, unauthorized: () => false,
        forbidden: (_) => false, server: (_, __) => true,
        validation: (_) => false, unknown: (_) => false);

int _serverCode(AppFailure f) =>
    f.when(network: (_) => -1, unauthorized: () => -1,
        forbidden: (_) => -1, server: (code, _) => code,
        validation: (_) => -1, unknown: (_) => -1);

String _validationMsg(AppFailure f) =>
    f.when(network: (_) => '', unauthorized: () => '',
        forbidden: (_) => '', server: (_, __) => '',
        validation: (msg) => msg, unknown: (_) => '');

// ---------------------------------------------------------------------------

void main() {
  group('ErrorMapperInterceptor', () {
    test('connectionTimeout → network failure', () {
      final f = _map(_dioTimeout());
      expect(_isNetwork(f), isTrue);
    });

    test('receiveTimeout → network failure', () {
      final f = _map(_dioReceiveTimeout());
      expect(_isNetwork(f), isTrue);
    });

    test('connectionError → network failure', () {
      final f = _map(_dioConnectionError());
      expect(_isNetwork(f), isTrue);
    });

    test('400 → validation failure with server message', () {
      final f = _map(_dioStatus(400, errorMsg: 'Dữ liệu không hợp lệ'));
      expect(_isValidation(f), isTrue);
      expect(_validationMsg(f), contains('Dữ liệu'));
    });

    test('400 without body → validation failure with default message', () {
      final f = _map(_dioStatus(400));
      expect(_isValidation(f), isTrue);
    });

    test('401 → unauthorized failure', () {
      final f = _map(_dioStatus(401));
      expect(_isUnauthorized(f), isTrue);
    });

    test('403 → forbidden failure', () {
      final f = _map(_dioStatus(403));
      expect(_isForbidden(f), isTrue);
    });

    test('422 → server failure (unmapped status code)', () {
      // 422 falls through to default → server failure.
      final f = _map(_dioStatus(422));
      expect(_isServer(f), isTrue);
      expect(_serverCode(f), equals(422));
    });

    test('500 → server failure with status code 500', () {
      final f = _map(_dioStatus(500, errorMsg: 'Internal Server Error'));
      expect(_isServer(f), isTrue);
      expect(_serverCode(f), equals(500));
    });

    test('503 → server failure with status code 503', () {
      final f = _map(_dioStatus(503));
      expect(_isServer(f), isTrue);
      expect(_serverCode(f), equals(503));
    });
  });
}
