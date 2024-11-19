import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_sizes.dart';
import 'package:icar/core/utils/helper_controller.dart';
import 'package:icar/core/utils/spacing.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:icar/features/auth/presentation/cubit/login_cubit.dart';
import 'package:phone_form_field/phone_form_field.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 5),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: PhoneFormField(
                onEditingComplete: () {},
                // countryButtonStyle: const CountryButtonStyle(
                //   flagSize: 30,
                //   textStyle: TextStyle(color: CColors.black),
                // ),
                countrySelectorNavigator:
                    const CountrySelectorNavigator.draggableBottomSheet(),
                cursorColor: CColors.primaryColor,
                autovalidateMode: AutovalidateMode.disabled,
                style: const TextStyle(color: CColors.black),
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
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                onChanged: (phone) {
                  context.read<LoginCubit>().setPhoneNumber(phone.nsn);
                },
                controller: PhoneController(
                  initialValue: PhoneNumber(isoCode: IsoCode.SA, nsn: context.read<LoginCubit>().state.phoneNumber,)
                ),
                decoration: InputDecoration(
                  hintStyle: CTextStyles.font14WhiteMedium.copyWith(color: CColors.black,),
                  labelStyle: CTextStyles.font14WhiteMedium.copyWith(color: CColors.black,),
                  labelText: AppKeys.phoneNumber,
                  // hintText: AppKeys.phoneNumberHint.tr,
                  // border: const OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  //   borderRadius: BorderRadius.all(Radius.circular(15)),
                  // ),
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(color: CColors.borderColor, width: 2.0),
                  //   borderRadius: BorderRadius.all(Radius.circular(15)),
                  // ),
                  // focusedBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(color: CColors.primaryColor, width: 2.0),
                  //   borderRadius: BorderRadius.all(Radius.circular(15)),
                  // ),
                  // errorBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.red, width: 2.0),
                  //   borderRadius: BorderRadius.all(Radius.circular(15)),
                  // ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(9),
                ],
              ),
            ),
            // TermConditionCheakbox(
            //   controller: context.read<LoginCubit>(),
            // ),
            verticalSpace(10),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return AppGesterDedector(
                  height: 50.h,
                  isLoading: state.isLoading,
                  text: AppKeys.login,
                  onTap: state.isLoading
                      ? () {}
                      : () {
                          if (state.isTermsChecked) {
                            context.read<LoginCubit>().sendOtp();
                          } else {
                            Helper.warningSnackBar(
                              title: 'Oops',
                              message:
                                  'Please agree to the terms and conditions to continue',
                            );
                          }
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
