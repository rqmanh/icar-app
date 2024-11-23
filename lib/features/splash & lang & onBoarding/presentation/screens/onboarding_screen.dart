import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/utils/shared_pref_helper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: AppKeys.onboardingTitle1,
      body: AppKeys.onboardingBody1,
      image: AppImages.onboardingOne,
      backgroundColor: const Color(0xFFFFE0CC), // Orange
    ),
    OnboardingPage(
      title: AppKeys.onboardingTitle2,
      body: AppKeys.onboardingBody2,
      image: AppImages.onboardingTwo,
      backgroundColor: const Color(0xFFCCE7FF), // Blue
    ),
    OnboardingPage(
      title: AppKeys.onboardingTitle3,
      body: AppKeys.onboardingBody3,
      image: AppImages.onboardingThree,
      backgroundColor: const Color(0xFFFFCCCF), // Pink
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for onboarding pages
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              final page = _pages[index];
              return Container(
                color: page.backgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    SvgPicture.asset(
                      page.image, // Replace with your asset loading logic
                      height: 440,
                      width: 300,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      page.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      page.body,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
          // Dots and navigation buttons
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip button
                if (_currentIndex < _pages.length - 1)
                  TextButton(
                    onPressed: () {
                      context.go(AppRoutes.signinScreen);
                      PrefHelper.instance.setBool('seenOnboarding', true);
                    },
                    child: Text(AppKeys.skip,
                        style: CTextStyles.font15DarkMedium
                            .copyWith(color: CColors.secondaryTextColor)),
                  ),
                if (_currentIndex == _pages.length - 1)
                  const SizedBox(width: 64), 
                // Page indicator dots
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 10,
                      width: _currentIndex == index ? 22 : 10,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                // Next/Done button
                TextButton(
                  onPressed: () {
                    if (_currentIndex < _pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      context.go(AppRoutes.signinScreen);
                      PrefHelper.instance.setBool('seenOnboarding', true);
                    }
                  },
                  child: Text(
                      _currentIndex == _pages.length - 1
                          ? AppKeys.startNow
                          : AppKeys.next,
                      style: CTextStyles.font16WhiteSemiBold
                          .copyWith(color: CColors.primaryColor)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String body;
  final String image;
  final Color backgroundColor;

  OnboardingPage({
    required this.title,
    required this.body,
    required this.image,
    required this.backgroundColor,
  });
}
