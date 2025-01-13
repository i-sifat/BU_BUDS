import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../navbar_items/dashboard/dashboard_navbar.dart';
import '../navbar_items/menu/menu_navbar.dart';
import '../navbar_items/schedule/schedule_navbar.dart';
import '../navbar_items/person/person_navbar.dart';

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

  final List<NavigationDestination> _destinations = const [
    NavigationDestination(
      icon: Icon(Icons.dashboard_outlined),
      selectedIcon: Icon(Icons.dashboard),
      label: 'Dashboard',
    ),
    NavigationDestination(
      icon: Icon(Icons.calendar_today_outlined),
      selectedIcon: Icon(Icons.calendar_today),
      label: 'Schedule',
    ),
    NavigationDestination(
      icon: Icon(Icons.menu_outlined),
      selectedIcon: Icon(Icons.menu),
      label: 'Menu',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pages = [
      DashboardNavbarView(
        selectedTopics: widget.selectedTopics,
        userName: widget.userName,
      ),
      const ScheduleNavbarView(),
      const MenuNavigationView(),
      PersonScreenView(userName: widget.userName),
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
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          destinations: _destinations,
          elevation: 8,
          height: 65,
          backgroundColor: Colors.white,
          indicatorColor: Colors.teal.withOpacity(0.2),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        ),
      ),
    );
  }
}
