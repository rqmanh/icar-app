// import 'package:icar/config/theme/app_text_styles.dart';
// import 'package:icar/core/localization/local_keys.dart';
// import 'package:icar/core/widgets/buttons/primary_button.dart';
// import 'package:icar/config/app_colors.dart';
// import 'package:icar/config/app_sizes.dart';
// import 'package:icar/features/auth/presentation/getx/signin_controller.dart';
// import 'package:icar/features/auth/presentation/widgets/create_account_form.dart';
// import 'package:icar/utils/helper_controller.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import 'package:phone_form_field/phone_form_field.dart';

// class LoginFormWidget extends StatelessWidget {
//   const LoginFormWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<SignInController>();

//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: tFormHeight - 5),
//       child: Form(
//         key: controller.loginFormKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Directionality(
//               textDirection: TextDirection.ltr,
//               child: PhoneFormField(
                
//                 // onTapOutside:(p){

//                 // },
//                 onEditingComplete: () {},
//                 countryButtonStyle: const CountryButtonStyle(
//                   flagSize: 30,
//                   textStyle: TextStyle(color: Colors.white),
//                 ),
//                 countrySelectorNavigator:
//                     const CountrySelectorNavigator.modalBottomSheet(),
//                 // (context, country) => showCountrySelector(context, authController),
//                 cursorColor: CColors.primaryColor,
//                 autovalidateMode: AutovalidateMode.disabled,
//                 // validator: (phone) =>ValidationHelper.phoneValidation(phone!.nsn),
//                 style: const TextStyle(color: Colors.white),

//                 validator: (phone) {
//                   if (phone == null || phone.nsn.isEmpty) {
//                     return Lkeys.phoneRequired.tr;
//                   }
//                   if (phone.nsn.length < 9) {
//                     return Lkeys.phoneTooShort.tr;
//                   }
//                   if (phone.nsn.length > 15) {
//                     return Lkeys.phoneTooLong.tr;
//                   }
//                   if (phone.nsn.startsWith('0')) {
//                     return Lkeys.phoneNoStart0.tr;
//                   }
//                   if (phone.nsn.length == 9 && !phone.nsn.startsWith('5')) {
//                     return Lkeys.phoneShouldStart5.tr;
//                   }
//                   if (!phone.isValid()) {
//                     return Lkeys.phoneInvalid.tr;
//                   }
//                   return null;
//                 },

//                 keyboardType: TextInputType.phone,
//                 textInputAction: TextInputAction.done,

//                 controller: controller.phoneNumberController,
//                 decoration: InputDecoration(
//                   hintStyle:CTextStyles.font14WhiteMedium,
//                   labelStyle: CTextStyles.font14WhiteMedium,
//                   labelText: Lkeys.phoneNumber.tr,
//                   hintText: Lkeys.phoneNumberHint.tr,
//                   border: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   enabledBorder: const OutlineInputBorder(
//                     borderSide:
//                         BorderSide(color: CColors.borderColor, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   focusedBorder: const OutlineInputBorder(
//                     borderSide:
//                         BorderSide(color: CColors.primaryColor, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   errorBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                 ),
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                   LengthLimitingTextInputFormatter(9),
//                 ],
//                 onChanged: (phone) {
//                   if (controller.phoneNumberController.value.nsn.length == 9) {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                   }
//                 },
//               ),
//             ),
//             // 5.verticalSpace,
//             TermConditionCheakbox(controller: controller),
//             Obx(
//               () => AppGesterDedector(
//                 height: 50.h,
//                 isLoading: controller.isLoading.value ? true : false,
//                 text: Lkeys.login.tr,
//                 onTap: controller.isLoading.value
//                     ? () {}
//                     : () {
//                         //here write your login code

//                         if (controller.ischeaked.value) {
//                           controller.sendOtp();
//                         } else {
//                           Helper.warningSnackBar(
//                               title: 'Opps',
//                               message:
//                                   'Please agree to the terms and conditions to continue');
//                         }
//                       },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
