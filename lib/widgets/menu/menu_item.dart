import 'package:flutter/material.dart';
import '../../screens/tuition/tuition_fee_screen.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final List<SubMenuItem>? subItems;
  final String? externalLink;

  MenuItem({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    this.subItems,
    this.externalLink,
  });
}

class SubMenuItem {
  final String title;
  final String? link;
  final VoidCallback? onTap;

  SubMenuItem({
    required this.title,
    this.link,
    this.onTap,
  });

  static SubMenuItem tuitionFees(BuildContext context) {
    return SubMenuItem(
      title: 'Tuition Fees',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TuitionFeeScreen()),
        );
      },
    );
  }
}
