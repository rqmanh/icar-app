// import 'package:icar/config/app_colors.dart';
// import 'package:icar/config/app_images.dart';
// import 'package:icar/core/localization/local_keys.dart';
// import 'package:icar/core/widgets/form/form_header_widget.dart';
// import 'package:icar/features/auth/presentation/getx/signin_controller.dart';
// import 'package:icar/features/auth/presentation/widgets/signin_form_widget.dart';
// import 'package:icar/config/app_sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class SignInScreen extends StatelessWidget {
//   const SignInScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.lazyPut(() => SignInController());
//     return SafeArea(
//       child: Scaffold(

//         backgroundColor: CColors.scafBackgroundColorDark,
//         body: SingleChildScrollView(
//           child: GestureDetector(
//             onTap: () => FocusScope.of(context).unfocus(),
//             child: Container(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: tDefaultSpace, vertical: tLargeSpace),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 40.h,
//                   ),
//                   FormHeaderWidget(
//                     image: AppImages.appLogo,
//                     // title: welcomeBack,
//                     title: Lkeys.loginTitle.tr,
//                     subTitle: Lkeys.loginSubTitle.tr,
//                     // subTitle: "",
//                     imageHeight: 0.14,
//                   ),
//                   const LoginFormWidget(),
//                   20.verticalSpace,
//                   // const TFormDividerWidget(),
//                   // AuthFooter(
//                   //     text1: LKeys.dontHaveAnAccount.tr,
//                   //     text2: LKeys.signup.tr,
//                   //     onPressed: () => Get.offNamed(AppRoutes.signupScreen)),
//                   // ClickableRichTextWidget(text1: '', text2: 'Enter As a Geust', onPressed: () {
//                   //   PrefHelper.instance.setLoginAsGeust(true);
//                   //   Get.toNamed(AppRoutes.dashboardScreen);

//                   // }),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/utils/spacing.dart';
import 'package:icar/features/auth/presentation/widgets/signin_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CColors.scafBackgroundColorDark,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(
                    AppImages.logo,
                    colorFilter: const ColorFilter.mode(
                        CColors.primaryColor, BlendMode.srcIn),
                  ),
                ),
                verticalSpace(10),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'تسجيل الدخول إلى iCar',
                      style:
                          CTextStyles.font16DarkSemiBold.copyWith(fontSize: 20),
                    )),
                verticalSpace(10),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'مرحبًا بعودتك! سجل دخولك للوصول إلى حسابك ومتابعة إدارة وصيانة سيارتك',
                      style: CTextStyles.font12GrayRegular,
                    )),
                const LoginFormWidget(),
              ],
            ),
          ),
        ));
  }
}
