import 'package:flutter/material.dart';
import 'package:bubuds/services/notifications_service.dart';
import 'package:bubuds/screens/onboarding_screen/completetion_screen.dart';

class NotificationPromptScreen extends StatelessWidget {
  final String userName;
  final List<bool> selectedTopics;

  const NotificationPromptScreen({
    super.key,
    required this.userName,
    required this.selectedTopics,
  });

  Future<void> _handleNotificationPermission(BuildContext context) async {
    final granted = await NotificationsService.requestPermission();

    // Navigate to completion screen regardless of permission status
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CompletionProcessScreen(
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Stay Connected',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Enable notifications to stay updated with important announcements and events',
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
                onPressed: () => _handleNotificationPermission(context),
                child: const Text(
                  'Turn On Notifications',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CompletionProcessScreen(
                    userName: userName,
                    selectedTopics: selectedTopics,
                  ),
                ),
              ),
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
