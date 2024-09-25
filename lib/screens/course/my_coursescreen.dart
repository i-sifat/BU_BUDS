import 'package:flutter/material.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text('My Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Course in progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Course in progress',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {}, // Add 'View all' action
                  child: const Text('View all'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Progress Courses List
            buildCourseProgressCard(
              imageUrl: 'assets/image1.png', // Replace with actual image asset
              title: 'How to prepare your documentation assignment',
              lessonProgress: '16/28 Lesson',
              progressValue: 0.6,
              cardColor: Colors.indigo[900] ??
                  Colors.indigo, // Dark background with fallback
            ),
            const SizedBox(height: 10),
            buildCourseProgressCard(
              imageUrl: 'assets/image2.png', // Replace with actual image asset
              title: 'How to prepare your documentation assignment',
              lessonProgress: '16/28 Lesson',
              progressValue: 0.5,
              cardColor: Colors.white, // Light background
            ),
            const SizedBox(height: 20),

            // Completed Courses
            const Text(
              'Completed course',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Completed Course List
            buildCompletedCourseCard(
              title: 'Lorem ipsum dolor sit amet...',
              completedColor: Colors.green,
            ),
            const SizedBox(height: 10),
            buildCompletedCourseCard(
              title: 'Lorem ipsum dolor sit amet...',
              completedColor: Colors.green[200]!,
            ),
          ],
        ),
      ),
    );
  }

  // Course Progress Card
  Widget buildCourseProgressCard({
    required String imageUrl,
    required String title,
    required String lessonProgress,
    required double progressValue,
    required Color cardColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
            radius: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color:
                        cardColor == Colors.white ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  lessonProgress,
                  style: TextStyle(
                    color:
                        cardColor == Colors.white ? Colors.grey : Colors.orange,
                  ),
                ),
                const SizedBox(height: 5),
                LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.grey[300],
                  color:
                      cardColor == Colors.white ? Colors.blue : Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Completed Course Card
  Widget buildCompletedCourseCard({
    required String title,
    required Color completedColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: completedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
