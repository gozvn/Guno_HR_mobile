// Reads compile-time env vars injected via --dart-define.
// See README for dev/staging/prod invocations.

import 'dart:io' show Platform;

const _envApiBase = String.fromEnvironment('API_BASE');

/// Default base URL khi không truyền `--dart-define=API_BASE=...`:
/// - iOS sim / macOS dev: `http://localhost:3000` (Mac localhost OK trực tiếp)
/// - Android emu (Genymotion / AVD): `http://10.0.3.2:3000` (host alias trỏ Mac localhost)
/// - Production: build với `--dart-define=API_BASE=https://api.guop.app`
String _defaultApiBase() {
  if (Platform.isAndroid) return 'http://10.0.3.2:3000';
  return 'http://localhost:3000';
}

final String apiBase = _envApiBase.isNotEmpty ? _envApiBase : _defaultApiBase();
