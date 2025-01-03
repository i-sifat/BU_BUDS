import 'package:flutter/material.dart';

class Department {
  final String name;
  final IconData icon;
  final Color iconColor;
  final String subtitle;
  final List<Course> courses;

  Department({
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.subtitle,
    required this.courses,
  });
}

class Course {
  final String name;
  final String departmentName;
  final String level;
  bool isSelected;

  Course({
    required this.name,
    required this.departmentName,
    required this.level,
    this.isSelected = false,
  });
}
