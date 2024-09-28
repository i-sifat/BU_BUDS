import 'package:flutter/material.dart';
import 'dashboard_navbar.dart';
import 'menu_navbar.dart';
import 'person_navbar.dart';
import 'schedule_navbar.dart';
import 'package:flutter/services.dart';

class MyHomeScreenView extends StatefulWidget {
  const MyHomeScreenView({super.key});

  @override
  State<MyHomeScreenView> createState() => _MyHomeScreenViewState();
}

class _MyHomeScreenViewState extends State<MyHomeScreenView> {
  int _selectedIndex = 0;

  // List of pages corresponding to each BottomNavigationBar item
  final List<Widget> _pages = [
    const DashboardNavbarView(),
    const ScheduleNavbarView(),
    const MenuNavigationbarView(),
    const PersonScreenView(),
  ];

  // Method to handle bottom navigation bar tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await _showExitConfirmationDialog(context);
        return shouldExit;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F5F8),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }

// Function to show confirmation dialog
  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(), // Closes the app
                child: const Text('OK'),
              ),
            ],
          ),
        ) ??
        false; // Return false if dialog is dismissed
  }
}
