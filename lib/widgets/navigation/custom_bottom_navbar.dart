import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: AppTypography.caption.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppTypography.caption,
      items: [
        _buildNavItem('assets/navbar_icons/dashboard.png', 'Dashboard'),
        _buildNavItem('assets/navbar_icons/schedule.png', 'Schedule'),
        _buildNavItem('assets/navbar_icons/menu.png', 'Menu'),
        _buildNavItem('assets/navbar_icons/profile.png', 'Profile'),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(String iconPath, String label) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        width: 24,
        height: 24,
        // Removing color tint since we're using pre-colored PNG images
      ),
      activeIcon: Image.asset(
        iconPath,
        width: 24,
        height: 24,
        // Removing color tint since we're using pre-colored PNG images
      ),
      label: label,
    );
  }
}
