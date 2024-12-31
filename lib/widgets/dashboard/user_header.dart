import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';

class UserHeader extends StatelessWidget {
  final String name;
  final String subtitle;
  final VoidCallback onNotificationTap;

  const UserHeader({
    super.key,
    required this.name,
    required this.subtitle,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $name',
              style: AppTypography.h2,
            ),
            Text(
              subtitle,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.grey),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined, size: 28),
          onPressed: onNotificationTap,
        ),
      ],
    );
  }
}
