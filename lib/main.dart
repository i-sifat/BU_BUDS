import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screenview.dart';
import 'screens/onboarding_screen/initial_page.dart';
import 'utils/theme.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    // Initialize preferences
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;
    final userName = prefs.getString('userName') ?? '';

    // Load selected topics with proper persistence
    final List<bool> selectedTopics = List<bool>.from(
        prefs.getStringList('selectedTopics')?.map((e) => e == 'true') ??
            List.generate(5, (index) => false));

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      // Initialize selectedTopics in storage
      await prefs.setStringList(
          'selectedTopics', List.generate(5, (index) => 'false'));
    }

    // Ensure at least one topic is selected or select the first one by default
    if (!selectedTopics.contains(true)) {
      selectedTopics[0] = true;
      await prefs.setStringList(
          'selectedTopics', selectedTopics.map((e) => e.toString()).toList());
    }

    runApp(MyApp(
      isFirstTime: isFirstTime,
      userName: userName,
      selectedTopics: selectedTopics,
    ));
  } catch (e, stackTrace) {
    debugPrint('Error initializing app: $e\n$stackTrace');
    // Run app in error state
    runApp(const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Failed to initialize app. Please restart.'),
        ),
      ),
    ));
  }
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  final String userName;
  final List<bool> selectedTopics;

  const MyApp({
    super.key,
    required this.isFirstTime,
    required this.userName,
    required this.selectedTopics,
  }) : assert(selectedTopics.length == 5,
            'Selected topics must have exactly 5 items');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 60),
                  const SizedBox(height: 16),
                  Text('An error occurred: ${errorDetails.exception}'),
                ],
              ),
            ),
          );
        };
        return child!;
      },
      home: isFirstTime
          ? const InitialPageView()
          : MyHomeScreenView(
              userName: userName,
              selectedTopics: selectedTopics,
            ),
    );
  }
}
