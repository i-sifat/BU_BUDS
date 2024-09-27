import 'package:bu_buds/screens/home_screenview.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'screens/onboarding_screen/initial_page.dart';
// Replace with your actual path

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure the status bar remains transparent
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  // Check whether this is the first time opening the app
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  // Update the flag to mark that the app has been opened
  if (isFirstTime) {
    prefs.setBool('isFirstTime', false);
  }

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      // Show InitialPageView if first time, else show HomeScreenView
      home: isFirstTime ? const InitialPageView() : const MyHomeScreenView(),
    );
  }
}
