// Reads compile-time env vars injected via --dart-define.
// See README for dev/staging/prod invocations.

const apiBase = String.fromEnvironment(
  'API_BASE',
  defaultValue: 'https://api.guop.app',
);
