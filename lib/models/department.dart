class Department {
  final String name;
  final List<Course> courses;

  Department({required this.name, required this.courses});
}

class Course {
  final String name;
  final String departmentName;
  final String level; // 'Undergraduate' or 'Graduate'
  bool isSelected;

  Course({
    required this.name,
    required this.departmentName,
    required this.level,
    this.isSelected = false,
  });
}
