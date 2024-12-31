```dart
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';

class ScheduleItem extends StatelessWidget {
  final String subject;
  final Color color;
  final String time;

  const ScheduleItem({
    super.key,
    required this.subject,
    required this.color,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            subject,
            style: AppTypography.bodyMedium.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: AppTypography.caption.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
```