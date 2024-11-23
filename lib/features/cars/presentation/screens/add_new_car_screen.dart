import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/widgets/app_cached_image.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:icar/core/widgets/custom_asset_image_widget.dart';
import 'package:icar/core/widgets/custom_date_bottom_sheet.dart';
import 'package:icar/core/widgets/custom_dropdown_field.dart';
import 'package:icar/core/widgets/custom_text_field.dart';
import 'package:icar/features/cars/presentation/cubit/add_new_car_cubit.dart';
import 'package:icar/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:iconsax/iconsax.dart';

class AddNewCarScreen extends StatelessWidget {
  const AddNewCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addNewCarCubit = context.read<AddNewCarCubit>();
    return Scaffold(
      backgroundColor: CColors.scafBackgroundColor,
      appBar: AppBar(
        backgroundColor: CColors.scafBackgroundColor,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: CColors.borderColor),
              color: CColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                color: CColors.black),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        title: const Text(
          'اضافة سياره جديدة',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: BlocBuilder<AddNewCarCubit, AddNewCarState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: CColors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'صورة السيارة',
                            style: CTextStyles.font14BlackMedium,
                          ),
                          const SizedBox(height: 15),
                          _buildImagePickerGrid(context, addNewCarCubit),
                          const SizedBox(height: 20),
                          _buildCardDetailsForm(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    AppGesterDedector(onTap: () {}, text: "حفظ"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

// Widget implementation
  Widget _buildImagePickerGrid(BuildContext context, AddNewCarCubit cubit) {
    return GestureDetector(
      onTap: () => cubit.pickImages(),
      child: Container(
        height: 133.h,
        decoration: BoxDecoration(
          color: CColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: CColors.white),
        ),
        child: BlocBuilder<AddNewCarCubit, AddNewCarState>(
          builder: (context, state) {
            return GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: state.existingImages.length +
                  state.pickedImages.length +
                  1, // +1 for the add button
              itemBuilder: (context, index) {
                if (index < state.existingImages.length) {
                  return _buildExistingImage(context, cubit, index, state);
                } else if (index <
                    state.existingImages.length + state.pickedImages.length) {
                  return _buildPickedImage(context, cubit, index, state);
                } else {
                  return _buildAddImageButton(context, cubit);
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildPickedImage(BuildContext context, AddNewCarCubit cubit,
      int index, AddNewCarState state) {
    final newIndex = index - state.existingImages.length;
    final newImage = state.pickedImages[newIndex];
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: FileImage(newImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: GestureDetector(
            onTap: () => cubit.removeNewImage(newIndex),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddImageButton(BuildContext context, AddNewCarCubit cubit) {
    return GestureDetector(
      onTap: () => cubit.pickImages(),
      child: Container(
        decoration: BoxDecoration(
          color: CColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: CColors.borderColor),
        ),
        child: Center(
          child: Icon(Icons.add, size: 40, color: Colors.grey[500]),
        ),
      ),
    );
  }

  Widget _buildExistingImage(BuildContext context, AddNewCarCubit cubit,
      int index, AddNewCarState state) {
    final image = state.existingImages[index];
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AppCachedImage(
              imageUrl: image,
              width: 200.w,
              height: 200.h,
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: GestureDetector(
            onTap: () => cubit.removeExistingImage(index),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardDetailsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        CustomDropdownField(
          label: 'ماركة السيارة',
          hintText: 'هيونداي',
          options: const [],
          controller: TextEditingController(),
          onSelected: (brand) {},
        ),
        const SizedBox(height: 15),
        CustomDropdownField(
          label: 'النوع',
          hintText: 'بايون يون',
          options: const [],
          controller: TextEditingController(),
          onSelected: (brand) {},
        ),
        const SizedBox(height: 15),
        CustomDropdownField(
          label: 'الموديل',
          hintText: '2024',
          options: const [],
          controller: TextEditingController(),
          onSelected: (brand) {},
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          label: 'رقم اللوحة بالعربية (اختياري)',
          hintText: 'ر ق م 51234',
        ),
        const SizedBox(height: 15),
        const CustomTextField(
          label: 'رقم اللوحة بالإنجليزية (اختياري)',
          hintText: 'R Q M 5123',
        ),
      ],
    );
  }
}

class SuccessAddNewCarScreen extends StatelessWidget {
  const SuccessAddNewCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAssetImageWidget(AppImages.successImage),
            10.verticalSpace,
            Text(
              'تمت إضافة السيارة بنجاح',
              style: CTextStyles.font20DarkBold,
            ),
            10.verticalSpace,
            Text(
              textAlign: TextAlign.center,
              'يمكنك الآن إضافة خدمات الصيانة لسيارتك، وإضافة مواعيد الصيانة والحصول على تقارير شاملة',
              style: CTextStyles.font14BlackMedium,
            ),
            30.verticalSpace,
            AppGesterDedector(onTap: () {
              context.go(AppRoutes.dashboardScreen);
            }, text: 'العودة إلى الشاشة الرئيسية')
          ],
        ),
      ),
    );
  }
}
