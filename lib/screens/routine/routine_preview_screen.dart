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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Routine'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => _downloadRoutine(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    'Bangladesh University',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    'Department of English (57th)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    'Class Schedule',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              _buildHeaderCell('Day', 0.15),
                              _buildHeaderCell('Time', 0.2),
                              _buildHeaderCell('Course Name', 0.2),
                              _buildHeaderCell('Code', 0.15),
                              _buildHeaderCell('Room', 0.1),
                              _buildHeaderCell('Teacher\'s Name', 0.2),
                            ],
                          ),
                        ),
                        ...schedules.map((schedule) => Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                              child: Row(
                                children: [
                                  _buildCell(schedule.dayOfWeek, 0.15),
                                  _buildCell(
                                      '${schedule.startTime} - ${schedule.endTime}',
                                      0.2),
                                  _buildCell(schedule.courseCode, 0.2),
                                  _buildCell(schedule.courseCode, 0.15),
                                  _buildCell(schedule.room, 0.1),
                                  _buildCell(schedule.teacherName, 0.2),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, double widthFactor) {
    return Container(
      width: widthFactor * 800,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCell(String text, double widthFactor) {
    return Container(
      width: widthFactor * 800,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
