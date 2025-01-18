import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../utils/colors.dart';
import '../../utils/typography.dart';

class RoutineGeneratorScreen extends StatefulWidget {
  const RoutineGeneratorScreen({super.key});

  @override
  State<RoutineGeneratorScreen> createState() => _RoutineGeneratorScreenState();
}

class _RoutineGeneratorScreenState extends State<RoutineGeneratorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _departmentController = TextEditingController();
  final _batchController = TextEditingController();
  final _semesterController = TextEditingController();

  List<ClassSchedule> schedules = [ClassSchedule()];

  void _addMoreSchedules() {
    setState(() {
      schedules.add(ClassSchedule());
    });
  }

  void _previewRoutine() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => RoutinePreviewDialog(
          department: _departmentController.text,
          batch: _batchController.text,
          semester: _semesterController.text,
          schedules: schedules,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routine Generator', style: AppTypography.h3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                controller: _departmentController,
                label: 'Department',
                hint: 'Enter department name',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _batchController,
                label: 'Batch',
                hint: 'Enter batch number',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _semesterController,
                label: 'Semester',
                hint: 'Enter semester',
              ),
              const SizedBox(height: 24),
              Text('Class Schedules', style: AppTypography.h3),
              const SizedBox(height: 16),
              ...schedules
                  .map((schedule) => ClassScheduleForm(schedule: schedule)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: _addMoreSchedules,
                    icon: const Icon(Icons.add),
                    label: const Text('Add More'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _previewRoutine,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: const Text('Preview Routine'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}

class ClassSchedule {
  String weekday = '';
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String courseName = '';
  String courseCode = '';
  String room = '';
  String teacherName = '';
}

class ClassScheduleForm extends StatefulWidget {
  final ClassSchedule schedule;

  const ClassScheduleForm({
    super.key,
    required this.schedule,
  });

  @override
  State<ClassScheduleForm> createState() => _ClassScheduleFormState();
}

class _ClassScheduleFormState extends State<ClassScheduleForm> {
  final List<String> weekdays = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  Future<void> _selectTime(bool isStart) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        if (isStart) {
          widget.schedule.startTime = time;
        } else {
          widget.schedule.endTime = time;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: widget.schedule.weekday.isEmpty
                  ? null
                  : widget.schedule.weekday,
              decoration: const InputDecoration(
                labelText: 'Weekday',
                border: OutlineInputBorder(),
              ),
              items: weekdays.map((day) {
                return DropdownMenuItem(
                  value: day,
                  child: Text(day),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  widget.schedule.weekday = value ?? '';
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a weekday';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => _selectTime(true),
                    icon: const Icon(Icons.access_time),
                    label: Text(widget.schedule.startTime?.format(context) ??
                        'Start Time'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => _selectTime(false),
                    icon: const Icon(Icons.access_time),
                    label: Text(
                        widget.schedule.endTime?.format(context) ?? 'End Time'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Course Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => widget.schedule.courseName = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter course name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Course Code',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => widget.schedule.courseCode = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter course code';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Room',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => widget.schedule.room = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter room number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Teacher\'s Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => widget.schedule.teacherName = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter teacher\'s name';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoutinePreviewDialog extends StatelessWidget {
  final String department;
  final String batch;
  final String semester;
  final List<ClassSchedule> schedules;

  const RoutinePreviewDialog({
    super.key,
    required this.department,
    required this.batch,
    required this.semester,
    required this.schedules,
  });

  String _formatTimeOfDay(TimeOfDay? time) {
    if (time == null) return '';
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String _formatTimeRange(TimeOfDay? start, TimeOfDay? end) {
    return '${_formatTimeOfDay(start)} - ${_formatTimeOfDay(end)}';
  }

  Future<void> _generatePDF(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Header(
                level: 0,
                child: pw.Text(
                  'Bangladesh University',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Department of $department (Batch: $batch, Semester: $semester)',
                style: const pw.TextStyle(fontSize: 14),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(color: PdfColors.green),
                children: [
                  pw.TableRow(
                    decoration: const pw.BoxDecoration(
                      color: PdfColors.green100,
                    ),
                    children: [
                      pw.Text('Day'),
                      pw.Text('Time'),
                      pw.Text('Course Name'),
                      pw.Text('Code'),
                      pw.Text('Room'),
                      pw.Text('Teacher\'s Name'),
                    ]
                        .map((text) => pw.Padding(
                              padding: const pw.EdgeInsets.all(8),
                              child: text,
                            ))
                        .toList(),
                  ),
                  ...schedules.map((schedule) => pw.TableRow(
                        children: [
                          pw.Text(schedule.weekday),
                          pw.Text(_formatTimeRange(
                              schedule.startTime, schedule.endTime)),
                          pw.Text(schedule.courseName),
                          pw.Text(schedule.courseCode),
                          pw.Text(schedule.room),
                          pw.Text(schedule.teacherName),
                        ]
                            .map((text) => pw.Padding(
                                  padding: const pw.EdgeInsets.all(8),
                                  child: text,
                                ))
                            .toList(),
                      )),
                ],
              ),
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/routine.pdf');
    await file.writeAsBytes(await pdf.save());

    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('PDF Generated'),
          content: Text('PDF saved to ${file.path}'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Preview Routine'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Department of $department\nBatch: $batch, Semester: $semester',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
                3: IntrinsicColumnWidth(),
                4: IntrinsicColumnWidth(),
                5: IntrinsicColumnWidth(),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('Day',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('Time',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('Course Name',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('Code',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('Room',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text("Teacher's Name",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                ...schedules.map((schedule) => TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(schedule.weekday),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(_formatTimeRange(
                              schedule.startTime, schedule.endTime)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(schedule.courseName),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(schedule.courseCode),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(schedule.room),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(schedule.teacherName),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => _generatePDF(context),
          child: const Text('Generate PDF'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
