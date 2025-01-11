import 'package:flutter/material.dart';
import '../../models/attendance.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';
import '../../widgets/presence/presence_status_badge.dart';

class PresenceScreenView extends StatefulWidget {
  const PresenceScreenView({super.key});

  @override
  State<PresenceScreenView> createState() => _PresenceScreenViewState();
}

class _PresenceScreenViewState extends State<PresenceScreenView> {
  final List<AttendanceSheet> _attendanceSheets = [
    AttendanceSheet(
      subjectName: 'Mathematics',
      teacherName: 'Dr. Smith',
      date: DateTime.now(),
      records: [],
      totalStudents: 30,
      presentCount: 28,
    ),
    AttendanceSheet(
      subjectName: 'Physics',
      teacherName: 'Dr. Johnson',
      date: DateTime.now(),
      records: [],
      totalStudents: 25,
      presentCount: 22,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendance',
          style: AppTypography.h3,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _showDatePicker(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildAttendanceOverview(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _attendanceSheets.length,
              itemBuilder: (context, index) {
                return _buildAttendanceCard(_attendanceSheets[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTakeAttendanceDialog(context),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildAttendanceOverview() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.primary.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildOverviewItem('Total Classes', '15'),
          _buildOverviewItem('Present', '13'),
          _buildOverviewItem('Attendance', '86.7%'),
        ],
      ),
    );
  }

  Widget _buildOverviewItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.h2.copyWith(color: AppColors.primary),
        ),
        Text(
          label,
          style: AppTypography.bodySmall,
        ),
      ],
    );
  }

  Widget _buildAttendanceCard(AttendanceSheet sheet) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sheet.subjectName,
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PresenceStatusBadge(
                  percentage: sheet.attendancePercentage.round(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Teacher: ${sheet.teacherName}',
              style: AppTypography.bodyMedium,
            ),
            Text(
              'Date: ${_formatDate(sheet.date)}',
              style: AppTypography.bodySmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Present: ${sheet.presentCount}/${sheet.totalStudents}',
              style: AppTypography.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      // Handle date selection
    }
  }

  Future<void> _showTakeAttendanceDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Take Attendance',
          style: AppTypography.h3,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Subject',
              ),
              items: const [
                DropdownMenuItem(
                    value: 'Mathematics', child: Text('Mathematics')),
                DropdownMenuItem(value: 'Physics', child: Text('Physics')),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Number of Students',
              ),
              keyboardType: TextInputType.number, // Moved outside of decoration
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement attendance taking logic
            },
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
