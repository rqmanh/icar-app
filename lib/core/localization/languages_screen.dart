// import 'package:icar/config/app_colors.dart';
// import 'package:icar/config/theme/app_text_styles.dart';
// import 'package:icar/core/localization/local_controller.dart';
// import 'package:icar/core/localization/local_keys.dart';
// import 'package:icar/core/widgets/top_bar.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class LanguagesScreen extends StatelessWidget {
//   const LanguagesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     LanguagesController controller = LanguagesController();
//     return Scaffold(
//       backgroundColor: CColors.scafBackgroundColorDark,
//       body: GetBuilder(
//           init: controller,
//           builder: (c) {
//             return Column(
//               children: [
//                 TopBarForInView(title: Lkeys.languages.tr),
//                 10.verticalSpace,
//                 Expanded(
//                   child: SafeArea(
//                     top: false,
//                     child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       itemCount: controller.languages.length,
//                       itemBuilder: (context, index) {
//                         return RadioListTile<Lang>(
//                        selected: controller.selectedLan == controller.languages[index],
//                           groupValue: controller.selectedLan,
//                           value: controller.languages[index],
//                           dense: true,
//                           fillColor:
//                               WidgetStateProperty.all(CColors.primaryColor),
//                           onChanged: (Lang? value) {
//                             controller.setLang(value!);
               
//                           },
//                           title: Text(controller.languages[index].displayName,
//                               style: CTextStyles.font18WhiteMedium),
//                           subtitle: Text(
//                               controller.languages[index].nameInEnglish,
//                               style: CTextStyles.font14GrayRegular),
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             );
//           }),
//     );
//   }
// }
