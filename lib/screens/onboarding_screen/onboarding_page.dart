import 'package:bubuds/screens/auth/signin_page.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/typography.dart';
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
      'title': 'Track Your Attendance',
      'description':
          'Easily check your attendance and stay on top of your progress.',
    },
    {
      'image': 'assets/onboarding02.png',
      'title': 'View Your Schedule',
      'description':
          'Access your class timetable anytime and plan your day effectively.',
    },
    {
      'image': 'assets/onboarding03.png',
      'title': 'Stay Updated',
      'description':
          'Get instant updates on assignments, exams, and university announcements.',
    },
  ];

  void _onNextPressed() {
    if (currentIndex < pages.length - 1) {
      _pageController.nextPage(
        duration: AppConstants.pageTransitionDuration,
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) => setState(() => currentIndex = value),
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(page['image']!),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                AppColors.primary.withOpacity(0.1),
                                BlendMode.overlay,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Text(
                              page['title']!,
                              style: AppTypography.h2.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              page['description']!,
                              style: AppTypography.bodyMedium.copyWith(
                                color: Colors.black54,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => Container(
                        width: currentIndex == index ? 24 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: currentIndex == index
                              ? AppColors.primary
                              : Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _onNextPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        currentIndex == pages.length - 1
                            ? 'Sign In'
                            : 'Continue',
                        style: AppTypography.buttonLarge,
                      ),
                    ),
                  ),
                  if (currentIndex < pages.length - 1) ...[
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: AppTypography.bodyMedium.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ] else ...[
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                        );
                      },
                      child: Text(
                        'Login as Guest',
                        style: AppTypography.bodyMedium.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
