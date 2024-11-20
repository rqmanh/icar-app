import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/app_sizes.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/widgets/form/form_header_widget.dart';
import 'package:icar/core/widgets/top_bar_widget.dart';
import 'package:icar/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:icar/features/auth/presentation/widgets/signin_form_widget.dart';
import 'package:icar/features/auth/presentation/widgets/social_footer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.backgroundColor,
      body: BlocProvider(
        create: (context) => SignInCubit(),
        child: BlocListener<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is SignInSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: CColors.scafBackgroundColor,
              body: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: tDefaultSpace, vertical: tLargeSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.h),
                        const FormHeaderWidget(
                          image: AppImages.logo,
                          title: 'تسجيل الدخول إلى iCar',
                          subTitle:' مرحبًا بعودتك! سجل دخولك للوصول إلى حسابك ومتابعة إدارة وصيانة سيارتك',
                          imageHeight: 0.1,
                        ),
                        const LoginFormWidget(),
                        20.verticalSpace,
                        
                        const SignInDivider(),
                        SocialFooter(onPressed: ()=>context.push(AppRoutes.signupScreen),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignInDivider extends StatelessWidget {
  const SignInDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: CColors.dividerColor, // Customize the color if needed
        
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "أو التسجيل عن طريق", // "Or Sign in with"
            style: CTextStyles.font14GrayRegular
          ),
        ),
        const Expanded(
          child: Divider(
            color: CColors.dividerColor, // Customize the color if needed
            
          ),
        ),
      ],
    );
  }
}

