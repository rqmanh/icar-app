import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icar/app.dart';
import 'package:icar/core/di/injection.dart';
import 'package:icar/features/splash%20&%20lang%20&%20onBoarding/presentation/cubit/language_cubit.dart';
import 'package:icar/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
configureDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LanguageCubit()),
    ],
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/lang', // Path to translation files
        fallbackLocale: const Locale('ar'), // Default language
        child: const MyApp()),
  ));
}
