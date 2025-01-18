import 'package:flutter/material.dart';
import '../../models/routine.dart';

class ScheduleList extends StatelessWidget {
  final List<ScheduleItem> schedules;

  const ScheduleList({
    super.key,
    required this.schedules,
  });

  @override
  Widget build(BuildContext context) {
    if (schedules.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: schedules.length,
      itemBuilder: (context, index) {
        final schedule = schedules[index];
        return ScheduleCard(schedule: schedule);
      },
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final ScheduleItem schedule;

  const ScheduleCard({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: _getCategoryColor(),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule.courseCode,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${schedule.startTime} - ${schedule.endTime}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Text(
            schedule.category.toUpperCase(),
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor() {
    switch (schedule.category.toLowerCase()) {
      case 'work':
        return Colors.blue;
      case 'family':
        return Colors.orange;
      case 'health':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
