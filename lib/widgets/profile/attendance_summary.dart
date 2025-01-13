import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';

class AttendanceSummary extends StatelessWidget {
  final double attendancePercentage;
  final List<Map<String, dynamic>> subjectAttendance;

  const AttendanceSummary({
    super.key,
    required this.attendancePercentage,
    required this.subjectAttendance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  children: [
                    CircularProgressIndicator(
                      value: attendancePercentage / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary),
                      strokeWidth: 10,
                    ),
                    Center(
                      child: Text(
                        '${attendancePercentage.round()}%',
                        style: AppTypography.h2.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Attendance',
                    style: AppTypography.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Academic Year 2024',
                    style: AppTypography.bodyMedium.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: subjectAttendance.length,
          itemBuilder: (context, index) {
            final subject = subjectAttendance[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                title: Text(subject['name']),
                subtitle:
                    Text('${subject['present']}/${subject['total']} classes'),
                trailing: Text(
                  '${((subject['present'] / subject['total']) * 100).round()}%',
                  style: TextStyle(
                    color: _getColorForPercentage(
                        subject['present'] / subject['total']),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Color _getColorForPercentage(double percentage) {
    if (percentage >= 0.9) return Colors.green;
    if (percentage >= 0.75) return Colors.orange;
    return Colors.red;
  }
}
