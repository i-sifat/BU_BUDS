class ScheduleItem {
  final String dayOfWeek;
  final String startTime;
  final String endTime;
  final String teacherName;
  final String room;
  final String courseCode;
  final String category;

  ScheduleItem({
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.teacherName,
    required this.room,
    required this.courseCode,
    required this.category,
  });
}
