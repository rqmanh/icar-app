
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/core/utils/shared_pref_helper.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay navigation to give splash screen effect
    Future.delayed(const Duration(seconds: 2), _checkUserStatus);
  }

  void _checkUserStatus() {

    // Get the language preference
    final hasChoosedLanguage = PrefHelper.instance.getLagChoosed();

    if (!hasChoosedLanguage) {
      // Navigate to language selection if language is not set
      context.go(AppRoutes.langScreen);
      return;
    }

    // Check if onboarding was completed
    final hasSeenOnboarding = PrefHelper.instance.getBool('seenOnboarding');

    if (hasSeenOnboarding) {
      // Navigate to the dashboard
      context.go(AppRoutes.dashboardScreen);
    } else {
      // Navigate to the onboarding screen
      context.go(AppRoutes.onBoardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.primaryColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            opacity: 1.0,
            child: SvgPicture.asset(
              AppImages.splash,
              semanticsLabel: 'icar logo',
              height: 150,
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}
