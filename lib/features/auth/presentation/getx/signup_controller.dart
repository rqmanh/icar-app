
// import 'package:icar/api/result/failures.dart';
// import 'package:icar/config/routre/app_routes.dart';
// import 'package:icar/core/localization/local_keys.dart';
// import 'package:icar/features/auth/data/models/user_model.dart';
// import 'package:icar/features/auth/domain/repositories/auth_repository.dart';
// import 'package:icar/utils/helper_controller.dart';
// import 'package:icar/utils/shared_pref_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:get_it/get_it.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';

// class SignUpController extends GetxController {
//   final AuthRepository authRepository = GetIt.I<AuthRepository>();

//   var nameController = TextEditingController();
//   var usernameController = TextEditingController();
//   var nicknameController = TextEditingController();
//   var emailController = TextEditingController();
//   var genderController = TextEditingController();
//   var birthdateController = TextEditingController();
//   var selectedGender = Lkeys.chooseGender.tr.obs;
//   var selectedDate = Rx<DateTime?>(null);
//   RxString imagePath = ''.obs;
//   RxString imagePath2 = ''.obs;
//     final ischeaked = false.obs;
//   GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

//   void setGender(String gender) {
//     selectedGender.value = gender;
//   }

//   void setDate(DateTime date) {
//     selectedDate.value = date;
//   }

//   Future<void> signUp() async {
//     if (signUpFormKey.currentState!.validate()) {
//       EasyLoading.show(status: 'loading');

//       UserModel user = UserModel(
//         bio: '',
//         mobileNumber: '',
//         id: 0,
//         name: nameController.text,
//         nickname: nicknameController.text,
//         username: usernameController.text,
//         email: emailController.text,
//         gender: selectedGender.value == Lkeys.male.tr ? 1 : 0,
//         birthDate: DateFormat('yyyy-MM-dd').format(selectedDate.value!),
//         avatar: imagePath.value,
//         // av: imagePath2.value,
//         // isCompleteRegister: 1,
//         // Add other necessary fields
//       );
//       print(DateFormat('yyyy-MM-dd').format(selectedDate.value!));
//       print({
//         'name': nameController.text,
//         'nickName': nicknameController.text,
//         'username': usernameController.text,
//         'email': emailController.text,
//         'avatar': imagePath.value,
//       });
//       final result = await authRepository.signUp(user);
//       result.fold(
//         (failure) {
//           EasyLoading.dismiss();

//           if (failure is ServerFailure && failure.errors != null) {
//             print('Error: ${failure.message}${failure.errors} ');
//             String errorMessage = failure.errors;
//             Helper.errorSnackBar( errorMessage);
//           } else {
//             Helper.errorSnackBar(
//            failure.message,
//             );
//           }

//           Helper.errorSnackBar(
//    failure.errors ?? failure.message);
//           // Show error message using a snackbar or dialog
//         },
//         (success) {
//           EasyLoading.dismiss();
//           // Helper.successSnackBar(
//           //     title: 'success', message: 'Welcome ${success.nickName}');
//           Get.offAllNamed(AppRoutes.dashboardScreen);
//           PrefHelper.instance.setLogin(true);
//           print('User registered successfully');
//           // Navigate to the main screen
//         },
//       );
//     }
//   }

//   // pickImage
//   // Future<void> pickAvatarImage() async {
//   //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   if (image != null) imagePath2.value = image.path;
//   // }
//   Future<XFile?> pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) imagePath.value = image.path;
//     return image;
//   }

//   void removeImage() {
//     imagePath.value = '';
//   }
//   // Future<void> pickProfileImage() async {
//   //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   if (image != null) imagePath1.value = image.path;
//   // }

//   @override
//   void onClose() {
//     genderController.dispose();
//     birthdateController.dispose();
//     nameController.dispose();
//     nicknameController.dispose();
//     usernameController.dispose();
//     emailController.dispose();
//     super.onClose();
//   }
// }


// // import 'dart:io';

// // import 'package:icar/api/result/failures.dart';
// // import 'package:icar/config/app_strings.dart';
// // import 'package:icar/config/routre/app_routes.dart';
// // import 'package:icar/core/localization/local_keys.dart';
// // import 'package:icar/features/auth/data/models/user_model.dart';
// // import 'package:icar/features/auth/domain/repositories/auth_repository.dart';
// // import 'package:icar/utils/helper_controller.dart';
// // import 'package:icar/utils/shared_pref_helper.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_easyloading/flutter_easyloading.dart';
// // import 'package:get/get.dart';
// // import 'package:get_it/get_it.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:intl/intl.dart';

// // class SignUpController extends GetxController {
// //   final AuthRepository authRepository = GetIt.I<AuthRepository>();

// //   var nameController = TextEditingController();
// //   var usernameController = TextEditingController();
// //   var nicknameController = TextEditingController();
// //   var emailController = TextEditingController();
// //   var genderController = TextEditingController();
// //   var birthdateController = TextEditingController();
// //   var selectedGender = LKeys.chooseGender.tr.obs;
// //   var selectedDate = Rx<DateTime?>(null);
// //   RxString imagePath = ''.obs;
// //   RxString imagePath2 = ''.obs;
// //   GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

// //   void setGender(String gender) {
// //     selectedGender.value = gender;
// //   }

// //   void setDate(DateTime date) {
// //     selectedDate.value = date;
// //   }

// //   Future<void> signUp() async {
// //     if (signUpFormKey.currentState!.validate()) {
// //       EasyLoading.show(status: 'loading');

// //       UserModel user = UserModel(
// //         bio: '',
// //         mobileNumber: '',
// //         id: 0,
// //         name: nameController.text,
// //         nickname: nicknameController.text,
// //         username: usernameController.text,
// //         email: emailController.text,
// //         gender: selectedGender.value == LKeys.male.tr ? 1 : 0,
// //         birthDate: DateFormat('yyyy-MM-dd').format(selectedDate.value!),
// //         avatar: imagePath.value,
// //       );
      
// //       final result = await authRepository.signUp(user);
// //       result.fold(
// //         (failure) {
// //           EasyLoading.dismiss();
// //           if (failure is ServerFailure && failure.errors != null) {
// //             print('Error: ${failure.message}${failure.errors} ');
// //             String errorMessage = failure.errors;
// //             Helper.errorSnackBar( errorMessage);
// //           } else {
// //             Helper.errorSnackBar(
// //               title: 'Error',
// //               message: failure.message,
// //             );
// //           }

// //           Helper.errorSnackBar(
// //               title: ohSnap, message: failure.errors ?? failure.message);
// //         },
// //         (success) {
// //           EasyLoading.dismiss();
// //           Get.offAllNamed(AppRoutes.dashboardScreen);
// //           PrefHelper.instance.setLogin(true);
// //           print('User registered successfully');
// //         },
// //       );
// //     }
// //   }

// //   Future<XFile?> pickImage() async {
// //     final ImagePicker picker = ImagePicker();
// //     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// //     if (image != null) imagePath.value = image.path;
// //     return image;
// //   }

// //   void removeImage() {
// //     imagePath.value = '';
// //   }

// //   @override
// //   void onClose() {
// //     genderController.dispose();
// //     birthdateController.dispose();
// //     nameController.dispose();
// //     nicknameController.dispose();
// //     usernameController.dispose();
// //     emailController.dispose();
// //     super.onClose();
// //   }
// // }
