import 'package:flutter/material.dart';

// Reusable spinner using theme primary color.
// Wraps CircularProgressIndicator with consistent sizing.

class GuLoadingIndicator extends StatelessWidget {
  const GuLoadingIndicator({super.key, this.size = 32});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
