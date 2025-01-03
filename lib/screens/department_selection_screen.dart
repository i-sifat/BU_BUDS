import 'package:flutter/material.dart';
import '../data/departments_data.dart';
import '../utils/colors.dart';
import '../utils/typography.dart';
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

  void _continue() {
    if (selectedDepartment != null) {
      final department = departments.firstWhere(
        (dept) => dept.name == selectedDepartment,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChoosingSubjectView(
            userName: widget.userName,
            departmentName: selectedDepartment!,
            courses: department.courses,
          ),
        ),
      );
    }
  }

  void _skip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChoosingSubjectView(
          userName: widget.userName,
          departmentName: departments.first.name,
          courses: departments.first.courses,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: _skip,
            child: Text(
              'Skip',
              style: AppTypography.bodyMedium.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your Department',
                  style: AppTypography.h2,
                ),
                const SizedBox(height: 8),
                Text(
                  'Select the department you want to study in',
                  style: AppTypography.bodyMedium.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: departments.length,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                final department = departments[index];
                final isSelected = department.name == selectedDepartment;

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? AppColors.primary : Colors.grey[200]!,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: department.iconColor,
                      child: Icon(department.icon, color: Colors.black87),
                    ),
                    title: Text(
                      department.name,
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      department.subtitle,
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check_circle,
                            color: AppColors.primary)
                        : const Icon(Icons.circle_outlined, color: Colors.grey),
                    onTap: () => _selectDepartment(department.name),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: selectedDepartment != null ? _continue : null,
                child: Text(
                  'Continue',
                  style: AppTypography.buttonLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
