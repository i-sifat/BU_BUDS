import 'package:flutter/material.dart';
import '../data/departments_data.dart';
import '../models/department.dart';
import '../services/preferences_service.dart';
import 'onboarding_screen/choosing_subject.dart';

class DepartmentSelectionScreen extends StatefulWidget {
  final String userName;

  const DepartmentSelectionScreen({
    super.key,
    required this.userName,
  });

  @override
  State<DepartmentSelectionScreen> createState() =>
      _DepartmentSelectionScreenState();
}

class _DepartmentSelectionScreenState extends State<DepartmentSelectionScreen> {
  String? selectedDepartment;
  final departments = DepartmentsData.getDepartments();

  void _selectDepartment(String departmentName) {
    setState(() {
      selectedDepartment = departmentName;
    });
  }

  void _continue() async {
    if (selectedDepartment != null) {
      await PreferencesService.saveSelectedDepartment(selectedDepartment!);

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChoosingSubjectView(
            userName: widget.userName,
            departmentName: selectedDepartment!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Department'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: departments.length,
              itemBuilder: (context, index) {
                final department = departments[index];
                return RadioListTile<String>(
                  title: Text(department.name),
                  value: department.name,
                  groupValue: selectedDepartment,
                  onChanged: (value) => _selectDepartment(value!),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: selectedDepartment != null ? _continue : null,
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
