import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:icar/core/widgets/custom_loading_widget.dart';
import 'package:icar/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:icar/features/services/presentation/cubit/services_state.dart';

class UserCarsScreen extends StatelessWidget {
  const UserCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سياراتي'),
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: BlocBuilder<CarsCubit, CarsState>(
          builder: (context, state) {
            if (state is CarsLoading) {
              return const CustomLottieLoading();
            } else if (state is CarsLoaded) {
              final cars = state.cars;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: cars.length,
                      itemBuilder: (context, index) {
                        final car = cars[index];
                        return CarCard(
                          carName: car.brand,
                          carDetails: "${car.model} · ${car.type}",
                          isActive: car.isActive,
                          onSwitchChanged: (isActive) {
                            context
                                .read<CarsCubit>()
                                .toggleCarActiveStatus(car.id);
                          },
                        );
                      },
                    ),
                  ),
                  AppGesterDedector(
                      onTap: () {
                        context.read<CarsCubit>().addCar(
                              Car(
                                id: DateTime.now().millisecondsSinceEpoch,
                                brand: 'New Brand',
                                type: 'New Type',
                                model: '2024',
                                licensePlateArabic: 'جديد',
                                licensePlateEnglish: 'NEW123',
                                imageUrl: '',
                                isActive: false,
                              ),
                            );
                        context.push(AppRoutes.addNewCarScreen);
                      },
                      text: 'اضافة سياره جديدة'),
                  const SizedBox(height: 50),
                ],
              );
            } else if (state is CarsError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No cars available.'));
            }
          },
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final String carName;
  final String carDetails;
  final bool isActive;
  final ValueChanged<bool> onSwitchChanged;

  const CarCard({
    super.key,
    required this.carName,
    required this.carDetails,
    required this.isActive,
    required this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CColors.cardBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Switch.adaptive(
              activeColor: CColors.primaryColor,
              value: isActive,
              onChanged: onSwitchChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          Image.asset(
            AppImages.car,
            height: 90,
            width: 120,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 8),
          Text(carName, style: CTextStyles.font16BlackMedium),
          const SizedBox(height: 5),
          Text(carDetails, style: CTextStyles.font12BlackMedium),
        ],
      ),
    );
  }
}
