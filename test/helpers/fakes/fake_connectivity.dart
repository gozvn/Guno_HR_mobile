import 'package:connectivity_plus/connectivity_plus.dart';

/// Controllable connectivity stream for unit tests.
/// Default state: online (wifi). Call [setOffline]/[setOnline] to switch.
class FakeConnectivity {
  List<ConnectivityResult> _current = [ConnectivityResult.wifi];

  Stream<List<ConnectivityResult>> get onConnectivityChanged async* {
    yield _current;
  }

  void setOnline() => _current = [ConnectivityResult.wifi];
  void setOffline() => _current = [ConnectivityResult.none];

  /// Single-shot stream that yields the current state.
  Stream<List<ConnectivityResult>> get stream => onConnectivityChanged;
}

/// Helper — returns a stream that immediately yields online state.
Stream<List<ConnectivityResult>> onlineStream() =>
    Stream.value([ConnectivityResult.wifi]);

/// Helper — returns a stream that immediately yields offline state.
Stream<List<ConnectivityResult>> offlineStream() =>
    Stream.value([ConnectivityResult.none]);
