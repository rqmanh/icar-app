import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IntroductionScreen(
//         globalBackgroundColor: CColors.scafBackgroundColorDark,
//         // globalFooter: AppGesterDedector(onTap: (){}, text: 'Start'),
//         pages: [
//           // Page 1
//           PageViewModel(
//             title: "مرحباً بك في تطبيق I Car",
//             body:
//                 "تطبيقك الذي يدير ويصون سياراتك بأفضل طريقة. مع I Car، ستتلقى تنبيهات وتذكيرات مخصصة وتقارير شاملة لكل ما تحتاج لمعرفته عن صيانة سيارتك.",
//             image: Center(
//               child: SvgPicture.asset(
//                 AppImages.onboardingOne,
//                 height: 400,
           
//               ),
//             ),
//             // footer: Column(
//             //   children: [
//             //     const Spacer(),
//             //     Padding(
//             //       padding: const EdgeInsets.all(8.0),
//             //       child: AppGesterDedector(onTap: (){}, text: 'Start'),
//             //     ),
//             //   ],
//             // )
//             // decoration: getPageDecoration(Colors.orange.shade200),
//           ),
//           // Page 2
//           PageViewModel(
//             title: "لا تفوت موعداً لصيانة سيارتك",
//             body:
//                 "يتيح لك I Car ضبط التنبيهات لمواعيد الخدمات المهمة، مثل تغيير الزيت، واستبدال الإطارات. ابق على اطلاع دائم على حالة سيارتك.",
//             image: Center(
//               child: SvgPicture.asset(
//                 AppImages.onboardingTwo,
//                 height: 400,
//               ),
//             ),
//             // decoration: getPageDecoration(Colors.blue.shade200),
//           ),
//           // Page 3
//           PageViewModel(
//             title: "احصل على تقارير تفصيلية",
//             body:
//                 "يمكنك استعراض تاريخ الصيانة والتحديثات التي تمت على سيارتك في أي وقت، بتفاصيل التقارير المفصلة التي نوفرها. تابع التغييرات بسهولة.",
//             image: Center(
//               child: SvgPicture.asset(
//                 AppImages.onboardingThree,
//                 height: 400,
//               ),
//             ),
//             // decoration: getPageDecoration(Colors.red.shade200),
//           ),
//         ],
//         onDone: () {
//           context.go(AppRoutes.loginScreen); // Navigate to login screen
//         },
//         onSkip: () {
//           context.go(AppRoutes.loginScreen); // Skip to login screen
//         },
        
//         // showSkipButton: false,
//         // showBackButton: false,
//         // showBottomPart: false,
        
//         // showNextButton: false,
//         // showDoneButton: false,
//         skip: const Text(
//           'تخطي',
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         next:const Text(
//           'التالي',
//           style: TextStyle(fontWeight: FontWeight.bold, color: CColors.primaryColor),
//         ),
//         done: const Text(
//           'ابدأ الآن',
//           style: TextStyle(fontWeight: FontWeight.bold, color: CColors.primaryColor),
//         ),
//         dotsDecorator: getDotsDecorator(),
//       ),
//     );
//   }

//   PageDecoration getPageDecoration(Color backgroundColor) {
//     return PageDecoration(
//       titleTextStyle: const TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//       ),
//       bodyTextStyle: const TextStyle(
//         fontSize: 16,
//         height: 1.5,
//       ),
//       imagePadding: const EdgeInsets.only(top: 24),
//       pageColor: backgroundColor,
//       contentMargin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//     );
//   }

//   DotsDecorator getDotsDecorator() {
//     return DotsDecorator(
//       size: const Size(10, 10),
//       color: Colors.grey,
//       activeSize: const Size(22, 10),
//       activeShape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//       ),
//       activeColor: CColors.primaryColor
//     );
//   }
// }

import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: "مرحباً بك في تطبيق iCar",
      body:
          "تطبيقك الذي يدير ويصون سياراتك بأفضل طريقة. مع iCar، ستتلقى تنبيهات وتذكيرات مخصصة وتقارير شاملة لكل ما تحتاج لمعرفته عن صيانة سيارتك.",
      image: "assets/images/onboarding_one.svg",
      backgroundColor: const Color(0xFFFFE0CC), // Orange
    ),
    OnboardingPage(
      title: "لا تفوت موعداً لصيانة سيارتك",
      body:
          "يتيح لك I Car ضبط التنبيهات لمواعيد الخدمات المهمة، مثل تغيير الزيت، واستبدال الإطارات. ابق على اطلاع دائم على حالة سيارتك.",
      image: "assets/images/onboarding_two.svg",
      backgroundColor: const Color(0xFFCCE7FF), // Blue
    ),
    OnboardingPage(
      title: "احصل على تقارير تفصيلية",
      body:
          "يمكنك استعراض تاريخ الصيانة والتحديثات التي تمت على سيارتك في أي وقت، بتفاصيل التقارير المفصلة التي نوفرها. تابع التغييرات بسهولة.",
      image: "assets/images/onboarding_three.svg",
      backgroundColor: const Color(0xFFFFCCCF), // Pink
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for onboarding pages
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              final page = _pages[index];
              return Container(
                color: page.backgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    SvgPicture.asset(
                      page.image, // Replace with your asset loading logic
                      height: 440,
                      width: 300,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      page.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      page.body,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
          // Dots and navigation buttons
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip button
                if (_currentIndex < _pages.length - 1)
                  TextButton(
                    onPressed: () {
                              context.go(AppRoutes.loginScreen);
                    },
                    child: const Text(
                      'تخطي',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                if (_currentIndex == _pages.length - 1)
                  const SizedBox(width: 64), // Empty space for alignment
                // Page indicator dots
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 10,
                      width: _currentIndex == index ? 22 : 10,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                // Next/Done button
                TextButton(
                  onPressed: () {
                    if (_currentIndex < _pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                     context.go(AppRoutes.loginScreen);
                    }
                  },
                  child: Text(
                    _currentIndex == _pages.length - 1 ? 'ابدأ الآن' : 'التالي',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String body;
  final String image;
  final Color backgroundColor;

  OnboardingPage({
    required this.title,
    required this.body,
    required this.image,
    required this.backgroundColor,
  });
}
