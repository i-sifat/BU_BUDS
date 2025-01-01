import 'package:bubuds/utils/colors.dart';
import 'package:bubuds/utils/typography.dart';
import 'package:flutter/material.dart';

class AttendanceListItem extends StatelessWidget {
  final String date;
  final String status;

  const AttendanceListItem({
    super.key,
    required this.date,
    required this.status,
  });

  Color get _statusColor {
    switch (status.toLowerCase()) {
      case 'present':
        return AppColors.success;
      case 'absent':
        return AppColors.error;
      default:
        return AppColors.warning;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: AppTypography.bodyMedium,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: _statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: AppTypography.bodySmall.copyWith(
                color: _statusColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
