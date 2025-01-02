import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screenview.dart';
import 'screens/onboarding_screen/initial_page.dart';
import 'utils/theme.dart';

void main() async {
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
  final selectedTopics = List.generate(5, (index) => false);

  if (isFirstTime) {
    await prefs.setBool('isFirstTime', false);
  }

  runApp(MyApp(
    isFirstTime: isFirstTime,
    userName: userName,
    selectedTopics: selectedTopics,
  ));
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
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: isFirstTime
          ? const InitialPageView()
          : MyHomeScreenView(
              userName: userName,
              selectedTopics: selectedTopics,
            ),
    );
  }
}
