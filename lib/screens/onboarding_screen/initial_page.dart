import 'package:bu_buds/screens/onboarding_screen/onboarding_page_01.dart';
import 'package:bu_buds/widgets/buttons.dart';
import 'package:flutter/material.dart';

class InitialPageView extends StatefulWidget {
  const InitialPageView({super.key});

  @override
  State<InitialPageView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.red, Colors.transparent]),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/image.png"))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icon.png"),
                const Text("  Bu Buds"),
                const Padding(padding: EdgeInsets.only(top: 150.0))
              ],
            ),
            const SizedBox(
              height: 360,
            ),
            const Text(
              "Hello & \nWelcome Here!",
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Get an overview of how you are performing & \nmotivate yourself to achieve even moew.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AppButton(
              text: "Let's Start",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingPageView()));
              },
              height: 45,
              width: 150,
            )
          ],
        ),
      ),
    );
  }
}
