import 'package:flutter/material.dart';
import '../../models/subject.dart';
import '../../utils/typography.dart';
import '../../widgets/subject/subject_card.dart';

class SubjecScreenView extends StatelessWidget {
  final List<bool> selectedTopics;

  const SubjecScreenView({
    super.key,
    required this.selectedTopics,
  });

  @override
  Widget build(BuildContext context) {
    final allSubjects = Subject.getAllSubjects();
    final selectedSubjects = allSubjects
        .asMap()
        .entries
        .where((entry) => selectedTopics[entry.key])
        .map((entry) => entry.value)
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Subjects',
          style: AppTypography.h3,
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: selectedSubjects.length,
        itemBuilder: (context, index) {
          return SubjectCard(subject: selectedSubjects[index]);
        },
      ),
    );
  }
}
