// // lib/features/auth/presentation/controllers/auth_controller.dart

// import 'package:icar/config/routre/app_routes.dart';
// import 'package:icar/features/authentication/presentation/screens/otp_screen.dart';
// import 'package:icar/utils/shared_pref_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:icar/features/authentication/domain/entities/auth_user.dart';
// import 'package:icar/features/authentication/domain/entities/user_profile.dart';
// import 'package:icar/features/authentication/domain/usecases/send_otp_usecase.dart';
// import 'package:icar/features/authentication/domain/usecases/verify_otp_usecase.dart';
// import 'package:icar/features/authentication/domain/usecases/sign_out_usecase.dart';
// import 'package:icar/features/authentication/domain/usecases/sign_up_usecase.dart';
// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';
// import 'package:phone_form_field/phone_form_field.dart';

// @injectable
// class AuthController extends GetxController {
// // final SendOtpUseCase sendOtpUseCase = GetIt.I<SendOtpUseCase>();
// //   final VerifyOtpUseCase verifyOtpUseCase = GetIt.I<VerifyOtpUseCase>();
//   final SignOutUseCase signOutUseCase = GetIt.I<SignOutUseCase>();
//   // final SignUpUseCase signUpUseCase = GetIt.I<SignUpUseCase>();



//   // TextEditingController instances

//   PhoneController phoneNumberController =PhoneController();

//   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

//   late final TextEditingController nameController;
//   late final TextEditingController fakeNameController;
//   late final TextEditingController photoController;
//   late final TextEditingController photoCoverController;
//   late final TextEditingController genderController;
//   late final TextEditingController birthdateController;
//   late final TextEditingController emailController;

//   var user = Rxn<AuthUserEntity>();
//   var userProfile = Rxn<UserProfile>();
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;
//   var successMessage = ''.obs;
// final isPhoneNumberValid = false.obs;

//   void updatePhoneNumberValidity(bool isValid) {
//     isPhoneNumberValid.value = isValid;
//   }

//   // Future<void> sendOtp() async {
//   //   isLoading.value = true;
//   //   // final result = await sendOtpUseCase.call('+${phoneNumberController.value.countryCode+phoneNumberController.value.nsn}');
//   //   // isLoading.value = false;
//   //   // result.fold(
//   //   //   (failure) => errorMessage.value = failure.message,
//   //   //   (success) => successMessage.value = success.message,
//   //   // );
//   //   Get.to(() => OtpVerificationScreen(phoneNumberWithCountryCode: '+${phoneNumberController.value.countryCode+phoneNumberController.value.nsn}'));
//   // }

  

//   // Future<void> signUp() async {
//   //   isLoading.value = true;
//   //   final profile = UserProfile(
//   //     id: '', // Will be set by the backend
//   //     name: nameController.text,
//   //     fakeName: fakeNameController.text,
//   //     photo: photoController.text,
//   //     photoCover: photoCoverController.text,
//   //     gender: genderController.text,
//   //     birthdate: DateTime.parse(birthdateController.text),
//   //     email: emailController.text,
//   //   );
//   //   final result = await signUpUseCase.call(profile);
//   //   isLoading.value = false;
//   //   result.fold(
//   //     (failure) => errorMessage.value = failure.message,
//   //     (userProfile) => this.userProfile.value = userProfile,
//   //   );
//   // }

//   // Future<void> signOut() async {
//   //   isLoading.value = true;
//   //   final result = await signOutUseCase.call();
//   //   isLoading.value = false;
//   //   result.fold(
//   //     (failure) => errorMessage.value = failure.message,
//   //     (success) => successMessage.value = success.message,
//   //   );
//   // }
// @override
//   void onInit() {
//     super.onInit();
// phoneNumberController =PhoneController(
//     initialValue: const PhoneNumber(isoCode: IsoCode.SA, nsn: ''));
//      loginFormKey = GlobalKey<FormState>();
//  otpController = TextEditingController();
//  nameController = TextEditingController();
//  fakeNameController = TextEditingController();
//  photoController = TextEditingController();
//  photoCoverController = TextEditingController();
//  genderController = TextEditingController();
//  birthdateController = TextEditingController();
//  emailController = TextEditingController();
//   }
//   @override
//   void onClose() {

//     phoneNumberController.dispose();
//     otpController.dispose();
//     nameController.dispose();
//     fakeNameController.dispose();
//     photoController.dispose();
//     photoCoverController.dispose();
//     genderController.dispose();
//     birthdateController.dispose();
//     emailController.dispose();
//     super.onClose();
//   }
// }
