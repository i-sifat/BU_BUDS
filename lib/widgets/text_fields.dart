import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/typography.dart';

class ReusableTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Color? borderColor;

  const ReusableTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: AppTypography.bodyLarge,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTypography.label,
        hintText: hintText,
        hintStyle:
            AppTypography.withColor(AppTypography.bodyMedium, AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.primary),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: AppColors.secondaryLight.withOpacity(0.1),
      ),
    );
  }
}
