import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppTransitions {
  static Widget fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    )
        .animate()
        .fade(duration: const Duration(milliseconds: 300))
        .scaleXY(begin: 0.9, end: 1.0); // Correct scaling
  }

  static Widget slideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ).animate().fade(duration: const Duration(milliseconds: 300));
  }
}
