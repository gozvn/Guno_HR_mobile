import 'package:flutter/material.dart';

import '../../shared/widgets/gu_loading_indicator.dart';

// Shown on cold start while AuthNotifier._rehydrate() resolves.
// Router's redirect function handles navigation once AuthState changes —
// this widget does not navigate itself.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'GU HR',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: cs.onPrimary,
                    letterSpacing: -1,
                  ),
            ),
            const SizedBox(height: 32),
            const GuLoadingIndicator(size: 24),
          ],
        ),
      ),
    );
  }
}
