import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/core/di/injection.dart';
import 'package:icar/features/auth/presentation/cubit/otp_cubit.dart';
import 'package:icar/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:icar/features/auth/presentation/screens/otp_screen.dart';
import 'package:icar/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:icar/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:icar/features/cars/presentation/cubit/add_new_car_cubit.dart';
import 'package:icar/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:icar/features/cars/presentation/screens/add_new_car_screen.dart';
import 'package:icar/features/cars/presentation/screens/user_cars_screen.dart';
import 'package:icar/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:icar/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:icar/features/services/presentation/cubit/services_cubit.dart';
import 'package:icar/features/services/presentation/screens/add_service_details_screen.dart';
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
  static const String addServiceDetails = '/add-service_details';
  static const String userCarsScreen ='/user-cars';
  static const String addNewCarScreen ='/add-new-car';
  static const String successAddNewCarScreen ='/success-add-new-car';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.dashboardScreen,
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
    ),
    GoRoute(
      path: AppRoutes.dashboardScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => DashboardCubit(),
        child: const DashboardScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.signinScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => SignInCubit(),
        child: const SignInScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.signupScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => SignInCubit(),
        child: const SignupScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.otpScreen,
      builder: (context, state) {
        final phoneNumber = state.pathParameters['phoneNumber'] ?? '';

        return BlocProvider(
          create: (context) => getIt<OtpCubit>(),
          child: OtpScreen(phoneNumber: phoneNumber),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.addServiceDetails,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => ServicesCubit()..fetchCars(),
          child:  const AddServiceDetailsScreen(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.userCarsScreen,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => CarsCubit()..fetchCars(),
          child:  const UserCarsScreen(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.addNewCarScreen,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => AddNewCarCubit(),
          child:  const AddNewCarScreen(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.successAddNewCarScreen,
      builder: (context, state) {
        return const SuccessAddNewCarScreen();
      },
    ),
  ],
);
