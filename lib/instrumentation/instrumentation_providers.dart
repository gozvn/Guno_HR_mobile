import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'analytics_service.dart';
import 'crashlytics_service.dart';

/// Singleton providers — services are stateless wrappers, safe to reuse.
final analyticsServiceProvider = Provider<AnalyticsService>(
  (_) => AnalyticsService(),
);

final crashlyticsServiceProvider = Provider<CrashlyticsService>(
  (_) => CrashlyticsService(),
);
