import 'package:bu_buds/screens/onboarding_screen/request_notification.dart';
import 'package:flutter/material.dart';

class ChoosingSubjectView extends StatefulWidget {
  const ChoosingSubjectView({super.key});

  @override
  State<ChoosingSubjectView> createState() => _ChoosingSubjectViewState();
}

class _ChoosingSubjectViewState extends State<ChoosingSubjectView> {
  final List<String> topics = [
    'CSE',
    'Sociology',
    'English',
    'Law',
    'LLB',
  ];

  final List<String> subtexts = [
    "Technology, Programming, Engineering",
    "Humanities, Social Sciences, Research",
    "Arts, Literature, Communication",
    "Legal System, Justice, Government",
    "Legal Education, Career Paths, Legal Profession"
  ];

  final List<bool> _selectedTopics = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Skip button logic
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Choose your topic interest',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit enim, ac amet ultrices.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey[200],
                            // Placeholder for icon, update with appropriate image or icon
                            child:
                                const Icon(Icons.subject, color: Colors.blue),
                          ),
                          title: Text(
                            topics[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            subtexts[index],
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                          trailing: Transform.scale(
                            scale: 1.5, // Increase size of the checkbox
                            child: Checkbox(
                              value: _selectedTopics[index],
                              onChanged: (value) {
                                setState(() {
                                  _selectedTopics[index] = value!;
                                });
                              },
                              activeColor: Colors.blue,
                              shape: const CircleBorder(), // Circular checkbox
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey, // Subtle divider color
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationPromptScreen(),
                    ),
                  );
                  // Continue button logic
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
