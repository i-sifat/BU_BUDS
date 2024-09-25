import 'package:flutter/material.dart';

class PresenceScreenView extends StatelessWidget {
  const PresenceScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presences'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Back button logic
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PresenceCard(
              subjectName: 'Mathematics',
              materials: 15,
              percentage: 100,
              attendanceList: [
                Attendance(date: 'Today', status: 'Present'),
                Attendance(date: '15 Dec 2021', status: 'Present'),
                Attendance(date: '12 Dec 2021', status: 'Present'),
              ],
            ),
            const SizedBox(height: 20),
            const PresenceCard(
              subjectName: 'Biology',
              materials: 15,
              percentage: 85,
              attendanceList: [],
            ),
            const SizedBox(height: 20),
            const PresenceCard(
              subjectName: 'English',
              materials: 15,
              percentage: 45,
              attendanceList: [],
            ),
          ],
        ),
      ),
    );
  }
}

class PresenceCard extends StatefulWidget {
  final String subjectName;
  final int materials;
  final int percentage;
  final List<Attendance> attendanceList;

  const PresenceCard({
    super.key,
    required this.subjectName,
    required this.materials,
    required this.percentage,
    required this.attendanceList,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PresenceCardState createState() => _PresenceCardState();
}

class _PresenceCardState extends State<PresenceCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.subjectName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text('${widget.materials} materials'),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: widget.percentage == 100
                        ? Colors.green
                        : widget.percentage > 50
                            ? Colors.orange
                            : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${widget.percentage}%',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            if (_isExpanded && widget.attendanceList.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.attendanceList.length,
                itemBuilder: (context, index) {
                  final attendance = widget.attendanceList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(attendance.date),
                        Text(attendance.status),
                      ],
                    ),
                  );
                },
              ),
            ],
            IconButton(
              icon: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Attendance {
  final String date;
  final String status;

  Attendance({required this.date, required this.status});
}
