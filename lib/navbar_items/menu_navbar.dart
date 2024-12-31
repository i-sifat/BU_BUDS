import 'package:bubuds/models/menu_itam.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class MenuNavigationbarView extends StatelessWidget {
  const MenuNavigationbarView({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  List<MenuItem> get menuItems => [
        MenuItem(
          title: 'About',
          icon: Icons.info_outline,
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
          title: 'Certificate Verification',
          icon: Icons.verified_outlined,
          externalLink:
              'https://busmsportal.azurewebsites.net/Public/CertificateValidation.aspx',
        ),
        MenuItem(
          title: 'Online Portal',
          icon: Icons.login_outlined,
          externalLink: 'https://busmsportal.azurewebsites.net/LoginPage.aspx',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(item.icon, color: Colors.red),
              title: Text(item.title),
              trailing: item.subItems != null
                  ? const Icon(Icons.arrow_forward_ios)
                  : null,
              onTap: () {
                if (item.externalLink != null) {
                  _launchURL(item.externalLink!);
                } else if (item.subItems != null) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SubMenuSheet(
                      title: item.title,
                      subItems: item.subItems!,
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class SubMenuSheet extends StatelessWidget {
  final String title;
  final List<SubMenuItem> subItems;

  const SubMenuSheet({
    super.key,
    required this.title,
    required this.subItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: subItems.length,
              itemBuilder: (context, index) {
                final subItem = subItems[index];
                return ListTile(
                  title: Text(subItem.title),
                  onTap: () {
                    Navigator.pop(context);
                    if (subItem.onTap != null) {
                      subItem.onTap!();
                    }
                    if (subItem.link != null) {
                      launchUrl(Uri.parse(subItem.link!));
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
