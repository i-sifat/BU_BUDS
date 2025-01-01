import 'package:bubuds/utils/colors.dart';
import 'package:bubuds/utils/typography.dart';
import 'package:bubuds/widgets/presence/attendance_list_item.dart';
import 'package:bubuds/widgets/presence/presence_status_badge.dart';
import 'package:flutter/material.dart';

class SubjectPresenceCard extends StatefulWidget {
  final String subjectName;
  final int totalMaterials;
  final int percentage;
  final List<Map<String, String>> attendanceList;

  const SubjectPresenceCard({
    super.key,
    required this.subjectName,
    required this.totalMaterials,
    required this.percentage,
    required this.attendanceList,
  });

  @override
  State<SubjectPresenceCard> createState() => _SubjectPresenceCardState();
}

class _SubjectPresenceCardState extends State<SubjectPresenceCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.totalMaterials} materials',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                PresenceStatusBadge(percentage: widget.percentage),
              ],
            ),
            if (widget.attendanceList.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Divider(),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Column(
                  children: widget.attendanceList
                      .map((attendance) => AttendanceListItem(
                            date: attendance['date']!,
                            status: attendance['status']!,
                          ))
                      .toList(),
                ),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
              IconButton(
                icon: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
