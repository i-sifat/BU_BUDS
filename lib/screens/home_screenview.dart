import 'package:bu_buds/screens/classcreen/class_screen.dart';
import 'package:bu_buds/screens/course/course_screen.dart';
import 'package:bu_buds/screens/presence/presence_screen.dart';
import 'package:bu_buds/screens/subject_screen.dart/subject_screen.dart';
import 'package:flutter/material.dart';

class MyHomeScreenView extends StatelessWidget {
  const MyHomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF3F5F8), // Background color similar to the screenshot
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Jenny Wilson',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Here is your activity today,',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_outlined,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              SizedBox(
                height: 270, // Fixed height to prevent overflow
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.6, // Keep a 2:1 ratio for the cards
                  children: [
                    _buildGridCard('89%', 'Presence', Colors.orange),
                    _buildGridCard('100%', 'Completeness', Colors.blue),
                    _buildGridCard('18', 'Assignments', Colors.red),
                    _buildGridCard('12', 'Total Subject', Colors.amber),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Icon row (Course, Subjects, Class, Presence)
              // Simplified and Interactive Icon Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Course Icon with Navigation
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CourseScreenView()));
                    },
                    child: _buildIconLabel(
                        Icons.book_outlined, 'Course', Colors.teal),
                  ),

                  // Subjects Icon with Navigation
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SubjecScreenView())),
                    child: _buildIconLabel(
                        Icons.school_outlined, 'Subjects', Colors.blue),
                  ),

                  // Class Icon with Navigation
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClassScreenView())),
                    child: _buildIconLabel(
                        Icons.class_outlined, 'Class', Colors.orange),
                  ),

                  // Presence Icon with Navigation
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PresenceScreenView())),
                    child: _buildIconLabel(
                        Icons.check_circle_outline, 'Presence', Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Schedule Section
              const Text(
                'Schedule',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              // Schedule bar
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildScheduleItem('Economy', Colors.orange),
                    _buildScheduleItem('Geography', Colors.red),
                    _buildScheduleItem('English', Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Default to first tab
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }

  // Function to build grid cards
  Widget _buildGridCard(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Function to build icon with label
  Widget _buildIconLabel(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 30,
            color: color,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  // Function to build schedule items
  Widget _buildScheduleItem(String subject, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          subject,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
