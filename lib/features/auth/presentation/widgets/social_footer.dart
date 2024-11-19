// import 'package:icar/core/widgets/buttons/clickable_richtext_widget.dart';

// import 'package:icar/config/app_sizes.dart';
// import 'package:icar/config/app_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AuthFooter extends StatelessWidget {
//   const AuthFooter({
//     super.key,
//     this.text1 = tDontHaveAnAccount,
//     this.text2 = signup,
//     required this.onPressed,
//   });

//   final String text1, text2;
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     // final loginController = Get.find<LoginController>();
//     return Container(
//       padding: const EdgeInsets.only(
//           top: tDefaultSpace * 1.5, bottom: tDefaultSpace),
//       child: Column(
//         children: [
//           // Obx(
//           //   () => TSocialButton(
//           //     image: tGoogleLogo,
//           //     background: tGoogleBgColor,
//           //     foreground: tGoogleForegroundColor,
//           //     text: '${tConnectWith.tr} ${tGoogle.tr}',
//           //     isLoading: loginController.isGoogleLoading.value ? true : false,
//           //     loadingColor: Theme.of(context).primaryColor,
//           //     onPressed: loginController.isFacebookLoading.value ||
//           //             loginController.isLoading.value
//           //         ? () {}
//           //         : loginController.isGoogleLoading.value
//           //             ? () {}
//           //             : () => loginController.submitLoginByGoogleButton(),
//           //   ),
//           // ),
//           // const SizedBox(height: 10),
//           // Obx(
//           //   () => TSocialButton(
//           //     image: tFacebookLogo,
//           //     foreground: tWhiteColor,
//           //     background: tFacebookBgColor,
//           //     text: '${tConnectWith.tr} ${tFacebook.tr}',
//           //     isLoading: loginController.isFacebookLoading.value ? true : false,
//           //     onPressed:
//           //         loginController.isGoogleLoading.value || loginController.isLoading.value
//           //             ? () {}
//           //             : loginController.isFacebookLoading.value
//           //                 ? () {}
//           //                 : () => loginController.submitLoginByFacebookButton(),
//           //   ),
//           // ),
//           // const SizedBox(height: tDefaultSpace * 2),
//           ClickableRichTextWidget(
//             text1: text1.tr,
//             text2: text2.tr,
//             onPressed: onPressed,
//           ),
//         ],
//       ),
//     );
//   }
// }
