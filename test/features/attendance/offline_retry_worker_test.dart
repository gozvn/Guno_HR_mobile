import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';

// Mirror of OfflineRetryWorker._backoff for unit testing.
// Formula: Duration(seconds: min(3600, 5^n))
Duration _backoff(int n) =>
    Duration(seconds: math.min(3600, math.pow(5, n).toInt()));

void main() {
  group('OfflineRetryWorker backoff', () {
    test('n=1 → 5s', () => expect(_backoff(1).inSeconds, 5));
    test('n=2 → 25s', () => expect(_backoff(2).inSeconds, 25));
    test('n=3 → 125s', () => expect(_backoff(3).inSeconds, 125));
    test('n=4 → 625s', () => expect(_backoff(4).inSeconds, 625));

    // 5^5 = 3125 < 3600, so still under cap.
    test('n=5 → 3125s (still under 3600 cap)',
        () => expect(_backoff(5).inSeconds, 3125));

    // 5^6 = 15625 → capped.
    test('n=6 → capped at 3600s',
        () => expect(_backoff(6).inSeconds, 3600));

    // Large n stays capped.
    test('n=20 → capped at 3600s',
        () => expect(_backoff(20).inSeconds, 3600));
  });
}
