import 'package:flutter/material.dart';
import '../home_screenview.dart';

class CompletionProcessScreen extends StatefulWidget {
  final String userName;
  final List<bool> selectedTopics;

  const CompletionProcessScreen({
    super.key,
    required this.userName,
    required this.selectedTopics,
  });

  @override
  State<CompletionProcessScreen> createState() =>
      _CompletionProcessScreenState();
}

class _CompletionProcessScreenState extends State<CompletionProcessScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomeScreenView(
              userName: widget.userName,
              selectedTopics: widget.selectedTopics,
            ),
          ),
          (Route<dynamic> route) => false,
        );
      }
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
              'assets/complition.png',
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
