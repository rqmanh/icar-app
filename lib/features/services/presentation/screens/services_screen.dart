import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_icons.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/routre/app_routes.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/widgets/buttons/primary_button.dart';
import 'package:icar/core/widgets/custom_text_field.dart';
import 'package:icar/core/widgets/svg_icon_widget.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  // Method to build each service icon with a label
  Widget buildServiceIcon({
    required String iconPath,
    required String label,
    double width = 30,
    double height = 30,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CirclarSvgIconWidget(
          path: iconPath,
          width: width,
          height: height,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 80),
          child: Text(
            label,
            style: CTextStyles.font12BlackMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppKeys.services),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildServiceIcon(
                    iconPath: AppIcons.service1,
                    label: "تغيير زيت",
                    width: 35,
                    height: 35),
                buildServiceIcon(
                    iconPath: AppIcons.service2, label: "تغيير الفلتر"),
                buildServiceIcon(
                    iconPath: AppIcons.service3, label: "فحص المحرك"),
                buildServiceIcon(
                    iconPath: AppIcons.service4, label: "صيانة البطارية"),
              ],
            ),
            const SizedBox(height: 10), // Space between rows
            // Second Row of Services
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildServiceIcon(
                    iconPath: AppIcons.service5,
                    label: "ضبط المحاذاة والتوازن"),
                buildServiceIcon(
                    iconPath: AppIcons.service6, label: "فحص نظام التبريد"),
                buildServiceIcon(
                    iconPath: AppIcons.service7, label: "فحص المحرك"),
                buildServiceIcon(
                    iconPath: AppIcons.service8,
                    label: "صيانة الإطارات",
                    width: 35,
                    height: 35),
              ],
            ),
            400.verticalSpace,
            AppGesterDedector(
                onTap: () {
                  // _showCustomBottomSheet(context);
                  context.push(AppRoutes.addServiceDetails);
                },
                text: "اضافة خدمة صيانة جديدة")
          ],
        ),
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context) {
    TextEditingController serviceController = TextEditingController();

    showModalBottomSheet(
      backgroundColor: CColors.backgroundColor,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return CustomBottomSheet(
          controller: serviceController,
          onAddService: (newService) {
            // Handle the new service added
            print('New Service Added: $newService');
            // You can add logic to save or use the service name here
            context.push(AppRoutes.addServiceDetails);
          },
        );
      },
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onAddService;

  const CustomBottomSheet({
    super.key,
    required this.controller,
    required this.onAddService,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bottom Sheet handle
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12)),
          ),
          const SizedBox(height: 10),

          // Label for the bottom sheet
          const Text(
            'اضافة خدمة صيانة جديدة',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 20),

          // TextFormField to enter the service name
          CustomTextField(
            controller: controller,
            label: 'اسم الخدمة',
            hintText: 'ادخل اسم الخدمة',
          ),
          const SizedBox(height: 20),

          // Submit Button

          AppGesterDedector(
            onTap: () {
              String newService = controller.text;
              if (newService.isNotEmpty) {
                onAddService(newService);
                context.pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('يرجى إدخال اسم الخدمة')),
                );
              }
            },
            text: ' إضافة الخدمة',
          ),
          30.verticalSpace
        ],
      ),
    );
  }
}
