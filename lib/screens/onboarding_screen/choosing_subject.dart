import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';
import 'request_notification.dart';

class ChoosingSubjectView extends StatefulWidget {
  final String userName;

  const ChoosingSubjectView({
    super.key,
    required this.userName,
  });

  @override
  State<ChoosingSubjectView> createState() => _ChoosingSubjectViewState();
}

class _ChoosingSubjectViewState extends State<ChoosingSubjectView> {
  final List<Map<String, dynamic>> topics = [
    {
      'title': 'Mathematics',
      'subtitle': 'Geometry, Algorithm',
      'icon': Icons.functions,
      'color': Colors.red[100],
      'selected': false,
    },
    {
      'title': 'Economy',
      'subtitle': 'Stock, Property, News',
      'icon': Icons.show_chart,
      'color': Colors.orange[100],
      'selected': false,
    },
    {
      'title': 'English',
      'subtitle': 'Grammar, Literature, Writing',
      'icon': Icons.book,
      'color': Colors.blue[100],
      'selected': false,
    },
    {
      'title': 'Biology',
      'subtitle': 'Anatomy, Genetics, Ecology',
      'icon': Icons.biotech,
      'color': Colors.green[100],
      'selected': false,
    },
    {
      'title': 'Geography',
      'subtitle': 'Maps, Climate, Landforms',
      'icon': Icons.public,
      'color': Colors.purple[100],
      'selected': false,
    },
  ];

  int get selectedCount => topics.where((topic) => topic['selected']).length;

  List<bool> getSelectedTopicsAsBoolList() {
    return topics.map((topic) => topic['selected'] as bool).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Skip',
              style: AppTypography.bodyMedium.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose your topic interest',
              style: AppTypography.h2,
            ),
            const SizedBox(height: 8),
            Text(
              'Select at least 3 topics you are interested in',
              style: AppTypography.bodyMedium.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.separated(
                itemCount: topics.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        topic['selected'] = !topic['selected'];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: topic['selected']
                              ? AppColors.primary
                              : Colors.grey[200]!,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: topic['color'],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(topic['icon'], color: Colors.black),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  topic['title'],
                                  style: AppTypography.bodyLarge.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  topic['subtitle'],
                                  style: AppTypography.bodySmall.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (topic['selected'])
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.primary,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: selectedCount >= 3
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationPromptScreen(
                              userName: widget.userName,
                              selectedTopics: getSelectedTopicsAsBoolList(),
                            ),
                          ),
                        );
                      }
                    : null,
                child: Text(
                  'Continue (${selectedCount}/3)',
                  style: AppTypography.buttonLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
