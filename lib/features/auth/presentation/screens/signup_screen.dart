// import 'package:icar/config/app_colors.dart';
// import 'package:icar/config/app_icons.dart';
// import 'package:icar/config/routre/app_routes.dart';
// import 'package:icar/config/theme/app_text_styles.dart';
// import 'package:icar/core/localization/local_keys.dart';

// import 'package:icar/core/widgets/custom_asset_image_widget.dart';
// import 'package:icar/features/auth/presentation/getx/signup_controller.dart';
// import 'package:icar/features/auth/presentation/widgets/create_account_form.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class SignupScreen extends GetView<SignUpController> {
//   const SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CColors.scafBackgroundColorDark,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new_rounded,
//               color: CColors.primaryColor),
//           onPressed: () => Get.offNamed(AppRoutes.signinScreen),
//         ),
//         backgroundColor: CColors.scafBackgroundColorDark,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             30.verticalSpace,
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Obx(() => Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircleEditableImageWidget(
//                         imagePath: controller.imagePath.value,
//                         onClick: () => controller.pickImage(),
//                         imageIcon: AppIcons.signupIcon1,
//                         onRemove: () => controller.removeImage(),
//                       ),
//                     ],
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Text(Lkeys.addPhotoOrAvatar.tr,
//                         style: CTextStyles.font16WhiteSemiBold),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     Lkeys.accountData.tr,
//                     style: CTextStyles.font24TealBold,
//                   ),
//                   const SizedBox(height: 10),
//                   Text(Lkeys.enterAccountDataToContinue.tr,
//                       style: CTextStyles.font14WhiteMedium),
//                   const SizedBox(height: 20),
//                   CreateAccountForm(),
//                   // Center(
//                   //   child: AuthFooter(
//                   //       text1: LKeys.alreadyHaveAnAccount.tr,
//                   //       text2: LKeys.login.tr,
//                   //       onPressed: () =>
//                   //           Get.offAndToNamed(AppRoutes.signinScreen)),
//                   // )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SignupHeaderWidget extends StatelessWidget {
//   void Function()? onPressed;

//   String? path;
//   SignupHeaderWidget({super.key, this.onPressed, this.path});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70.h,
//       width: 70.w,
//       decoration: BoxDecoration(
//         color: const Color(0xFF1C1E2B),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: IconButton(
//         iconSize: 40,
//         icon: CustomAssetImageWidget(path ?? ''),
//         onPressed: onPressed,
//       ),
//     );
//   }
// }
