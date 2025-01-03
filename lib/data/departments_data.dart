import '../models/department.dart';

class DepartmentsData {
  static List<Department> getDepartments() {
    return [
      Department(
        name: 'English Department',
        courses: [
          Course(
            name: 'English Language and Literature (B.A./B.Sc.)',
            departmentName: 'English Department',
            level: 'Undergraduate',
          ),
          Course(
            name: 'English Education (B.Ed.)',
            departmentName: 'English Department',
            level: 'Undergraduate',
          ),
          Course(
            name: 'Creative Writing (B.A./B.Sc.)',
            departmentName: 'English Department',
            level: 'Undergraduate',
          ),
          Course(
            name: 'Master of Arts (M.A.) in English',
            departmentName: 'English Department',
            level: 'Graduate',
          ),
          // Add other English department courses
        ],
      ),
      Department(
        name: 'Mathematics Department',
        courses: [
          Course(
            name: 'Mathematics (B.Sc.)',
            departmentName: 'Mathematics Department',
            level: 'Undergraduate',
          ),
          Course(
            name: 'Applied Mathematics (B.Sc.)',
            departmentName: 'Mathematics Department',
            level: 'Undergraduate',
          ),
          // Add other Mathematics department courses
        ],
      ),
      // Add other departments similarly
    ];
  }
}
