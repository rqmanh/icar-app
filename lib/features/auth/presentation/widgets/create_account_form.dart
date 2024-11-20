import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/utils/spacing.dart';
import 'package:icar/core/utils/validator.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:icar/core/widgets/custom_dropdown_field.dart';
import 'package:icar/core/widgets/custom_text_field.dart';
import 'package:icar/features/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:phone_form_field/phone_form_field.dart';

// class CreateAccountForm extends StatelessWidget {
//   const CreateAccountForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final signupCubit = context.read<SignupCubit>();
//     return Form(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Custom TextField for Full Name
//           CustomTextField(
//             label: AppKeys.fullName,
//             hintText: AppKeys.fullName,
//             validator: (v) => ValidationHelper.nameValidator(v),
//             controller: TextEditingController(),
//           ),
//           const SizedBox(height: 20),
//           // Country and City Selection with BottomSheet
//        BlocBuilder<SignupCubit, SignupState>(
//   builder: (context, state) {
//     var countries =
//         state is SignupCountriesLoaded ? state.countries : <String>[];

//     String? selectedCity;
//     if (state is SignupCityChanged) {
//       selectedCity = state.city;
//     }

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // Country Dropdown
//         Expanded(
//           child: CustomDropdownField<String>(
//             label: AppKeys.country,
//             value: state is SignupCountryChanged ? state.country : null,
//             items: countries,
//             onChanged: (value) {
//               if (value != null) {
//                 signupCubit.changeCountry(value);
//               }
//             },
//           ),
//         ),
//         const SizedBox(width: 10),

//         // City Dropdown
//         Expanded(
//           child: CustomDropdownField<String>(
//             label: AppKeys.city,
//             value: selectedCity,
//             items: state is SignupCitiesLoaded ? state.cities : <String>[],
//             onChanged: (value) {
//               if (value != null) {
//                 signupCubit.changeCity(value);
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   },
// ),

//           const SizedBox(height: 20),

//           // Phone Number TextField using PhoneFormField
//           PhoneFormField(
//             controller: signupCubit.phoneNumberController,
//             validator: (phone) {
//               if (phone == null || phone.nsn.isEmpty) {
//                 return AppKeys.phoneRequired;
//               }
//               if (phone.nsn.length < 9) {
//                 return AppKeys.phoneTooShort;
//               }
//               if (phone.nsn.length > 15) {
//                 return AppKeys.phoneTooLong;
//               }
//               if (phone.nsn.startsWith('0')) {
//                 return AppKeys.phoneNoStart0;
//               }
//               if (phone.nsn.length == 9 && !phone.nsn.startsWith('5')) {
//                 return AppKeys.phoneShouldStart5;
//               }
//               if (!phone.isValid()) {
//                 return AppKeys.phoneInvalid;
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//               hintStyle: CTextStyles.font13GrayRegular,
//               labelStyle: CTextStyles.font13GrayRegular,
//               hintText: '000000000',
//               enabledBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: CColors.lightGray, width: 1.0),
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//               ),
//               errorBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red, width: 2.0),
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//               ),
//             ),
//             inputFormatters: [
//               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//               LengthLimitingTextInputFormatter(9),
//             ],
//           ),
//           const SizedBox(height: 20),

//           // Gender Radio Buttons with Custom Decoration in Row
//           Text(AppKeys.gender),
//           BlocBuilder<SignupCubit, SignupState>(
//             builder: (context, state) {
//               return Row(
//                 mainAxisAlignment:
//                     MainAxisAlignment.spaceEvenly, // Spread out radio buttons
//                 children: [
//                   // Male Radio Button
//                   GestureDetector(
//                     onTap: () {
//                       signupCubit.changeGender('Male');
//                     },
//                     child: Container(
//                       height: 60,
//                       width: 160,
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: state is SignupGenderChanged &&
//                                   state.gender == 'Male'
//                               ? CColors.primaryColor
//                               : CColors.borderColor,
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(AppKeys.male),
//                           const Spacer(),
//                           Radio<String>(
//                             value: 'Male',
//                             groupValue: state is SignupGenderChanged
//                                 ? state.gender
//                                 : '',
//                             onChanged: (String? value) {
//                               if (value != null) {
//                                 signupCubit.changeGender(value);
//                               }
//                             },
//                             activeColor: CColors.primaryColor,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20), // Space between the options

