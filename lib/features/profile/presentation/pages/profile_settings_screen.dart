import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/features/auth/presentation/pages/login_screen.dart';
import 'package:pima_quiz/features/profile/presentation/pages/music_and_effects_screen.dart';
import 'package:pima_quiz/features/profile/presentation/pages/securitt_screen.dart';
import 'package:pima_quiz/features/profile/presentation/pages/personal_info_screen.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/settings_widget.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
        centerTitle: false,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            16.height,
            Container(
              width: double.infinity,
              height: 120.h,
              margin: EdgeInsets.only(bottom: 24.h),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.profileSettingsBanner),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Play quizzes without\nads and restrictions",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.h,
                          horizontal: 16.w,
                        ),
                        child: Text(
                          "GO PREMIUM",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                            color: AppColors.primary500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              spacing: 24,
              children: [
                SettingsWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalInfoScreen(),
                      ),
                    );
                  },
                  title: 'Personal Info',
                  icon: AppIcons.profile,
                  color: AppColors.transparentOrange,
                ),
                SettingsWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicAndEffectsScreen(),
                      ),
                    );
                  },
                  title: 'Music & Effects',
                  icon: AppIcons.volumeUp,
                  color: AppColors.transparentPurple,
                ),
                SettingsWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecurityScreen(),
                      ),
                    );
                  },
                  title: 'Security',
                  icon: AppIcons.shieldDone,
                  color: AppColors.transparentGreen,
                ),
                SettingsWidget(
                  onTap: () {},
                  title: 'Dark mode',
                  icon: AppIcons.show,
                  color: AppColors.transparentBlue,
                ),
                SettingsWidget(
                  onTap: () {},
                  title: 'Help center',
                  icon: AppIcons.paper,
                  color: AppColors.transparentOrange,
                ),
                SettingsWidget(
                  onTap: () {},
                  title: 'About Quiozzo',
                  icon: AppIcons.infoSquare,
                  color: AppColors.transparentPurple,
                ),
                SettingsWidget(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  title: 'Logout',
                  icon: AppIcons.logout,
                  color: AppColors.transparentRed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
