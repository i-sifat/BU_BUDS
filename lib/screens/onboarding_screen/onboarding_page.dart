import 'package:flutter/material.dart';
import '../../widgets/onboarding/onboarding_page.dart';
import '../../widgets/onboarding/page_indicator.dart';
import '../../widgets/onboarding/navigation_button.dart';
import '../signup_page.dart';
import '../../utils/constants.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  final List<Map<String, String>> pages = [
    {
      'image': 'assets/onboarding01.png',
      'title': 'Seamless Course Access',
      'description':
          'Easily access your courses, lectures, and study materials anytime, anywhere.',
    },
    {
      'image': 'assets/onboarding02.png',
      'title': 'Stay Updated',
      'description':
          'Receive real-time updates on announcements, exams, and events directly through the app.',
    },
    {
      'image': 'assets/onboarding03.png',
      'title': 'Connect with Peers',
      'description':
          'Engage with classmates and faculty through forums, discussions, and collaborations.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) => setState(() => currentIndex = value),
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final page = pages[index];
                return OnboardingPage(
                  image: page['image']!,
                  title: page['title']!,
                  description: page['description']!,
                );
              },
            ),
          ),
          PageIndicator(
            currentIndex: currentIndex,
            pageCount: pages.length,
          ),
          OnboardingNavigationButton(
            text: currentIndex == pages.length - 1 ? 'Get Started' : 'Continue',
            onPressed: () {
              if (currentIndex < pages.length - 1) {
                _pageController.nextPage(
                  duration: AppConstants.pageTransitionDuration,
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpDetails()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
