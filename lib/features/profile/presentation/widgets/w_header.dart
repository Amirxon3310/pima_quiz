import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/profile/presentation/pages/profile_settings_screen.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 28.h,
          child: Image.asset(AppImages.splashImage),
        ),
        8.width,
        Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Row(
          spacing: 12.w,
          children: [
            SizedBox(
              height: 28.h,
              child: SvgPicture.asset(
                AppIcons.send,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 28.h,
              child: SvgPicture.asset(
                AppIcons.activity,
                color: Colors.white,
              ),
            ),
            PressEffect(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileSettingsScreen(),
                  ),
                );
              },
              child: SizedBox(
                height: 28.h,
                child: SvgPicture.asset(
                  AppIcons.setting,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
