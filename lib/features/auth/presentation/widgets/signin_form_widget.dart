import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_sizes.dart';
import 'package:icar/core/utils/app_utils.dart';
import 'package:icar/core/utils/shared_pref_helper.dart';
import 'package:icar/core/utils/spacing.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:icar/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:phone_form_field/phone_form_field.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 5),
      child: Form(
        key: cubit.signinFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CColors.white),
              child: Column(
                children: [
                  verticalSpace(15),
                  Align(
                      alignment: PrefHelper.instance.getLangCode() == 'en'
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: Text(AppKeys.phoneNumber)),
                  verticalSpace(10),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: PhoneFormField(
                      countryButtonStyle: const CountryButtonStyle(
                        flagSize: 30,
                        textStyle: TextStyle(color: CColors.black),
                      ),
                      // selectionControls: EmptyTextSelectionControls(),
                      countrySelectorNavigator:
                          const CountrySelectorNavigator.modalBottomSheet(),
                      cursorColor: CColors.primaryColor,
                      autovalidateMode: AutovalidateMode.disabled,
                      // style: const TextStyle(color: CColors.gray),
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
                        if (phone.nsn.length == 9 &&
                            !phone.nsn.startsWith('5')) {
                          return AppKeys.phoneShouldStart5;
                        }
                        if (!phone.isValid()) {
                          return AppKeys.phoneInvalid;
                        }
                        return null;
                      },

                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      controller: cubit.phoneNumberController,
                      decoration: InputDecoration(
                        hintStyle: CTextStyles.font13GrayRegular,
                        labelStyle: CTextStyles.font13GrayRegular,
                        // labelText: AppKeys.phoneNumber,
                        hintText: '000000000',
                        // hintText: AppKeys.phoneNumberHint,
                        // border: const OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        //   borderRadius: BorderRadius.all(Radius.circular(15)),
                        // ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CColors.lightGray, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        // focusedBorder: const OutlineInputBorder(
                        //   borderSide:
                        //       BorderSide(color: CColors.primaryColor, width: 2.0),
                        //   borderRadius: BorderRadius.all(Radius.circular(15)),
                        // ),
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
                  ),
                ],
              ),
            ),
             TermConditionText(termsOfService: AppKeys.signintermsOfService,),
            BlocBuilder<SignInCubit, SignInState>(
              builder: (context, state) {
                final isLoading =
                    state is SignInLoading ? state.isLoading : false;

                return AppGesterDedector(
                    height: 50.h,
                    isLoading: isLoading,
                    text: AppKeys.login,
                    onTap: isLoading
                        ? () {}
                        : () {
                            //  print(PrefHelper.instance.getLangCode());
                            context.push(AppRoutes.otpScreen);
                            // if (_formKey.currentState!.validate()) {
                            // cubit.validateAndSendOtp;
                          }
                    //
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TermConditionText extends StatelessWidget {
  final String termsOfService;
  const TermConditionText({super.key, required this.termsOfService});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: termsOfService,
          style: CTextStyles.font12GrayRegular,
          children: [
            TextSpan(
              text: AppKeys.termsOfServiceLink,
              style: CTextStyles.font12PrimaryMedium,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AppUtils.openURLSheet(
                    context: context,
                    title: 'Terms and Conditions',
                    url: 'https://api.getbzz.com/page/terms-and-conditions',
                  );
                },
            ),
            TextSpan(
              text: AppKeys.and,
            ),
            TextSpan(
              text: AppKeys.privacyPolicy,
              style: CTextStyles.font13PrimarySemiBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AppUtils.openURLSheet(
                    context: context,
                    title: 'Terms and Conditions',
                    url: 'https://api.getbzz.com/page/terms-and-conditions',
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
