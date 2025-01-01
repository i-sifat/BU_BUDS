```dart
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';

class OnboardingNavigationButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OnboardingNavigationButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: AppTypography.buttonLarge,
        ),
      ),
    );
  }
}
```