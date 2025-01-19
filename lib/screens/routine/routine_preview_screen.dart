import 'package:flutter/material.dart';
import '../../models/routine.dart';
import '../../utils/pdf_generator.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class RoutinePreviewScreen extends StatelessWidget {
  final List<ScheduleItem> schedules;

  const RoutinePreviewScreen({
    super.key,
    required this.schedules,
  });

  // Group schedules by day and sort by time
  Map<String, List<ScheduleItem>> _getGroupedSchedules() {
    // First sort all schedules by time
    final sortedSchedules = List<ScheduleItem>.from(schedules)
      ..sort((a, b) {
        // Convert time strings to comparable format
        final aTime = _parseTime(a.startTime);
        final bTime = _parseTime(b.startTime);
        return aTime.compareTo(bTime);
      });

    // Then group by day
    final grouped = <String, List<ScheduleItem>>{};
    for (var schedule in sortedSchedules) {
      if (!grouped.containsKey(schedule.dayOfWeek)) {
        grouped[schedule.dayOfWeek] = [];
      }
      grouped[schedule.dayOfWeek]!.add(schedule);
    }
    return grouped;
  }

  // Helper method to parse time string into comparable format
  DateTime _parseTime(String timeStr) {
    // Assuming time format is "HH:mm AM/PM"
    final parts = timeStr.split(' ');
    final timeParts = parts[0].split(':');
    var hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);

    // Convert to 24-hour format
    if (parts[1] == 'PM' && hour != 12) {
      hour += 12;
    } else if (parts[1] == 'AM' && hour == 12) {
      hour = 0;
    }

    return DateTime(2024, 1, 1, hour, minute);
  }

  void _downloadRoutine(BuildContext context) {
    try {
      getExternalStorageDirectory().then((directory) {
        if (directory != null) {
          final filePath = '${directory.path}/routine.pdf';
          PdfGenerator.generateRoutinePdf(schedules).then((_) {
            if (File(filePath).existsSync()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Routine downloaded successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          });
        }
      });
    } catch (e) {
      debugPrint('Error downloading routine: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final groupedSchedules = _getGroupedSchedules();
    final orderedDays = [
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday'
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Class Routine',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.black),
            onPressed: () => _downloadRoutine(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // University Logo and Header
              Image.asset('assets/icon.png', height: 60),
              const SizedBox(height: 16),
              const Text(
                'Bangladesh University',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Department of English (57th)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Class Routine (Spring-2022)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),

              // Routine Table
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade700),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Table(
                    defaultColumnWidth: const IntrinsicColumnWidth(),
                    border: TableBorder.all(
                      color: Colors.green.shade700,
                      width: 1,
                    ),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.green.shade700,
                        ),
                        children: const [
                          _HeaderCell('Day'),
                          _HeaderCell('Time'),
                          _HeaderCell('Course Name'),
                          _HeaderCell('Code'),
                          _HeaderCell('Room'),
                          _HeaderCell('Teacher\'s Name'),
                        ],
                      ),
                      ...orderedDays.map((day) {
                        final daySchedules = groupedSchedules[day] ?? [];
                        if (daySchedules.isEmpty) {
                          return TableRow(
                            children: [
                              _DataCell(day),
                              const _DataCell('-'),
                              const _DataCell('-'),
                              const _DataCell('-'),
                              const _DataCell('-'),
                              const _DataCell('-'),
                            ],
                          );
                        }

                        // Create rows for each schedule on this day
                        return TableRow(
                          children: [
                            _DataCell(day),
                            _DataCell(daySchedules
                                .map((s) => '${s.startTime} - ${s.endTime}')
                                .join('\n')),
                            _DataCell(daySchedules
                                .map((s) => s.courseCode)
                                .join('\n')),
                            _DataCell(daySchedules
                                .map((s) => s.courseCode)
                                .join('\n')),
                            _DataCell(
                                daySchedules.map((s) => s.room).join('\n')),
                            _DataCell(daySchedules
                                .map((s) => s.teacherName)
                                .join('\n')),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;

  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String text;

  const _DataCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
