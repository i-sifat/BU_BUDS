import 'package:flutter/material.dart';
import 'package:bu_buds/screens/signup_page.dart';
import 'package:bu_buds/widgets/color.dart';
import 'package:bu_buds/widgets/onboarding_data.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  // The onboarding data, which holds the pages' content (like images and text)
  final controller = OnboardingData();

  // To keep track of the current page the user is on
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold is the basic structure that gives a screen its layout
      body: Column(
        children: [
          // Expanded widget makes the PageView take up all the remaining space
          Expanded(
            child: PageView.builder(
              // Updates the currentIndex when the user changes the page
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              // Tells how many pages there are in total (based on items)
              itemCount: controller.items.length,
              // Builds each page of the PageView
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align everything at the top
                  children: [
                    // This is the image part
                    SizedBox(
                      // Full width of the screen for the image container
                      width: MediaQuery.of(context).size.width,
                      // Take up 50% of the screen height for the image container
                      height: MediaQuery.of(context).size.height * 0.601,
                      // The actual image loaded from the assets folder
                      child: Image.asset(
                        controller.items[currentIndex].image,
                        // BoxFit.cover makes the image fill the space while maintaining its aspect ratio
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(
                        height:
                            15), // Adds some space between the image and text

                    // This is the title text below the image
                    Text(
                      controller.items[currentIndex].title,
                      style: const TextStyle(
                        fontSize: 25,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    // This is the description text below the title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        controller.items[currentIndex].description,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Dots indicator at the bottom to show which page is active
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.items.length,
              (index) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: currentIndex == index ? primaryColor : Colors.grey,
                ),
                height: 7,
                width: currentIndex == index ? 30 : 7,
                duration: const Duration(milliseconds: 700),
              ),
            ),
          ),

          // Button at the bottom to continue or get started
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: primaryColor,
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  // If not on the last page, move to the next page
                  if (currentIndex != controller.items.length - 1) {
                    currentIndex++;
                  } else {
                    // If on the last page, navigate to the SignUpDetails screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpDetails(),
                      ),
                    );
                  }
                });
              },
              // If on the last page, show "Get Started" otherwise show "Continue"
              child: Text(
                currentIndex == controller.items.length - 1
                    ? "Get started"
                    : "Continue",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
