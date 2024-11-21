import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icar/config/app_colors.dart';
import 'package:icar/features/dashboard/presentation/cubit/dashboard_cubit.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool canExit = false;
  @override
  void initState() {
    super.initState();
  }

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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Press back again to exit'),
                      backgroundColor: CColors.primaryColor,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  canExit = true;
                  Timer(const Duration(seconds: 2), () {
                    canExit = false;
                  });
                  return false;
                }
              }
            },
            child: Scaffold(
              backgroundColor: CColors.scafBackgroundColor,
              body: _body(state.pageIndex),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: CColors.backgroundColor,
                fixedColor: CColors.backgroundColor,
               
                unselectedItemColor: CColors.backgroundColor,
                
                currentIndex: state.pageIndex,
                onTap: (index) {
                  if (index == 1) {
                    // Refresh reel or other logic
                  }
                  context.read<DashboardCubit>().changePage(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home,color: CColors.borderColor,),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.video_library),
                    label: 'Services',
                  ),
              
                  BottomNavigationBarItem(
                    icon: Icon(Icons.event),
                    label: 'Reports',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _body(int pageIndex) {
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
}

class HomeScreen extends StatelessWidget {
const HomeScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Container();
  }
}
class ServiceScreen extends StatelessWidget {
const ServiceScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Container();
  }
}
class ReportsScreen extends StatelessWidget {
const ReportsScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Container();
  }
}
class ProfileScreen extends StatelessWidget {
const ProfileScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Container();
  }
}