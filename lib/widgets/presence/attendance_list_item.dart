import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';
import '../../models/attendance.dart';

class AttendanceListItem extends StatelessWidget {
  final AttendanceRecord record;
  final VoidCallback? onTap;

  const AttendanceListItem({
    super.key,
    required this.record,
    this.onTap,
  });

  Color get statusColor {
    switch (record.status) {
      case AttendanceStatus.present:
        return AppColors.success;
      case AttendanceStatus.absent:
        return AppColors.error;
      case AttendanceStatus.late:
        return AppColors.warning;
      case AttendanceStatus.excused:
        return Colors.grey;
    }
  }

  String get statusText {
    switch (record.status) {
      case AttendanceStatus.present:
        return 'Present';
      case AttendanceStatus.absent:
        return 'Absent';
      case AttendanceStatus.late:
        return 'Late';
      case AttendanceStatus.excused:
        return 'Excused';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        record.studentName,
        style: AppTypography.bodyLarge,
      ),
      subtitle: Text(
        'ID: ${record.studentId}',
        style: AppTypography.bodySmall,
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: statusColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          statusText,
          style: AppTypography.bodySmall.copyWith(
            color: statusColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
