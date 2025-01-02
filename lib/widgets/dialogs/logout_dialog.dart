import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';
import '../common/custom_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        'Logout',
        style: AppTypography.h3,
      ),
      content: Text(
        'Are you sure you want to logout?',
        style: AppTypography.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            'Cancel',
            style: AppTypography.bodyMedium.copyWith(color: Colors.grey),
          ),
        ),
        CustomButton(
          text: 'Logout',
          backgroundColor: AppColors.error,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
