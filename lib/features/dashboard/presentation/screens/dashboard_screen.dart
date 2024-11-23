import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/config/app_icons.dart';
import 'package:icar/config/app_images.dart';
import 'package:icar/config/app_keys.dart';
import 'package:icar/config/theme/app_text_styles.dart';
import 'package:icar/core/widgets/svg_icon_widget.dart';
import 'package:icar/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:icar/features/services/presentation/screens/services_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool canExit = false;

  // Replace IconData with SVG paths or assets
  final _svgIconList = <Widget>[
    SvgPicture.asset('assets/icons/dashboard_icon1.svg', height: 25, width: 25),
    SvgPicture.asset('assets/icons/dashboard_icon2.svg', height: 25, width: 25),
    SvgPicture.asset('assets/icons/dashboard_icon3.svg', height: 25, width: 25),
    SvgPicture.asset('assets/icons/dashboard_icon4.svg', height: 25, width: 25),
  ];
  final _iconNames = [
    'dashboard_icon1',
    'dashboard_icon2',
    'dashboard_icon3',
    'dashboard_icon4'
  ];
  final _activeIconNames = [
    'dashboard_icon1 copy',
    'dashboard_icon2 copy',
    'dashboard_icon3 copy',
    'dashboard_icon4 copy'
  ];
  final _labelNames = [
    AppKeys.home,
    AppKeys.services,
    AppKeys.reports,
    AppKeys.profile
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          // ignore: deprecated_member_use
          return WillPopScope(
            onWillPop: () async {
              if (state.pageIndex != 0) {
                context.read<DashboardCubit>().changePage(0);
                return false;
              } else {
                if (canExit) {
                  return true;
                } else {
                  _showExitSnackbar(context);
                  canExit = true;
                  Future.delayed(const Duration(seconds: 2), () {
                    canExit = false;
                  });
                  return false;
                }
              }
            },
            child: Scaffold(
              backgroundColor: CColors.scafBackgroundColor,
              body: _buildBody(state.pageIndex),
              bottomNavigationBar: AnimatedBottomNavigationBar.builder(
                height: 60,
                scaleFactor: 0,
                elevation: 2,
                itemCount: _svgIconList.length,
                tabBuilder: (int index, bool isActive) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        !isActive
                            ? 'assets/icons/${_iconNames[index]}.svg'
                            : 'assets/icons/${_activeIconNames[index]}.svg',
                        height: isActive ? 30 : 30,
                        width: isActive ? 30 : 30,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _labelNames[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight:
                              isActive ? FontWeight.bold : FontWeight.normal,
                          color: isActive
                              ? CColors.primaryColor
                              : CColors.inactiveColor,
                        ),
                      ),
                    ],
                  );
                },
                backgroundColor: CColors.backgroundColor,
                activeIndex: state.pageIndex,
                gapLocation: GapLocation.none,
                notchSmoothness: NotchSmoothness.softEdge,
                onTap: (index) {
                  context.read<DashboardCubit>().changePage(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ServiceScreen();
      case 2:
        return const ReportsScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const Center(child: Text('Invalid Page'));
    }
  }

  void _showExitSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppKeys.pressBackAgainToExit),
        backgroundColor: CColors.primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CColors.scafBackgroundColor,
      // appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopSection(),
              SizedBox(height: 16),
              CarListSection(),
              SizedBox(height: 16),
              MaintenanceSection(),
              SizedBox(height: 16),
              AdBanner(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(Icons.person, size: 30, color: Colors.grey),
              ),
              const SizedBox(width: 8),
              Text(AppKeys.userGreeting.replaceAll('{name}', "محمد"),
                  style: CTextStyles.font24BlackBold.copyWith(fontSize: 20)),
            ],
          ),
          Row(
            children: [
              SvgIconWidget(
                path: AppIcons.carIcon,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              SvgIconWidget(
                path: AppIcons.notificationBingIcon,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CarListSection extends StatelessWidget {
  const CarListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppKeys.cars, style: CTextStyles.font16BlackBold),
              Text(AppKeys.viewAll, style: CTextStyles.font12PrimaryMedium),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Example count
            itemBuilder: (context, index) {
              return const CarCard();
            },
          ),
        ),
      ],
    );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        width: 140,
        height: 180,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CColors.cardBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              // blurRadius: 30,
              // spreadRadius: 0,
              // offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.car,
              height: 69,
              width: 100,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 8),
            Text("هيونداي", style: CTextStyles.font16BlackMedium),
            5.verticalSpace,
            Text("2022 · بايون", style: CTextStyles.font12BlackMedium),
            5.verticalSpace,
            Text("5000 km", style: CTextStyles.font12PrimaryMedium),
          ],
        ),
      ),
    );
  }
}

class MaintenanceSection extends StatelessWidget {
  const MaintenanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("الصيانة القادمة", style: CTextStyles.font16BlackBold),
              Text("عرض الكل", style: CTextStyles.font12PrimaryMedium),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return const MaintenanceCard();
          },
        ),
      ],
    );
  }
}

class MaintenanceCard extends StatelessWidget {
  const MaintenanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child:
          // Card(
          //   color: CColors.backgroundColor,
          //   shadowColor: Colors.black.withOpacity(0.3),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CColors.cardBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              // blurRadius: 10,
              // spreadRadius: 0,
              // offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ListTile(
          trailing: Container(
            decoration: BoxDecoration(
                color: CColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.keyboard_arrow_left_rounded,
                color: CColors.primaryColor),
          ),
          title: Text(
            "تغيير الزيت - سيارة هيونداي",
            style: CTextStyles.font14DarkMedium,
          ),
          subtitle: Text(
            "15-11-2024 · 5:30 PM",
            style: CTextStyles.font14DarkMedium,
          ),
        ),
      ),
    );
  }
}

class AdBanner extends StatelessWidget {
  const AdBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.orange.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "اعلان جوجل",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(Icons.ads_click, size: 40, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Reports Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
