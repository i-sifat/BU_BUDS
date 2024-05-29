import 'package:bu_buds/widgets/buttons.dart';
import 'package:flutter/material.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

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
              "Hello and \nWelcome here!",
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
            const Text(
              "Get an overview of how you are performing and motivate yourself to achieve even moew.",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 30,
            ),
            AppButton(
              text: "Let's Start",
              onPressed: () {},
              height: 45,
              width: 150,
            )
          ],
        ),
      ),
    );
  }
}
