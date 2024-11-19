import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/utils/spacing.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:icar/features/splash%20&%20lang%20&%20onBoarding/presentation/cubit/language_cubit.dart'; // Import the LanguageCubit

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              verticalSpace(16),
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(AppImages.splash,
                    semanticsLabel: 'icar logo',
                    width: 100,
                    height: 100,
                    colorFilter: const ColorFilter.mode(
                        CColors.primaryColor, BlendMode.srcIn)),
              ),
              verticalSpace(30),
              const Spacer(),
              // Heading Text
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CColors.lightGray.withOpacity(0.1)),
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
                              // Arabic Language Radio Button with Border
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: state.selectedLanguage == 'ar'
                                          ? CColors.primaryColor
                                          : Colors.transparent),
                                ),
                                child: RadioListTile<String>(
                                 hoverColor: Colors.transparent,  // Disable hover color
  overlayColor: MaterialStateProperty.all(Colors.transparent),  // Remove the splash effect
  splashRadius: 0,
  
                                  
                                  selectedTileColor: Colors.transparent,
                                  value: 'ar',
                                  groupValue: state.selectedLanguage,
                                  // Remove hover effect
                                
                                
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      context
                                          .read<LanguageCubit>()
                                          .selectLanguage(value);
                                    }
                                  },
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Spacer(),
                                      const Text('اللغة العربية'),
                                      const SizedBox(width: 8),
                                      SvgPicture.asset(AppImages.arFlag),
                                    ],
                                  ),
                                  activeColor: CColors.primaryColor,
                                   tileColor: Colors.white,  // Ensure no background color change
  selected: state.selectedLanguage == 'ar',  
                                ),
                              ),
                              // English Language Radio Button with Border
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: state.selectedLanguage == 'en'
                                          ? CColors.primaryColor
                                          : Colors.transparent),
                                ),
                                child: RadioListTile<String>(
                                  overlayColor: const WidgetStatePropertyAll(
                                      CColors.black),
                                  value: 'en',
                                  groupValue: state.selectedLanguage,
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      context
                                          .read<LanguageCubit>()
                                          .selectLanguage(value);
                                    }
                                  },
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Spacer(),
                                      const Text(
                                          'اللغة الإنجليزية ( English )'),
                                      const SizedBox(width: 8),
                                      SvgPicture.asset(AppImages.enFlag),
                                    ],
                                  ),
                                  activeColor: CColors.primaryColor,
                                         tileColor: Colors.white,  // Ensure no background color change
  selected: state.selectedLanguage == 'en',  
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
              AppGesterDedector(onTap: () {}, text: AppKeys.continueText),

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
