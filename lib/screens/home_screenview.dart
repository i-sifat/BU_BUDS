import 'package:bubuds/navbar_items/person/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../navbar_items/dashboard/dashboard_navbar.dart';
import '../navbar_items/menu/menu_navbar.dart';
import '../navbar_items/schedule/schedule_navbar.dart';

class MyHomeScreenView extends StatefulWidget {
  final String userName;
  final List<bool> selectedTopics;

  const MyHomeScreenView({
    super.key,
    required this.userName,
    required this.selectedTopics,
  });

  @override
  State<MyHomeScreenView> createState() => _MyHomeScreenViewState();
}

class _MyHomeScreenViewState extends State<MyHomeScreenView> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const DashboardNavbarView(),
      const ScheduleNavbarView(),
      const MenuNavigationView(),
      ProfileScreen(userName: widget.userName),
    ];
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Future<bool> _onWillPop() async {
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
                onPressed: () => SystemNavigator.pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F5F8),
        body: _pages[_selectedIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
    );
  }
}
