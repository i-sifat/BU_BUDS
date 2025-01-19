import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../models/routine.dart';
import '../../utils/colors.dart';
import '../../utils/pdf_generator.dart';
import '../../services/image_generator_service.dart';

import '../../widgets/dialogs/permission_dialog.dart';

class RoutinePreviewScreen extends StatelessWidget {
  final List<ScheduleItem> schedules;
  final GlobalKey _printKey = GlobalKey();

  RoutinePreviewScreen({
    super.key,
    required this.schedules,
  });

  Map<String, List<ScheduleItem>> _getGroupedSchedules() {
    final sortedSchedules = List<ScheduleItem>.from(schedules)
      ..sort((a, b) {
        final aTime = _parseTime(a.startTime);
        final bTime = _parseTime(b.startTime);
        return aTime.compareTo(bTime);
      });

    final grouped = <String, List<ScheduleItem>>{};
    for (var schedule in sortedSchedules) {
      if (!grouped.containsKey(schedule.dayOfWeek)) {
        grouped[schedule.dayOfWeek] = [];
      }
      grouped[schedule.dayOfWeek]!.add(schedule);
    }
    return grouped;
  }

  DateTime _parseTime(String timeStr) {
    final parts = timeStr.split(' ');
    final timeParts = parts[0].split(':');
    var hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);

    if (parts[1] == 'PM' && hour != 12) {
      hour += 12;
    } else if (parts[1] == 'AM' && hour == 12) {
      hour = 0;
    }

    return DateTime(2024, 1, 1, hour, minute);
  }

  Future<void> _handleImageSave(BuildContext context) async {
    try {
      // Show permission dialog
      final shouldProceed = await showDialog<bool>(
        context: context,
        builder: (context) => const PermissionDialog(
          title: 'Storage Permission Required',
          message: 'We need permission to save images to your device storage.',
        ),
      );

      if (shouldProceed != true) return;

      // Find the RepaintBoundary
      final boundary =
          _printKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      // Save the image
      final imagePath =
          await ImageGeneratorService.captureAndSaveImage(boundary);

      if (imagePath != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Image saved to Downloads: ${imagePath.split('/').last}'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save image: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showSaveOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save Routine'),
          content: const Text('Choose a format to save:'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _handleImageSave(context);
              },
              child: const Text('Save as Image'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                try {
                  await PdfGenerator.generateRoutinePdf(schedules);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('PDF saved successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to save PDF: $e'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: const Text('Save as PDF'),
            ),
          ],
        );
      },
    );
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
    ].where((day) => groupedSchedules.containsKey(day)).toList();

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
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: RepaintBoundary(
                key: _printKey,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
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
                                final daySchedules = groupedSchedules[day]!;
                                return TableRow(
                                  children: [
                                    _DataCell(day),
                                    _DataCell(daySchedules
                                        .map((s) =>
                                            '${s.startTime} - ${s.endTime}')
                                        .join('\n')),
                                    _DataCell(daySchedules
                                        .map((s) => s.courseCode)
                                        .join('\n')),
                                    _DataCell(daySchedules
                                        .map((s) => s.courseCode)
                                        .join('\n')),
                                    _DataCell(daySchedules
                                        .map((s) => s.room)
                                        .join('\n')),
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => _showSaveOptions(context),
                child: const Text(
                  'Share Routine',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
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
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
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
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}
