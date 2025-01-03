import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/department.dart';

class PreferencesService {
  static const String selectedDepartmentKey = 'selected_department';
  static const String selectedCoursesKey = 'selected_courses';

  static Future<void> saveSelectedDepartment(String departmentName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(selectedDepartmentKey, departmentName);
  }

  static Future<String?> getSelectedDepartment() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedDepartmentKey);
  }

  static Future<void> saveSelectedCourses(List<Course> courses) async {
    final prefs = await SharedPreferences.getInstance();
    final coursesList = courses
        .map((course) => {
              'name': course.name,
              'departmentName': course.departmentName,
              'level': course.level,
              'isSelected': course.isSelected,
            })
        .toList();
    await prefs.setString(selectedCoursesKey, jsonEncode(coursesList));
  }

  static Future<List<Course>> getSelectedCourses() async {
    final prefs = await SharedPreferences.getInstance();
    final coursesString = prefs.getString(selectedCoursesKey);
    if (coursesString == null) return [];

    final coursesList = jsonDecode(coursesString) as List;
    return coursesList
        .map((course) => Course(
              name: course['name'],
              departmentName: course['departmentName'],
              level: course['level'],
              isSelected: course['isSelected'],
            ))
        .toList();
  }
}
