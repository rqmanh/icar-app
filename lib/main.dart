import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icar/app.dart';
import 'package:icar/features/splash%20&%20lang%20&%20onBoarding/presentation/cubit/language_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
