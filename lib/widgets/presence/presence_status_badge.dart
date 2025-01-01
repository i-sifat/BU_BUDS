import 'package:bubuds/utils/colors.dart';
import 'package:bubuds/utils/typography.dart';
import 'package:flutter/material.dart';

class PresenceStatusBadge extends StatelessWidget {
  final int percentage;

  const PresenceStatusBadge({
    super.key,
    required this.percentage,
  });

  Color get _statusColor {
    if (percentage >= 90) return AppColors.success;
    if (percentage >= 70) return AppColors.warning;
    return AppColors.error;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: _statusColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$percentage%',
        style: AppTypography.bodySmall.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
