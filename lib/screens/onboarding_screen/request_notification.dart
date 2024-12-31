import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'completetion_screen.dart';

class NotificationPromptScreen extends StatelessWidget {
  const NotificationPromptScreen({super.key});

  Future<void> _requestNotificationPermission(BuildContext context) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap
      },
    );

    // Request permission
    final bool? granted = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    if (granted != null && granted) {
      // Show a test notification
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'bu_buds_channel',
        'BU BUDS Notifications',
        channelDescription: 'Notifications from BU BUDS app',
        importance: Importance.max,
        priority: Priority.high,
      );
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await flutterLocalNotificationsPlugin.show(
        0,
        'Notifications Enabled',
        'You will now receive important updates from BU BUDS',
        platformChannelSpecifics,
      );
    }

    // Navigate to completion screen regardless of permission status
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CompletionProcessScreen(),
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Give me notifications',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Stay updated with important announcements and events',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/notification.png',
              height: 250,
              width: 250,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () => _requestNotificationPermission(context),
                child: const Text(
                  'Turn On Notifications',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CompletionProcessScreen(),
                  ),
                );
              },
              child: const Text(
                'Remind me later',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

extension on AndroidFlutterLocalNotificationsPlugin? {
  requestPermission() {}
}
