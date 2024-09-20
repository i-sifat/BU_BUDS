import 'package:flutter/material.dart';

import '../home_screenview.dart';

class CompletionProcessScreen extends StatefulWidget {
  const CompletionProcessScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CompletionProcessScreenState createState() =>
      _CompletionProcessScreenState();
}

class _CompletionProcessScreenState extends State<CompletionProcessScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
            builder: (context) =>
                const MyHomeScreenView()), // Replace with your home screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/complition.png', // Replace with actual image path
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 30),
            const Text(
              'Completion Process...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
