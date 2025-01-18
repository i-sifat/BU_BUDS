import 'package:flutter/material.dart';
import '../../models/routine.dart';
import '../../utils/pdf_generator.dart';

class RoutinePreviewScreen extends StatelessWidget {
  final List<ScheduleItem> schedules;

  const RoutinePreviewScreen({
    super.key,
    required this.schedules,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Routine'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => PdfGenerator.generateRoutinePdf(schedules),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final schedule = schedules[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(schedule.courseCode),
              subtitle: Text(
                '${schedule.dayOfWeek} ${schedule.startTime} - ${schedule.endTime}',
              ),
              trailing: Text(schedule.room),
            ),
          );
        },
      ),
    );
  }
}
