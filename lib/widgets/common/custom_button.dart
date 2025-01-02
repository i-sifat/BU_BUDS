import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBackgroundColor: Colors.grey[300],
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          text,
          style: AppTypography.buttonLarge.copyWith(
            color: isEnabled ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
