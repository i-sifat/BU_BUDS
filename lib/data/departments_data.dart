import '../models/department.dart';
import 'package:flutter/material.dart';

class DepartmentsData {
  static List<Department> getDepartments() {
    return [
      Department(
        name: 'English Department',
        icon: Icons.book,
        iconColor: Colors.pink[100]!,
        subtitle: 'Language, Literature, Writing',
        courses: _getEnglishCourses(),
      ),
      Department(
        name: 'Mathematics Department',
        icon: Icons.functions,
        iconColor: Colors.yellow[100]!,
        subtitle: 'Pure & Applied Mathematics',
        courses: _getMathCourses(),
      ),
      Department(
        name: 'Law Department',
        icon: Icons.gavel,
        iconColor: Colors.blue[100]!,
        subtitle: 'Legal Studies',
        courses: _getLawCourses(),
      ),
      Department(
        name: 'CSE Department',
        icon: Icons.computer,
        iconColor: Colors.pink[100]!,
        subtitle: 'Computer Science & Engineering',
        courses: _getCSECourses(),
      ),
      Department(
        name: 'Architecture Department',
        icon: Icons.architecture,
        iconColor: Colors.yellow[100]!,
        subtitle: 'Design & Planning',
        courses: _getArchitectureCourses(),
      ),
      Department(
        name: 'Sociology Department',
        icon: Icons.people,
        iconColor: Colors.blue[100]!,
        subtitle: 'Social Studies',
        courses: _getSociologyCourses(),
      ),
      Department(
        name: 'Business Administration',
        icon: Icons.business,
        iconColor: Colors.green[100]!,
        subtitle: 'Management & Commerce',
        courses: _getBusinessCourses(),
      ),
      Department(
        name: 'EEE Department',
        icon: Icons.electric_bolt,
        iconColor: Colors.purple[100]!,
        subtitle: 'Electrical & Electronics',
        courses: _getEEECourses(),
      ),
      Department(
        name: 'Pharmacy Department',
        icon: Icons.medical_services,
        iconColor: Colors.red[100]!,
        subtitle: 'Pharmaceutical Studies',
        courses: _getPharmacyCourses(),
      ),
    ];
  }

  static List<Course> _getEnglishCourses() {
    return [
      Course(
          name: 'English Language and Literature (B.A./B.Sc.)',
          departmentName: 'English Department',
          level: 'Undergraduate'),
      Course(
          name: 'English Education (B.Ed.)',
          departmentName: 'English Department',
          level: 'Undergraduate'),
      Course(
          name: 'Creative Writing (B.A./B.Sc.)',
          departmentName: 'English Department',
          level: 'Undergraduate'),
      Course(
          name: 'Journalism and Mass Communication (B.A./B.Sc.)',
          departmentName: 'English Department',
          level: 'Undergraduate'),
      Course(
          name: 'Linguistics (B.A./B.Sc.)',
          departmentName: 'English Department',
          level: 'Undergraduate'),
      Course(
          name: 'Master of Arts (M.A.) in English',
          departmentName: 'English Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Philosophy (M.Phil.) in English',
          departmentName: 'English Department',
          level: 'Graduate'),
      Course(
          name: 'Doctor of Philosophy (Ph.D.) in English',
          departmentName: 'English Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Fine Arts (M.F.A.) in Creative Writing',
          departmentName: 'English Department',
          level: 'Graduate'),
    ];
  }

  static List<Course> _getMathCourses() {
    return [
      Course(
          name: 'Mathematics (B.Sc.)',
          departmentName: 'Mathematics Department',
          level: 'Undergraduate'),
      Course(
          name: 'Applied Mathematics (B.Sc.)',
          departmentName: 'Mathematics Department',
          level: 'Undergraduate'),
      Course(
          name: 'Statistics (B.Sc.)',
          departmentName: 'Mathematics Department',
          level: 'Undergraduate'),
      Course(
          name: 'Actuarial Science (B.Sc.)',
          departmentName: 'Mathematics Department',
          level: 'Undergraduate'),
      Course(
          name: 'Mathematics Education (B.Ed.)',
          departmentName: 'Mathematics Department',
          level: 'Undergraduate'),
      Course(
          name: 'Master of Science (M.Sc.) in Mathematics',
          departmentName: 'Mathematics Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Philosophy (M.Phil.) in Mathematics',
          departmentName: 'Mathematics Department',
          level: 'Graduate'),
      Course(
          name: 'Doctor of Philosophy (Ph.D.) in Mathematics',
          departmentName: 'Mathematics Department',
          level: 'Graduate'),
    ];
  }