//                   // Female Radio Button
//                   GestureDetector(
//                     onTap: () {
//                       signupCubit.changeGender('Female');
//                     },
//                     child: Container(
//                       height: 60,
//                       width: 160,
//                       margin: const EdgeInsets.all(10),
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: state is SignupGenderChanged &&
//                                   state.gender == 'Female'
//                               ? CColors.primaryColor
//                               : CColors.borderColor,
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(AppKeys.female),
//                           const Spacer(),
//                           Radio<String>(
//                             value: 'Female',
//                             groupValue: state is SignupGenderChanged
//                                 ? state.gender
//                                 : '',
//                             onChanged: (String? value) {
//                               if (value != null) {
//                                 signupCubit.changeGender(value);
//                               }
//                             },
//                             activeColor: CColors.primaryColor,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//           const SizedBox(height: 20),
//           AppGesterDedector(onTap: () {}, text: AppKeys.signup)
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomSheetField<T>({
//     required BuildContext context,
//     required String title,
//     required T? value,
//     required List<T> items,
//     required ValueChanged<T?> onChanged,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
//           ),
//           builder: (context) {
//             return Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [

//                   Text(
//                     title,
//                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   ...items.map((item) {
//                     return ListTile(
//                       title: Text((item as dynamic).name ?? item.toString()),
//                       onTap: () {
//                         onChanged(item);
//                        context.pop();
//                       },
//                     );
//                   })
//                 ],
//               ),
//             );
//           },
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12.0),
//           border: Border.all(color: CColors.borderColor),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               value != null ? value.toString() : '${AppKeys.select} $title',
//               style: const TextStyle(fontSize: 16),
//             ),
//             const Icon(Icons.arrow_drop_down),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    final countryController = TextEditingController();
    final cityController = TextEditingController();
    final nameController = TextEditingController();

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom TextField for Full Name
          CustomTextField(
              label: AppKeys.fullName,
              hintText: AppKeys.fullName,
              focusNode: FocusNode(),
              validator: (v) => ValidationHelper.nameValidator(v),
              controller: nameController),
          10.verticalSpace,
          // Country and City Selection
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              var countries =
                  state is SignupCountriesLoaded ? state.countries : <String>[];
              var cities =
                  state is SignupCitiesLoaded ? state.cities : <String>[];

              return Row(
                children: [
                  // Country Dropdown
                  Expanded(
                    child: CustomDropdownField(
                      label: AppKeys.country,
                      hintText: AppKeys.select,
                      options: countries,
                      controller: countryController,
                      onSelected: (value) {
                        signupCubit.changeCountry(value);
                      },
                    ),
                  ),
                  horizontalSpace(10),
                  // City Dropdown
                  Expanded(
                    child: CustomDropdownField(
                      label: AppKeys.city,
                      hintText: AppKeys.select,
                      options: cities,
                      controller: cityController,
                      enabled: countries.isNotEmpty,
                      onSelected: (value) {
                        signupCubit.changeCity(value);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppKeys.phoneNumber,
              style: CTextStyles.font14DarkMedium,
            ),
          ),
          // Phone Number Field
          PhoneFormField(
            autovalidateMode:AutovalidateMode.onUnfocus ,
            controller: signupCubit.phoneNumberController,
            validator: (phone) {
              if (phone == null || phone.nsn.isEmpty) {
                return AppKeys.phoneRequired;
              }
              if (phone.nsn.length < 9) {
                return AppKeys.phoneTooShort;
              }
              if (phone.nsn.length > 15) {
                return AppKeys.phoneTooLong;
              }
              if (phone.nsn.startsWith('0')) {
                return AppKeys.phoneNoStart0;
              }
              if (phone.nsn.length == 9 && !phone.nsn.startsWith('5')) {
                return AppKeys.phoneShouldStart5;
              }
              if (!phone.isValid()) {
                return AppKeys.phoneInvalid;
              }
              return null;
            },
            decoration: InputDecoration(
              hintStyle: CTextStyles.font13GrayRegular,
              labelStyle: CTextStyles.font13GrayRegular,
              hintText: '000000000',
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CColors.lightGray, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              LengthLimitingTextInputFormatter(9),
            ],
          ),
          10.verticalSpace,
          // Gender Selection
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppKeys.gender,
              style: CTextStyles.font14DarkMedium,
            ),
          ),

          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      _buildGenderOption(
                        context: context,
                        title: AppKeys.male,
                        value: 'Male',
                        gender:
                            state is SignupGenderChanged ? state.gender : '',
                        isSelected: state is SignupGenderChanged &&
                            state.gender == 'Male',
                      ),
                      horizontalSpace(10),
                      _buildGenderOption(
                        context: context,
                        title: AppKeys.female,
                        value: 'Female',
                        gender:
                            state is SignupGenderChanged ? state.gender : '',
                        isSelected: state is SignupGenderChanged &&
                            state.gender == 'Female',
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),

          // Sign-Up Button
          AppGesterDedector(
            onTap: () {
              // Sign-up action
            },
            text: AppKeys.signup,
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption({
    required BuildContext context,
    required String title,
    required String value,
    required bool isSelected,
    required String gender,
  }) {
    final signupCubit = context.read<SignupCubit>();
    return Expanded(
      child: GestureDetector(
        onTap: () => signupCubit.changeGender(value),
        child: Container(
          height: 60,
          width: 160,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? CColors.primaryColor : CColors.borderColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              ),
              Radio<String>(
                value: value,
                groupValue: gender,
                onChanged: (selectedValue) {
                  signupCubit.changeGender(selectedValue!);
                },
                activeColor: CColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
