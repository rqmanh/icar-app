import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icar/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/lang', // Path to translation files
      fallbackLocale: const Locale('en'), // Default language
      child: const MyApp()));
}
