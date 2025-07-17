import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/features/create/presentation/pages/create_screen.dart';
import 'package:pima_quiz/features/home/presentation/pages/home_screen.dart';
import 'package:pima_quiz/features/join/presentation/pages/join_screen.dart';
import 'package:pima_quiz/features/library/presentation/pages/library_screen.dart';
import 'package:pima_quiz/features/profile/presentation/pages/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    HomeScreen(),
    LibraryScreen(),
    JoinScreen(),
    CreateScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        child: Material(
          color: AppColors.dark3,
          child: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              backgroundColor: AppColors.dark3,
              selectedItemColor: Colors.white,
              unselectedItemColor: AppColors.grey500,
              selectedLabelStyle:
                  AppTextstyles.bw700s10.copyWith(color: AppColors.white),
              unselectedLabelStyle:
                  AppTextstyles.bw500s10.copyWith(color: AppColors.grey500),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.home,
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                    color: AppColors.grey100,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.category,
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                    color: AppColors.grey100,
                  ),
                  label: "Library",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/join.svg",
                    width: 28,
                    height: 28,
                    fit: BoxFit.scaleDown,
                  ),
                  label: "Join",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.plus,
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                    color: AppColors.grey100,
                  ),
                  label: "Create",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.profile,
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                    color: AppColors.grey100,
                  ),
                  label: "Profile",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        // color: Color(0xFF181A20).wi
      ),
      child: Row(
        children: [],
      ),
    );
  }
}
