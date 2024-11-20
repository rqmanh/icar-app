import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/core/widgets/custom_asset_image_widget.dart';
import 'package:icar/core/widgets/form/form_header_widget.dart';
import 'package:icar/features/auth/presentation/cubit/sign_up_cubit.dart';
// Import the custom widget if needed
import 'package:icar/features/auth/presentation/widgets/create_account_form.dart'; // Import the CSC Picker package

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.scafBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: CColors.primaryColor),
          onPressed: () => context.pop()
        ),
        backgroundColor: CColors.scafBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
      
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                   const FormHeaderWidget(
                          image: AppImages.logo,
                          title: 'أنشئ حسابك على iCar',
                          subTitle:"ابدأ رحلتك معنا لإدارة سيارتك بسهولة وفعالية. سجّل حسابك الآن وتمتع بخدمات التنبيهات والتقارير المفصلة لصيانة سيارتك",
                          imageHeight: 0.1,
                        ),
                  const SizedBox(height: 20),
                  BlocProvider(
                    create: (context) => SignupCubit(),
                    child: BlocListener<SignupCubit, SignupState>(
                      listener: (context, state) {
                        if (state is SignupGenderChanged) {
                          // You can handle gender changes here if necessary
                        }
                        if (state is SignupCountryChanged) {
                          // Handle country change if needed
                        }
                        if (state is SignupCityChanged) {
                          // Handle city change if needed
                        }
                      },
                      child: const CreateAccountForm(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
