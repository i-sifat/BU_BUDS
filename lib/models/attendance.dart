import 'package:flutter/material.dart';

class AttendanceRecord {
  final String studentId;
  final String studentName;
  final DateTime date;
  final AttendanceStatus status;
  final String? remarks;

  AttendanceRecord({
    required this.studentId,
    required this.studentName,
    required this.date,
    required this.status,
    this.remarks,
  });
}

enum AttendanceStatus { present, absent, late, excused }

class AttendanceSheet {
  final String subjectName;
  final String teacherName;
  final DateTime date;
  final List<AttendanceRecord> records;
  final int totalStudents;
  final int presentCount;

  AttendanceSheet({
    required this.subjectName,
    required this.teacherName,
    required this.date,
    required this.records,
    required this.totalStudents,
    required this.presentCount,
  });

  double get attendancePercentage =>
      totalStudents > 0 ? (presentCount / totalStudents) * 100 : 0;
}
