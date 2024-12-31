import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/typography.dart';

class CustomListViewItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final ImageProvider image;

  const CustomListViewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: image,
      ),
      title: Text(
        title,
        style: AppTypography.bodyLarge.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTypography.bodyMedium.copyWith(
          color: AppColors.grey,
        ),
      ),
    );
  }
}
