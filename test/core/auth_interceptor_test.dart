import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gu_hr_mobile/core/api/auth_interceptor.dart';
import 'package:gu_hr_mobile/features/auth/auth_providers.dart';

// ---------------------------------------------------------------------------
// AuthInterceptor requires a Riverpod Ref. We obtain a valid Ref by
// creating a Provider inside a ProviderContainer that captures the ref.

/// Builds an AuthInterceptor using a real Ref from a ProviderContainer
/// seeded with [token].
AuthInterceptor _makeInterceptor(ProviderContainer container) {
  // Read the interceptor from a provider that constructs it with the
  // container-scoped ref. We create a local provider for this purpose.
  late AuthInterceptor interceptor;
  final _ = container.read(
    Provider<AuthInterceptor>((ref) {
      interceptor = AuthInterceptor(ref);
      return interceptor;
    }),
  );
  return interceptor;
}

ProviderContainer _container({String? token}) {
  final c = ProviderContainer(
    overrides: [tokenProvider.overrideWith((ref) => token)],
  );
  addTearDown(c.dispose);
  return c;
}

// ---------------------------------------------------------------------------
// Minimal handler that captures the options passed to next().

class _CapturingHandler extends RequestInterceptorHandler {
  _CapturingHandler({required this.onNext});
  final void Function(RequestOptions) onNext;

  @override
  void next(RequestOptions requestOptions) => onNext(requestOptions);
}

RequestOptions _run(AuthInterceptor interceptor, String path) {
  final options = RequestOptions(path: path);
  late RequestOptions captured;
  interceptor.onRequest(options, _CapturingHandler(onNext: (o) => captured = o));
  return captured;
}

// ---------------------------------------------------------------------------

void main() {
  group('AuthInterceptor', () {
    test('public path /auth/login — does NOT attach Authorization header', () {
      final container = _container(token: 'valid.token');
      final interceptor = _makeInterceptor(container);
      final opts = _run(interceptor, '/api/hr/auth/login');
      expect(opts.headers.containsKey('Authorization'), isFalse);
    });

    test('public path /auth/from-telegram — does NOT attach Authorization header',
        () {
      final container = _container(token: 'valid.token');
      final interceptor = _makeInterceptor(container);
      final opts = _run(interceptor, '/api/hr/auth/from-telegram');
      expect(opts.headers.containsKey('Authorization'), isFalse);
    });

    test('protected path with token — attaches Bearer header', () {
      final container = _container(token: 'my.jwt.token');
      final interceptor = _makeInterceptor(container);
      final opts = _run(interceptor, '/api/hr/attendance/checkin');
      expect(opts.headers['Authorization'], equals('Bearer my.jwt.token'));
    });

    test('protected path with null token — no Authorization header added', () {
      final container = _container(token: null);
      final interceptor = _makeInterceptor(container);
      final opts = _run(interceptor, '/api/hr/attendance/checkin');
      expect(opts.headers.containsKey('Authorization'), isFalse);
    });

    test('protected path /api/hr/requests — attaches Bearer header', () {
      final container = _container(token: 'tok123');
      final interceptor = _makeInterceptor(container);
      final opts = _run(interceptor, '/api/hr/requests');
      expect(opts.headers['Authorization'], equals('Bearer tok123'));
    });
  });
}
