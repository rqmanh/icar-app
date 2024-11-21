import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/utils/spacing.dart';
import 'package:icar/core/utils/validator.dart';
import 'package:icar/core/widgets/buttons/clickable_richtext_widget.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:icar/core/widgets/custom_dropdown_field.dart';
import 'package:icar/core/widgets/custom_text_field.dart';
import 'package:icar/features/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:icar/features/auth/presentation/widgets/signin_form_widget.dart';
import 'package:phone_form_field/phone_form_field.dart';

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
             TermConditionText(termsOfService: AppKeys.signuptermsOfService,),
          // Sign-Up Button
          AppGesterDedector(
            onTap: () {
              // Sign-up action
            },
            text: AppKeys.signup,
          ),
           Align(
            alignment: Alignment.center,
             child: ClickableRichTextWidget(
              text1: AppKeys.alreadyHaveAnAccount,
              text2: AppKeys.login,
              onPressed: ()=>context.push(AppRoutes.signinScreen),
                       ),
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
