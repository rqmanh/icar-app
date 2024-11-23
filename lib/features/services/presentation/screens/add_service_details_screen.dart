import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icar/app.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:icar/core/widgets/custom_date_bottom_sheet.dart';
import 'package:icar/core/widgets/custom_text_field.dart';
import 'package:icar/features/services/presentation/cubit/services_cubit.dart';
import 'package:icar/features/services/presentation/cubit/services_state.dart';
import 'package:iconsax/iconsax.dart';

class AddServiceDetailsScreen extends StatelessWidget {
  const AddServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<ServicesCubit>().fetchCars();
    return Scaffold(
      backgroundColor: CColors.scafBackgroundColor,
      appBar: AppBar(
        backgroundColor: CColors.scafBackgroundColor,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: CColors.borderColor),
              color: CColors.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                color: CColors.black),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        title: const Text(
          "تفاصيل صيانة الخدمة",
          style: TextStyle(color: CColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: CColors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'اختر السيارة لإضافة الخدمة',
                            style: CTextStyles.font14BlackMedium,
                          ),
                          const SizedBox(height: 15),
                          _buildCarPickerList(context, state),
                          const SizedBox(height: 20),
                          _buildServiceDetailsForm(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    AppGesterDedector(onTap: () {}, text: "حفظ")
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCarPickerList(BuildContext context, ServicesState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.cars.isEmpty) {
      // Show "Add" button when no cars are available
      return Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // Add car logic goes here
              // Show a screen or dialog for adding a new car
            },
            child: Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: CColors.backgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: CColors.borderColor),
              ),
              child: const Icon(
                Icons.add,
                color: CColors.primaryColor,
                size: 30,
              ),
            ),
          )
        ],
      );
    }

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: state.cars.length + 1, // Add one for the "Add Car" button
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          if (index == state.cars.length) {
            // Display "Add Car" button at the end of the list
            return GestureDetector(
              onTap: () {
                // Add car logic goes here
                // Show a screen or dialog for adding a new car
              },
              child: Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: CColors.borderColor),
                ),
                child: const Icon(
                  Icons.add,
                  color: CColors.primaryColor,
                  size: 30,
                ),
              ),
            );
          }

          final car = state.cars[index];
          return GestureDetector(
            onTap: () => context.read<ServicesCubit>().selectCar(car),
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: CColors.backgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: state.selectedCar == car
                      ? CColors.primaryColor
                      : CColors.borderColor,
                ),
              ),
              child: Image.asset(
                car.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildServiceDetailsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextField(label: 'قراءة العداد', hintText: 'كيلومتر/ميل'),
        const SizedBox(height: 15),
        const CustomTextField(
          label: 'تكلفة الصيانة',
          suffixText: 'SAR',
          hintText: 'ادخل تكلفة الصيانة',
        ),
        const SizedBox(height: 15),
        // _buildDatePicker(label: 'تاريخ الصيانة القادمة'),
        CustomDateTextField(
          label: 'تاريخ الصيانة القادمة',
          hintText: 'تاريخ الصيانة القادمة',
          icon: Iconsax.calendar,
          controller: TextEditingController(),
          initialDate: DateTime.now(),
          onDateSelected: (date) {
            // createEditEventController.startDateController.text =
            //     date.toLocal().toString().split(' ')[0];
          },
        ),
        const SizedBox(height: 15),
        const CustomTextField(label: 'الملاحظات', hintText: '', maxLines: 3),
      ],
    );
  }

}
