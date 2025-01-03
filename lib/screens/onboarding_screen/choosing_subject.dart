import 'package:flutter/material.dart';
import '../../models/department.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';
import 'request_notification.dart';

class ChoosingSubjectView extends StatefulWidget {
  final String userName;
  final String departmentName;
  final List<Course> courses;

  const ChoosingSubjectView({
    super.key,
    required this.userName,
    required this.departmentName,
    required this.courses,
  });

  @override
  State<ChoosingSubjectView> createState() => _ChoosingSubjectViewState();
}

class _ChoosingSubjectViewState extends State<ChoosingSubjectView> {
  int selectedCount = 0;

  void _toggleCourse(Course course) {
    if (!course.isSelected && selectedCount >= 6) return;

    setState(() {
      course.isSelected = !course.isSelected;
      selectedCount = widget.courses.where((c) => c.isSelected).length;
    });
  }

  void _continue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationPromptScreen(
          userName: widget.userName,
          selectedTopics: widget.courses.map((c) => c.isSelected).toList(),
        ),
      ),
    );
  }

  void _skip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationPromptScreen(
          userName: widget.userName,
          selectedTopics: List.generate(widget.courses.length, (_) => false),
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
                  'Choose your Course',
                  style: AppTypography.h2,
                ),
                const SizedBox(height: 8),
                Text(
                  'Select 3-6 courses from ${widget.departmentName}',
                  style: AppTypography.bodyMedium.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: widget.courses.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final course = widget.courses[index];
                return _CourseItem(
                  course: course,
                  onTap: () => _toggleCourse(course),
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
                onPressed: selectedCount >= 3 ? _continue : null,
                child: Text(
                  'Continue ($selectedCount/3-6)',
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

class _CourseItem extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const _CourseItem({
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: course.isSelected ? AppColors.primary : Colors.grey[200]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          course.name,
          style: AppTypography.bodyLarge.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          course.level,
          style: AppTypography.bodySmall.copyWith(
            color: Colors.grey,
          ),
        ),
        trailing: course.isSelected
            ? const Icon(Icons.check_circle, color: AppColors.primary)
            : const Icon(Icons.circle_outlined, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