  static List<Course> _getLawCourses() {
    return [
      Course(
          name: 'Bachelor of Laws (LL.B.)',
          departmentName: 'Law Department',
          level: 'Undergraduate'),
      Course(
          name: 'Jurisprudence and Legal Studies (B.A./B.Sc.)',
          departmentName: 'Law Department',
          level: 'Undergraduate'),
      Course(
          name: 'Master of Laws (LL.M.)',
          departmentName: 'Law Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Legal Studies (M.L.S.)',
          departmentName: 'Law Department',
          level: 'Graduate'),
      Course(
          name: 'Doctor of Juridical Science (S.J.D.)',
          departmentName: 'Law Department',
          level: 'Graduate'),
    ];
  }

  static List<Course> _getCSECourses() {
    return [
      Course(
          name: 'Computer Science and Engineering (B.Sc.)',
          departmentName: 'CSE Department',
          level: 'Undergraduate'),
      Course(
          name: 'Software Engineering (B.Sc.)',
          departmentName: 'CSE Department',
          level: 'Undergraduate'),
      Course(
          name: 'Computer Science (B.Sc.)',
          departmentName: 'CSE Department',
          level: 'Undergraduate'),
      Course(
          name: 'Information Technology (B.Sc.)',
          departmentName: 'CSE Department',
          level: 'Undergraduate'),
      Course(
          name: 'Cybersecurity (B.Sc.)',
          departmentName: 'CSE Department',
          level: 'Undergraduate'),
      Course(
          name: 'Master of Science (M.Sc.) in Computer Science and Engineering',
          departmentName: 'CSE Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Science (M.Sc.) in Software Engineering',
          departmentName: 'CSE Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Science (M.Sc.) in Information Technology',
          departmentName: 'CSE Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Science (M.Sc.) in Cybersecurity',
          departmentName: 'CSE Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Philosophy (M.Phil.) in Computer Science',
          departmentName: 'CSE Department',
          level: 'Graduate'),
      Course(
          name: 'Doctor of Philosophy (Ph.D.) in Computer Science',
          departmentName: 'CSE Department',
          level: 'Graduate'),
    ];
  }

  static List<Course> _getArchitectureCourses() {
    return [
      Course(
          name: 'Bachelor of Architecture (B.Arch.)',
          departmentName: 'Architecture Department',
          level: 'Undergraduate'),
      Course(
          name: 'Interior Architecture (B.Sc.)',
          departmentName: 'Architecture Department',
          level: 'Undergraduate'),
      Course(
          name: 'Landscape Architecture (B.Sc.)',
          departmentName: 'Architecture Department',
          level: 'Undergraduate'),
      Course(
          name: 'Urban and Regional Planning (B.Sc.)',
          departmentName: 'Architecture Department',
          level: 'Undergraduate'),
      Course(
          name: 'Master of Architecture (M.Arch.)',
          departmentName: 'Architecture Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Landscape Architecture (M.L.Arch.)',
          departmentName: 'Architecture Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Urban and Regional Planning (M.U.R.P.)',
          departmentName: 'Architecture Department',
          level: 'Graduate'),
    ];
  }

  static List<Course> _getSociologyCourses() {
    return [
      Course(
          name: 'Sociology (B.A./B.Sc.)',
          departmentName: 'Sociology Department',
          level: 'Undergraduate'),
      Course(
          name: 'Social Work (B.A./B.Sc.)',
          departmentName: 'Sociology Department',
          level: 'Undergraduate'),
      Course(
          name: 'Criminology (B.A./B.Sc.)',
          departmentName: 'Sociology Department',
          level: 'Undergraduate'),
      Course(
          name: 'Development Studies (B.A./B.Sc.)',
          departmentName: 'Sociology Department',
          level: 'Undergraduate'),
      Course(
          name: 'Master of Arts (M.A.) in Sociology',
          departmentName: 'Sociology Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Social Work (M.S.W.)',
          departmentName: 'Sociology Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Philosophy (M.Phil.) in Sociology',
          departmentName: 'Sociology Department',
          level: 'Graduate'),
      Course(
          name: 'Doctor of Philosophy (Ph.D.) in Sociology',
          departmentName: 'Sociology Department',
          level: 'Graduate'),
    ];
  }

