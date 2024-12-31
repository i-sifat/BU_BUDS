import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/typography.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? bgColor;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final bool isCircular;

  const AppButton({
    super.key,
    required this.text,
    this.textColor,
    this.bgColor,
    required this.onPressed,
    this.height,
    this.width,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.primary,
        foregroundColor: textColor ?? AppColors.white,
        shape: isCircular
            ? const CircleBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
        minimumSize: Size(width ?? 150, height ?? 45),
      ),
      child: Text(
        text,
        style: AppTypography.buttonLarge.copyWith(
          color: textColor ?? AppColors.white,
        ),
      ),
    );
  }
}
