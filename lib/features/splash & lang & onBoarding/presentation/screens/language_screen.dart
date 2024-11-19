import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/theme/app_text_styles.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    String selectedLanguage = 'ar';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(AppImages.splash,
                    semanticsLabel: 'icar logo',
                    width: 100,
                    height: 100,
                    colorFilter: const ColorFilter.mode(
                        CColors.primaryColor, BlendMode.srcIn)),
              ),
              const SizedBox(height: 30),

              // Heading Text
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CColors.lightGray.withOpacity(0.1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Text(
                      'قم باختيار لغتك المفضلة',
                      textAlign: TextAlign.center,
                      style: CTextStyles.font14DarkMedium
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Choose Your Default Language',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Language Selection Radio Buttons
                    Column(
                      children: [
                        RadioListTile<String>(
                          value: 'ar',
                          groupValue: selectedLanguage,
                          onChanged: (String? value) {
                            setState(() {
                              selectedLanguage = value!;
                            });
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(),
                              const Text('اللغة العربية'),
                              const SizedBox(width: 8),
                              SvgPicture.asset(AppImages.arFlag),
                            ],
                          ),
                          activeColor: CColors.primaryColor
                        ),
                        RadioListTile<String>(
                          value: 'en',
                          groupValue: selectedLanguage,
                          onChanged: (String? value) {
                            setState(() {
                              selectedLanguage = value!;
                            });
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(),
                              const Text('اللغة الإنجليزية ( English )'),
                              const SizedBox(width: 8),
                              SvgPicture.asset(AppImages.enFlag),
                            ],
                          ),
                          activeColor: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Continue Button
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Action for continue button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'متابعة', // Arabic text for "Continue"
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Footer Note Text
              Text(
                'يمكنك تغيير اللغة لاحقًا من الإعدادات\nYou Can Change The Language Later in the Settings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
