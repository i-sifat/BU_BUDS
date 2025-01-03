import 'package:bubuds/navbar_items/person/about_screen.dart';
import 'package:bubuds/navbar_items/person/profile_screen.dart';
import 'package:bubuds/utils/colors.dart';
import 'package:bubuds/utils/typography.dart';
import 'package:bubuds/widgets/dialogs/logout_dialog.dart';
import 'package:bubuds/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonScreenView extends StatelessWidget {
  final String userName;

  PersonScreenView({
    super.key,
    required this.userName,
  });

  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Profile',
      'icon': Icons.person_outline,
      'route': null, // Will be set in build
    },
    {
      'title': 'Account',
      'icon': Icons.account_balance_wallet_outlined,
      'route': null,
    },
    {
      'title': 'Setting',
      'icon': Icons.settings_outlined,
      'route': null,
    },
    {
      'title': 'About',
      'icon': Icons.info_outline,
      'route': const AboutScreen(),
    },
    {
      'title': 'Logout',
      'icon': Icons.logout,
      'textColor': AppColors.error,
      'route': null,
      'isLogout': true,
    },
  ];

  Future<void> _handleLogout(BuildContext context) async {
    final bool? shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => const LogoutDialog(),
    );

    if (shouldLogout == true && context.mounted) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // Clear all stored data

      // Navigate to signup page and remove all previous routes
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SignUpDetails()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Update Profile route with userName
    menuItems[0]['route'] = ProfileScreen(userName: userName);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          "Bu Buds",
          style: AppTypography.h3.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: const Icon(Icons.circle, color: AppColors.primary, size: 30),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.white,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/addphoto.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                        Text(
                          userName,
                          style: AppTypography.h3,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios,
                      color: AppColors.grey, size: 20),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.separated(
                itemCount: menuItems.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          AppColors.secondaryLight.withOpacity(0.2),
                      child: Icon(item['icon'],
                          color: item['textColor'] ?? AppColors.secondary,
                          size: 24),
                    ),
                    title: Text(
                      item['title'],
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.w500,
                        color: item['textColor'],
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: AppColors.grey, size: 18),
                    onTap: () {
                      if (item['isLogout'] == true) {
                        _handleLogout(context);
                      } else if (item['route'] != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => item['route'],
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
