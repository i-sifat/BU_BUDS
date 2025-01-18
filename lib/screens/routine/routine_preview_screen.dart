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
            onPressed: () => _downloadRoutine(context), // Pass context here
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header Section
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Bangladesh University',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Department of English (57th)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Class Schedule',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Routine Table
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    // Table Header
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Day',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Time',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Course Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Code',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Room',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Teacher\'s Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Table Body
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: schedules.length,
                      itemBuilder: (context, index) {
                        final schedule = schedules[index];
                        return Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[300]!,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(schedule.dayOfWeek),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    '${schedule.startTime} - ${schedule.endTime}'),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(schedule.courseCode),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(schedule.courseCode),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(schedule.room),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(schedule.teacherName),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Footer
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Generated by BuBuds App.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
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
