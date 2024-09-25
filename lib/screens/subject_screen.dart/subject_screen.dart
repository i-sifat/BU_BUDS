import 'package:flutter/material.dart';

class SubjecScreenView extends StatelessWidget {
  const SubjecScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop(); // This will navigate back
          },
        ),
        title: const Text('Subjects'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          children: [
            SubjectButton(
              icon: Icons.calculate, // Replace with your image/icon
              label: 'Math',
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
            SubjectButton(
              icon: Icons.science, // Replace with your image/icon
              label: 'Physics',
              onPressed: () {},
            ),
            SubjectButton(
              icon: Icons.palette, // Replace with your image/icon
              label: 'Arts',
              onPressed: () {},
            ),
            SubjectButton(
              icon: Icons.biotech, // Replace with your image/icon
              label: 'Biology',
              onPressed: () {},
            ),
            SubjectButton(
              icon: Icons.computer, // Replace with your image/icon
              label: 'Technology',
              onPressed: () {},
            ),
            SubjectButton(
              icon: Icons.bar_chart, // Replace with your image/icon
              label: 'Economy',
              onPressed: () {},
            ),
            SubjectButton(
              icon: Icons.book, // Replace with your image/icon
              label: 'English',
              onPressed: () {},
            ),
            SubjectButton(
              icon: Icons.map, // Replace with your image/icon
              label: 'Geography',
              onPressed: () {},
            ),
            SubjectButton(
              icon: Icons.medical_services, // Replace with your image/icon
              label: 'Chemical',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const SubjectButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 50.0),
          onPressed: onPressed,
        ),
        Text(label, style: const TextStyle(fontSize: 16.0)),
      ],
    );
  }
}
