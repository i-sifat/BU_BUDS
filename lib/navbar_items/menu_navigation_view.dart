import 'package:bubuds/widgets/menu/menu_detail_sheet.dart';
import 'package:bubuds/widgets/menu/menu_grid_item.dart';
import 'package:bubuds/widgets/menu/menu_item.dart';
import 'package:flutter/material.dart';

class MenuNavigationView extends StatelessWidget {
  const MenuNavigationView({super.key});

  List<MenuItem> get menuItems => [
        MenuItem(
          title: 'About',
          icon: Icons.info_outline,
          backgroundColor: const Color(0xFFFCECEC), // Light pink
          subItems: [
            SubMenuItem(title: 'ABOUT BU'),
            SubMenuItem(title: 'Mission & Vision'),
            SubMenuItem(title: 'The Founder'),
            SubMenuItem(title: 'The Board of Trustees'),
            SubMenuItem(title: 'Career'),
          ],
        ),
        MenuItem(
          title: 'Academics',
          icon: Icons.school_outlined,
          backgroundColor: const Color(0xFFFFEDE0), // Light orange
          subItems: [
            SubMenuItem(title: 'Faculty of Science Engineering & Technology'),
            SubMenuItem(title: 'Faculty of Arts Social Science & Law'),
            SubMenuItem(
                title: 'Faculty of Business Administration & Economics'),
          ],
        ),
        MenuItem(
          title: 'Admission',
          icon: Icons.person_add_outlined,
          backgroundColor: const Color(0xFFEEF3FF), // Light blue
          subItems: [
            SubMenuItem(title: 'Academic Calendar'),
            SubMenuItem(title: 'Academic Policy & Tuition Fees'),
            SubMenuItem(title: 'Offered Degrees'),
            SubMenuItem(title: 'Rules & Regulations'),
          ],
        ),
        MenuItem(
          title: 'Administration',
          icon: Icons.admin_panel_settings_outlined,
          backgroundColor: const Color(0xFFE8F7F0), // Light green
          subItems: [
            SubMenuItem(title: 'The Vice-Chancellor'),
            SubMenuItem(title: 'Pro-Vice-Chancellor'),
            SubMenuItem(title: 'Treasurer'),
            SubMenuItem(title: 'Registrar Office'),
            SubMenuItem(title: 'Exam Control Office'),
            SubMenuItem(title: 'Syndicate'),
          ],
        ),
        MenuItem(
          title: 'News & Events',
          icon: Icons.event_note_outlined,
          backgroundColor: const Color(0xFFE8F7F0), // Light green
          subItems: [
            SubMenuItem(title: 'All Events'),
            SubMenuItem(title: 'All News'),
            SubMenuItem(title: 'Campus Life'),
            SubMenuItem(title: 'Photo Gallery'),
            SubMenuItem(title: 'Video Gallery'),
            SubMenuItem(title: 'Media Gallery'),
            SubMenuItem(title: 'Published News Archive'),
            SubMenuItem(title: 'Convocation'),
          ],
        ),
        MenuItem(
          title: 'Certificate',
          icon: Icons.verified_outlined,
          backgroundColor: const Color(0xFFFFF8E7), // Light yellow
          externalLink:
              'https://busmsportal.azurewebsites.net/Public/CertificateValidation.aspx',
        ),
        MenuItem(
          title: 'Portal',
          icon: Icons.login_outlined,
          backgroundColor: const Color(0xFFEEF3FF), // Light blue
          externalLink: 'https://busmsportal.azurewebsites.net/LoginPage.aspx',
        ),
      ];

  void _showMenuDetails(BuildContext context, MenuItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => MenuDetailSheet(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return MenuGridItem(
            item: item,
            onTap: () => _showMenuDetails(context, item),
          );
        },
      ),
    );
  }
}
