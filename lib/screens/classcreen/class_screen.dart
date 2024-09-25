import 'package:flutter/material.dart';

class ClassScreenView extends StatelessWidget {
  const ClassScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Class'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Proper back button logic
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: () {
              // Change view button logic here
            },
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              // Alternate view button logic here
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClassCard(
                imageUrl:
                    'assets/Rectangle2761.png', // Replace with your image path
                teacherName: 'Wade Warren',
                subjectName: 'Mathematics',
                materials: 15,
                completed: 8,
                onPressed: () {
                  // Add logic for mathematics
                },
              ),
              const SizedBox(height: 20),
              ClassCard(
                imageUrl:
                    'assets/Rectangle2761-1.png', // Replace with your image path
                teacherName: 'Darlene Robertson',
                subjectName: 'Biology',
                materials: 15,
                completed: 8,
                onPressed: () {
                  // Add logic for biology
                },
              ),
              const SizedBox(height: 20),
              ClassCard(
                imageUrl:
                    'assets/Rectangle2761-2.png', // Replace with your image path
                teacherName: 'Cody Fisher',
                subjectName: 'English',
                materials: 15,
                completed: 8,
                onPressed: () {
                  // Add logic for English
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String imageUrl;
  final String teacherName;
  final String subjectName;
  final int materials;
  final int completed;
  final VoidCallback onPressed;

  const ClassCard({
    super.key,
    required this.imageUrl,
    required this.teacherName,
    required this.subjectName,
    required this.materials,
    required this.completed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teacherName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subjectName,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text('$materials materials'),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: completed == materials ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$completed/$materials',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
