import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Subject {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  Subject({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  static List<Subject> getAllSubjects() {
    return [
      Subject(
        title: 'Mathematics',
        subtitle: 'Geometry, Algorithm',
        icon: Icons.functions,
        color: Colors.red[100]!,
      ),
      Subject(
        title: 'Economy',
        subtitle: 'Stock, Property, News',
        icon: Icons.show_chart,
        color: Colors.orange[100]!,
      ),
      Subject(
        title: 'English',
        subtitle: 'Grammar, Literature, Writing',
        icon: Icons.book,
        color: Colors.blue[100]!,
      ),
      Subject(
        title: 'Biology',
        subtitle: 'Anatomy, Genetics, Ecology',
        icon: Icons.biotech,
        color: Colors.green[100]!,
      ),
      Subject(
        title: 'Geography',
        subtitle: 'Maps, Climate, Landforms',
        icon: Icons.public,
        color: Colors.purple[100]!,
      ),
    ];
  }
}
