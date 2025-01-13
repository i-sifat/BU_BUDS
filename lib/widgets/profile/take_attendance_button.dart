import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';

class TakeAttendanceButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TakeAttendanceButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: const Icon(Icons.how_to_reg, color: Colors.white),
      label: Text(
        'Take Attendance',
        style: AppTypography.buttonLarge.copyWith(color: Colors.white),
      ),
    );
  }
}
