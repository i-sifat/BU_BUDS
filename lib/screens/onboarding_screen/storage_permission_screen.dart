import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bubuds/screens/onboarding_screen/request_notification.dart';
import 'package:bubuds/widgets/dialogs/permission_dialog.dart';

class StoragePermissionScreen extends StatelessWidget {
  final String userName;
  final List<bool> selectedTopics;

  const StoragePermissionScreen({
    super.key,
    required this.userName,
    required this.selectedTopics,
  });

  Future<void> _handleStoragePermission(BuildContext context) async {
    try {
      // First show our custom dialog
      final shouldProceed = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const PermissionDialog(
          title: 'Storage Permission Required',
          message:
              'We need permission to access your device storage to save files and images. This is required for saving routines and documents.',
        ),
      );

      if (shouldProceed != true) {
        // If user denies in our custom dialog, still proceed to next screen
        if (!context.mounted) return;
        _navigateToNextScreen(context);
        return;
      }

      // Request actual system permission
      final status = await Permission.storage.request();

      if (!context.mounted) return;

      if (status.isPermanentlyDenied) {
        // Show dialog to open settings if permission is permanently denied
        if (!context.mounted) return;
        final openSettings = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Permission Required'),
            content: const Text(
              'Storage permission is required for saving files. Please enable it in settings.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Open Settings'),
              ),
            ],
          ),
        );

        if (openSettings == true) {
          await openAppSettings();
        }
      }

      // Navigate to next screen regardless of permission status
      if (!context.mounted) return;
      _navigateToNextScreen(context);
    } catch (e) {
      debugPrint('Error requesting storage permission: $e');
      if (!context.mounted) return;
      _navigateToNextScreen(context);
    }
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationPromptScreen(
          userName: userName,
          selectedTopics: selectedTopics,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Storage Access',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'We need permission to access your device storage to save files and images',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Image.asset(
              'assets/notification.png',
              height: 200,
              fit: BoxFit.contain,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _handleStoragePermission(context),
                child: const Text(
                  'Grant Storage Permission',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => _navigateToNextScreen(context),
              child: const Text(
                'Maybe Later',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
