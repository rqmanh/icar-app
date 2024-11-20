

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:icar/config/app_colors.dart';
// import 'package:icar/config/app_images.dart';
// import 'package:icar/config/theme/app_text_styles.dart';
// import 'package:icar/core/utils/spacing.dart';
// import 'package:icar/features/auth/presentation/widgets/signin_form_widget.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: CColors.scafBackgroundColorDark,
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: SvgPicture.asset(
//                     AppImages.logo,
//                     colorFilter: const ColorFilter.mode(
//                         CColors.primaryColor, BlendMode.srcIn),
//                   ),
//                 ),
//                 verticalSpace(10),
//                 Align(
//                     alignment: Alignment.topRight,
//                     child: Text(
//                       'تسجيل الدخول إلى iCar',
//                       style:
//                           CTextStyles.font16DarkSemiBold.copyWith(fontSize: 20),
//                     )),
//                 verticalSpace(10),
//                 Align(
//                     alignment: Alignment.topRight,
//                     child: Text(
//                       'مرحبًا بعودتك! سجل دخولك للوصول إلى حسابك ومتابعة إدارة وصيانة سيارتك',
//                       style: CTextStyles.font12GrayRegular,
//                     )),
//                 const LoginFormWidget(),
//               ],
//             ),
//           ),
//         ));
//   }
// }