  static List<Course> _getBusinessCourses() {
    return [
      Course(
          name: 'Business Administration (B.B.A.)',
          departmentName: 'Business Administration',
          level: 'Undergraduate'),
      Course(
          name: 'Marketing (B.B.A.)',
          departmentName: 'Business Administration',
          level: 'Undergraduate'),
      Course(
          name: 'Finance (B.B.A.)',
          departmentName: 'Business Administration',
          level: 'Undergraduate'),
      Course(
          name: 'Management (B.B.A.)',
          departmentName: 'Business Administration',
          level: 'Undergraduate'),
      Course(
          name: 'Human Resource Management (B.B.A.)',
          departmentName: 'Business Administration',
          level: 'Undergraduate'),
      Course(
          name: 'International Business (B.B.A.)',
          departmentName: 'Business Administration',
          level: 'Undergraduate'),
      Course(
          name: 'Entrepreneurship (B.B.A.)',
          departmentName: 'Business Administration',
          level: 'Undergraduate'),
      Course(
          name: 'Master of Business Administration (M.B.A.)',
          departmentName: 'Business Administration',
          level: 'Graduate'),
      Course(
          name: 'Master of Science (M.S.) in Finance',
          departmentName: 'Business Administration',
          level: 'Graduate'),
      Course(
          name: 'Master of Science (M.S.) in Marketing',
          departmentName: 'Business Administration',
          level: 'Graduate'),
      Course(
          name: 'Master of Science (M.S.) in Human Resource Management',
          departmentName: 'Business Administration',
          level: 'Graduate'),
      Course(
          name: 'Master of Philosophy (M.Phil.) in Business Administration',
          departmentName: 'Business Administration',
          level: 'Graduate'),
    ];
  }

  static List<Course> _getEEECourses() {
    return [
      Course(
          name: 'Electrical and Electronics Engineering (B.Sc.)',
          departmentName: 'EEE Department',
          level: 'Undergraduate'),
      Course(
          name: 'Power Engineering (B.Sc.)',
          departmentName: 'EEE Department',
          level: 'Undergraduate'),
      Course(
          name: 'Control Systems Engineering (B.Sc.)',
          departmentName: 'EEE Department',
          level: 'Undergraduate'),
      Course(
          name: 'Electronics and Communication Engineering (B.Sc.)',
          departmentName: 'EEE Department',
          level: 'Undergraduate'),
      Course(
          name:
              'Master of Science (M.Sc.) in Electrical and Electronics Engineering',
          departmentName: 'EEE Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Science (M.Sc.) in Power Engineering',
          departmentName: 'EEE Department',
          level: 'Graduate'),
      Course(
          name: 'Master of Science (M.Sc.) in Control Systems Engineering',
          departmentName: 'EEE Department',
          level: 'Graduate'),
      Course(
          name:
              'Master of Science (M.Sc.) in Electronics and Communication Engineering',
          departmentName: 'EEE Department',
          level: 'Graduate'),
      Course(
          name:
              'Master of Philosophy (M.Phil.) in Electrical and Electronics Engineering',
          departmentName: 'EEE Department',
          level: 'Graduate'),
      Course(
          name:
              'Doctor of Philosophy (Ph.D.) in Electrical and Electronics Engineering',
          departmentName: 'EEE Department',
          level: 'Graduate'),
    ];
  }

  static List<Course> _getPharmacyCourses() {
    return [
      Course(
          name: 'Bachelor of Pharmacy (B.Pharm.)',
          departmentName: 'Pharmacy Department',
          level: 'Undergraduate'),
      Course(
          name: 'Master of Pharmacy (M.Pharm.)',
          departmentName: 'Pharmacy Department',
          level: 'Graduate'),
      Course(
          name: 'Doctor of Pharmacy (Ph.D.)',
          departmentName: 'Pharmacy Department',
          level: 'Graduate'),
    ];
  }
}
