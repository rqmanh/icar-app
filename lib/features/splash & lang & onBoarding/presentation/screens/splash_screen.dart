
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

    Future.delayed(const Duration(seconds: 2), () {
      _checkUserStatus();
    });
  }

  void _checkUserStatus() {
    // Check if the language is set
    final language = PrefHelper.instance.getBool('setLang');

    if (!language) {
      // Language not set, navigate to language selection screen
      context.go(AppRoutes.langScreen);
    } else {
      // Language is set, check onboarding
      final hasSeenOnboarding = PrefHelper.instance.getBool('seenOnboarding');
      if (hasSeenOnboarding) {
        // Onboarding seen, navigate to home screen
        context.go(AppRoutes.dashboardScreen);
      } else {
        // Onboarding not seen, navigate to onboarding screen
        context.go(AppRoutes.onBoardingScreen);
      }
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
            height: 200,
            width: 200,
          ),
        )),
      ),
    );
  }
}
