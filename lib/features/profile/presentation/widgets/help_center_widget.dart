import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';

class HelpCenterWidget extends StatelessWidget {
  final String icon;
  final String title;
  const HelpCenterWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dark4),
        color: AppColors.dark2,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Row(
          spacing: 16.w,
          children: [
            SvgPicture.asset(
              icon,
              color: AppColors.primary500,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
