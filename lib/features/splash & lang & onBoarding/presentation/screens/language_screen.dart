import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/utils/extensions/date_time_extension.dart';
import 'package:icar/core/utils/shared_pref_helper.dart';
import 'package:icar/core/utils/spacing.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:icar/features/splash%20&%20lang%20&%20onBoarding/presentation/cubit/language_cubit.dart'; // Import the LanguageCubit

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.scafBackgroundColorDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              verticalSpace(26),
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(AppImages.splash,
                    semanticsLabel: 'icar logo',
                    width: 100,
                    height: 100,
                    colorFilter: const ColorFilter.mode(
                        CColors.primaryColor, BlendMode.srcIn)),
              ),
              // verticalSpace(10),
              const Spacer(),
              // Heading Text
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CColors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('قم باختيار لغتك المفضلة',
                        style: CTextStyles.font14DarkMedium),
                    Text(
                      'Choose Your Default Language',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    verticalSpace(30),

                    // Language Selection Radio Buttons
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<LanguageCubit, LanguageState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              // Arabic Language Radio Button
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<LanguageCubit>()
                                      .selectLanguage('ar');
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: state.selectedLanguage == 'ar'
                                          ? CColors.primaryColor
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Radio<String>(
                                        value: 'ar',
                                        groupValue: state.selectedLanguage,
                                        onChanged: (String? value) {},
                                        activeColor: CColors.primaryColor,
                                      ),
                                      const Spacer(),
                                      const Text('اللغة العربية'),
                                      const SizedBox(width: 8),
                                      SvgPicture.asset(AppImages.arFlag),
                                    ],
                                  ),
                                ),
                              ),
                              // English Language Radio Button
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<LanguageCubit>()
                                      .selectLanguage('en');
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: state.selectedLanguage == 'en'
                                          ? CColors.primaryColor
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Radio<String>(
                                        value: 'en',
                                        groupValue: state.selectedLanguage,
                                        onChanged: (String? value) {},
                                        activeColor: CColors.primaryColor,
                                      ),
                                      const Spacer(),
                                      const Text(
                                          'اللغة الإنجليزية ( English )'),
                                      const SizedBox(width: 8),
                                      SvgPicture.asset(AppImages.enFlag),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Continue Button
              verticalSpace(100),
              AppGesterDedector(
                  onTap: () {
                    PrefHelper.instance.setLangCode(
                        context.read<LanguageCubit>().state.selectedLanguage);
                    PrefHelper.instance.setLagChoosed();
                    context.setLocale(Locale(
                        context.read<LanguageCubit>().state.selectedLanguage));
                    log('selected lang is ====> ${context.read<LanguageCubit>().state.selectedLanguage}');
                    context.go(AppRoutes.onBoardingScreen);
                  },
                  text: AppKeys.continueText),

              const Spacer(),
              // Footer Note Text
              Text(
                'يمكنك تغيير اللغة لاحقًا من الإعدادات\nYou Can Change The Language Later in the Settings',
                textAlign: TextAlign.center,
                style: CTextStyles.font14GrayRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
