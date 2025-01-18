import 'package:flutter/material.dart';
import '../../widgets/routine/routine_form.dart';
import '../../widgets/routine/schedule_list.dart';
import '../../models/routine.dart';
import 'routine_preview_screen.dart';

class RoutineGeneratorScreen extends StatefulWidget {
  const RoutineGeneratorScreen({super.key});

  @override
  State<RoutineGeneratorScreen> createState() => _RoutineGeneratorScreenState();
}

class _RoutineGeneratorScreenState extends State<RoutineGeneratorScreen> {
  final List<ScheduleItem> schedules = [];
  String? selectedDepartment;
  String? selectedBatch;
  String? selectedSemester;

  final List<String> departments = [
    'English Department',
    'Mathematics Department',
    'Law Department',
    'CSE Department',
    'Architecture Department',
    'Sociology Department',
    'Business Administration',
    'EEE Department',
    'Pharmacy Department',
    'Economics Department',
    'Political Science Department',
  ];

  final List<String> batches = List.generate(26, (index) => '${45 + index}');

  final List<String> semesters = [
    'Spring',
    'Summer',
    'Winter',
  ];

  void _addSchedule(ScheduleItem schedule) {
    setState(() {
      schedules.add(schedule);
    });
  }

  void _showPreview() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoutinePreviewScreen(schedules: schedules),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Routine Generator',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildDropdownField(
                  'Select your Department',
                  departments,
                  selectedDepartment,
                  (value) => setState(() => selectedDepartment = value),
                ),
                const SizedBox(height: 12),
                _buildDropdownField(
                  'Select your Batch',
                  batches,
                  selectedBatch,
                  (value) => setState(() => selectedBatch = value),
                ),
                const SizedBox(height: 12),
                _buildDropdownField(
                  'Select your Semester',
                  semesters,
                  selectedSemester,
                  (value) => setState(() => selectedSemester = value),
                ),
                const SizedBox(height: 16),
                RoutineForm(onAddSchedule: _addSchedule),
              ],
            ),
          ),
          Expanded(
            child: ScheduleList(schedules: schedules),
          ),
          if (schedules.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _showPreview,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE31E24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Preview',
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

  Widget _buildDropdownField(
    String hint,
    List<String> items,
    String? value,
    void Function(String?) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey[600],
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
