import 'package:bubuds/utils/colors.dart';
import 'package:bubuds/utils/typography.dart';
import 'package:flutter/material.dart';

class CourseProgress extends StatelessWidget {
  final String title;
  final int completed;
  final int total;
  final Color progressColor;

  const CourseProgress({
    super.key,
    required this.title,
    required this.completed,
    required this.total,
    this.progressColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total > 0 ? completed / total : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: progressColor.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '$completed/$total',
              style: AppTypography.caption.copyWith(
                color: progressColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
