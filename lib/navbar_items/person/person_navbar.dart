import 'package:bubuds/navbar_items/person/about_screen.dart';
import 'package:bubuds/navbar_items/person/profile_screen.dart';
import 'package:bubuds/utils/colors.dart';
import 'package:bubuds/utils/typography.dart';
import 'package:flutter/material.dart';

class PersonScreenView extends StatelessWidget {
  PersonScreenView({super.key});

  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Profile',
      'icon': Icons.person_outline,
      'route': const ProfileScreen(),
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          "Study",
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
            // Profile Section
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
                          "Marvin McKinney",
                          style: AppTypography.h3,
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      color: AppColors.grey, size: 20),
                ],
              ),
            ),
            const Divider(height: 1),

            // Menu Items
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
                          color: AppColors.secondary, size: 24),
                    ),
                    title: Text(
                      item['title'],
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: AppColors.grey, size: 18),
                    onTap: () {
                      if (item['route'] != null) {
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

            // Help Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.headset_mic,
                        color: AppColors.white, size: 30),
                    const SizedBox(width: 16),
                    Text(
                      "How can we help you?",
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Privacy Policy",
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.greyDark,
                    ),
                  ),
                  Text(
                    "Terms",
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.greyDark,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "English",
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.greyDark,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down,
                          color: AppColors.grey, size: 20),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
