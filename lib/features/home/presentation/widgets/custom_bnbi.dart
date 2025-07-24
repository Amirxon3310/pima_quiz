import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';

class CustomBnbi extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;

  const CustomBnbi({
    super.key,
    required this.icon,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          width: 28,
          height: 28,
          fit: BoxFit.scaleDown,
          color: isSelected ? AppColors.white : AppColors.grey100,
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: AppTextstyles.bw700s10.copyWith(
            color: isSelected ? AppColors.white : AppColors.grey100,
          ),
        ),
      ],
    );
  }
}
