import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';
import '../../widgets/common/app_bar.dart';
import '../../widgets/dialogs/logout_dialog.dart';
import '../../screens/signup_page.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;

  const ProfileScreen({
    super.key,
    required this.userName,
  });

  Future<void> _showLogoutDialog(BuildContext context) async {
    final bool? shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => const LogoutDialog(),
    );

    if (shouldLogout == true && context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SignUpDetails()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const Divider(height: 1),
            _buildProfileMenu(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
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
                  userName,
                  style: AppTypography.h3,
                ),
                Text(
                  'Student',
                  style: AppTypography.bodyMedium.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 20),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenu(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
          icon: Icons.person_outline,
          title: 'Personal Information',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.notifications_outlined,
          title: 'Notifications',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.security_outlined,
          title: 'Security',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.help_outline,
          title: 'Help Center',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.logout,
          title: 'Logout',
          textColor: AppColors.error,
          onTap: () => _showLogoutDialog(context),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Colors.black),
      title: Text(
        title,
        style: AppTypography.bodyLarge.copyWith(color: textColor),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
      onTap: onTap,
    );
  }
}
