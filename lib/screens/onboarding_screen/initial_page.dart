import 'package:bu_buds/screens/onboarding_screen/onboarding_page_01.dart';
import 'package:bu_buds/widgets/buttons.dart';
import 'package:flutter/material.dart';

class InitialPageView extends StatefulWidget {
  const InitialPageView({super.key});

  @override
  _InitialViewState createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialPageView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _textOffsetAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Initialize the animations before the build method tries to use them
    _scaleAnimation = Tween<double>(begin: 2.0, end: 1.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _textOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _textOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _buttonScaleAnimation = Tween<double>(begin: 1.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    // Start the animation after initializing everything
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.red, Colors.transparent],
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/image.png"),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100), // Add some padding on top
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(
                    "assets/icon.png",
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: const Text(
                    "Bu Buds",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 360),
            SlideTransition(
              position: _textOffsetAnimation,
              child: FadeTransition(
                opacity: _textOpacityAnimation,
                child: const Text(
                  "Hello & \nWelcome Here!",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    height: 1.2, // Line spacing
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SlideTransition(
              position: _textOffsetAnimation,
              child: FadeTransition(
                opacity: _textOpacityAnimation,
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Get an overview of how you are performing & \nmotivate yourself to achieve even more.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                      height: 1.5, // Line spacing for this text
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ScaleTransition(
              scale: _buttonScaleAnimation,
              child: AppButton(
                text: "Let's Start",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingPageView()),
                  );
                },
                height: 50, // Increase the height
                width: 180, // Increase the width
              ),
            ),
          ],
        ),
      ),
    );
  }
}
