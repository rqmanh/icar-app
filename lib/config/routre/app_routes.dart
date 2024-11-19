import 'package:go_router/go_router.dart';
import 'package:icar/features/splash%20&%20lang%20&%20onBoarding/presentation/screens/language_screen.dart';
import 'package:icar/features/splash%20&%20lang%20&%20onBoarding/presentation/screens/onboarding_screen.dart';
import 'package:icar/features/splash%20&%20lang%20&%20onBoarding/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String langScreen = '/lang';
  static const String onBoardingScreen = '/onboarding';
  static const String signinScreen = '/sign-in';
  static const String signupScreen = '/sign-up';
  static const String otpScreen = '/otp-screen';
  static const String signupDetailsScreen = '/signup-details';
  static const String dashboardScreen = '/dashboard';
  static const String mapScreen = '/map-screen';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  routes: [
    // Splash screen route
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.langScreen,
      builder: (context, state) => const LanguageScreen(),
    ),
    GoRoute(
      path: AppRoutes.onBoardingScreen,
      builder: (context, state) => const OnboardingScreen(),
    )
  ],
);
