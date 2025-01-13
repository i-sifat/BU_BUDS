import 'package:flutter/material.dart';

enum UserRole {
  student,
  classRepresentative,
  guest;

  String get displayName {
    switch (this) {
      case UserRole.student:
        return 'Student';
      case UserRole.classRepresentative:
        return 'Class Representative';
      case UserRole.guest:
        return 'Guest';
    }
  }

  IconData get icon {
    switch (this) {
      case UserRole.student:
        return Icons.school;
      case UserRole.classRepresentative:
        return Icons.admin_panel_settings;
      case UserRole.guest:
        return Icons.person_outline;
    }
  }
}
