// import 'package:icar/config/app_colors.dart';
// import 'package:icar/config/theme/app_text_styles.dart';
// import 'package:icar/core/localization/local_keys.dart';
// import 'package:icar/core/widgets/buttons/primary_button.dart';
// import 'package:icar/core/widgets/top_bar.dart';
// import 'package:icar/features/auth/presentation/getx/signup_controller.dart';
// import 'package:icar/core/widgets/custom_date_bottom_sheet.dart';
// import 'package:icar/core/widgets/custom_dropdown_field.dart';
// import 'package:icar/core/widgets/custom_text_field.dart';
// import 'package:icar/utils/app_utils.dart';
// import 'package:icar/utils/helper_controller.dart';
// import 'package:icar/utils/validator.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class CreateAccountForm extends StatelessWidget {
//   final SignUpController _controller = Get.find();

//   CreateAccountForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _controller.signUpFormKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           //*this is the custom text field widget for the full name
//           CustomTextField(
//             validator: (v) => ValidationHelper.nameValidator(v),
//             label: Lkeys.fullName.tr,
//             hintText: Lkeys.fullName.tr,
//             controller: _controller.nameController,
//           ),
//           const SizedBox(height: 20),
//           //*this is the custom text field widget for the username
//           CustomTextField(
//             // validator: (v) => ValidationHelper.usernameValidator(v),
//             label: Lkeys.nickname.tr,
//             hintText: Lkeys.nickname.tr,
//             controller: _controller.nicknameController,
//           ),
//           const SizedBox(height: 20),
//           CustomTextField(
//             validator: (v) => ValidationHelper.usernameValidator(v),
//             label: Lkeys.username.tr,
//             hintText: Lkeys.username.tr,
//             controller: _controller.usernameController,
//           ),
//           const SizedBox(height: 20),

//           ///* A widget that displays a custom dropdown field for selecting gender.
//           ///
//           /// The dropdown field is wrapped in an Obx widget to make it reactive to changes
//           /// in the selected gender value.
//           ///
//           /// The [CustomDropdownField] takes the following parameters:
//           /// - [label]: The label for the dropdown field, which is translated using [TextKeys.gender.tr].
//           /// - [hintText]: The hint text for the dropdown field, which shows the currently selected gender.
//           /// - [options]: A list of gender options, translated using [TextKeys.male.tr] and [TextKeys.female.tr].
//           /// - [onSelected]: A callback function that sets the selected gender value in the controller.
//           Obx(() => CustomDropdownField(
//                 controller: _controller.genderController,
//                 label: Lkeys.gender.tr,
//                 hintText: _controller.selectedGender.value,
//                 options: [Lkeys.male.tr, Lkeys.female.tr],
//                 onSelected: (value) {
//                   _controller.setGender(value);
//                 },
//               )),
//           const SizedBox(height: 20),

//           ///* A widget that displays a custom date text field for selecting a birth date.
//           Obx(() => CustomDateTextField(
//                 label: Lkeys.birthDate.tr,
//                 hintText: _controller.selectedDate.value != null
//                     ? '${_controller.selectedDate.value!.toLocal()}'
//                         .split(' ')[0]
//                     : Lkeys.birthDate.tr,
//                 icon: Iconsax.calendar,
//                 controller: _controller.birthdateController,
//                 initialDate: DateTime.now(),
//                 onDateSelected: (date) {
//                   _controller.setDate(date);
//                 },
//               )),
//           const SizedBox(height: 20),
//           //*this is the custom text field widget for the email
//           CustomTextField(
//             validator: (v) => ValidationHelper.emailValidator(v),
//             icon: const Icon(Iconsax.message),
//             label: Lkeys.email.tr,
//             hintText: Lkeys.email.tr,
//             controller: _controller.emailController,
//           ),
//           SizedBox(height: 10.h),
//           TermConditionCheakbox(controller: _controller),
//           SizedBox(height: 10.h),
//           Center(
//             child: AppButton(
//               buttonText: Lkeys.save.tr,
//               textStyle: CTextStyles.font18WhiteMedium,
//               onPressed: () async {
//                 if (_controller.ischeaked.value) {
//                   await _controller.signUp();
//                 } else {
//                   Helper.warningSnackBar(
//                       title: 'Opps',
//                       message: 'Please agree to the terms and conditions');
//                 }
//               },
//             ),
//           ),
//           SizedBox(height: 30.h),
//         ],
//       ),
//     );
//   }
// }

// class TermConditionCheakbox extends StatelessWidget {
//   const TermConditionCheakbox({
//     super.key,
//     required dynamic controller,
//   }) : _controller = controller;

//   final dynamic _controller;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Row(
//           children: [
//             Checkbox(
//               activeColor: CColors.primaryColor,
//               side: const BorderSide(color: Color(0XFFDEDEDE)),
//               value: _controller.ischeaked.value,
//               onChanged: (value) {
//                 _controller.ischeaked.value = value ?? false;
//               },
//             ),
//             RichText(
//                 text: TextSpan(
//                     text: Lkeys.iAgreeTo.tr,
//                     style: TextStyle(
//                         color: Get.isDarkMode ? CColors.white : CColors.black,
//                         fontSize: 13.sp,
//                         fontFamily: 'Gilroy',
//                         fontWeight: FontWeight.w400),
//                     children: [
//                   TextSpan(
//                     recognizer: TapGestureRecognizer()
//                       ..onTap = () {
//                         // Get.bottomSheet(
//                         //   ignoreSafeArea: false,
//                         //   isScrollControlled: true,
//                         //   isDismissible: true,
//                         //   const TermCondition());

//                         AppUtils.openURLSheet(
//                             title: 'Terms and condition',
//                             url:
//                                 'https://api.getbzz.com/page/terms-and-conditions');
//                       },
//                     text: Lkeys.termsAndConditions.tr,
//                     style: const TextStyle(
//                         color: CColors.primaryColor,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700,
//                         fontFamily: 'Gilroy'),
//                   )
//                 ])),
//           ],
//         ));
//   }
// }

// class TermCondition extends StatefulWidget {
//   const TermCondition({super.key});

//   @override
//   State<TermCondition> createState() => _TermConditionState();
// }

// class _TermConditionState extends State<TermCondition> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: CColors.scafBackgroundColorDark,
//       child: Column(
//         children: [
//           TopBarForInView(
//             title: 'Terms and Condition',
//           ),
//           _buildBody(),
//         ],
//       ),
//     );
//   }

//   _buildBody() {
//     return Expanded(
//       child: Column(
//         children: [
//           SizedBox(height: 31.h),
//           question('1.Types of data we collect'),
//           SizedBox(height: 16.h),
//           answer(
//               "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
//           SizedBox(height: 31.h),
//           question('2. Use of your personal Data'),
//           SizedBox(height: 16.h),
//           answer(
//               "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
//           SizedBox(height: 31.h),
//           question('3. Disclosure of your personal Data'),
//           SizedBox(height: 16.h),
//           answer(
//               "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
//         ],
//       ),
//     );
//   }

//   question(String s) {
//     return Text(
//       s,
//       style: TextStyle(
//         fontSize: 18.sp,
//         fontFamily: 'Gilroy',
//         fontWeight: FontWeight.bold,
//         color: Get.isDarkMode ? CColors.white : CColors.black,
//       ),
//     );
//   }

//   answer(String s) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         s,
//         style: TextStyle(
//             fontSize: 14.sp,
//             fontFamily: 'Gilroy',
//             fontStyle: FontStyle.normal,
//             fontWeight: FontWeight.w400,
//             color: const Color(0XFF6E758A)),
//       ),
//     );
//   }
// }
