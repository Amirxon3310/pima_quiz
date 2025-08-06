import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';

class CustomBnbi extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  final int? index;

  const CustomBnbi({
    super.key,
    required this.icon,
    required this.title,
    this.isSelected = false,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = index == 2
        ? null
        : isSelected
            ? AppColors.white
            : AppColors.grey100;

    Widget imageWidget;

    if (icon.endsWith('.svg')) {
      imageWidget = SvgPicture.asset(
        icon,
        width: 24.w,
        height: 24.h,
        color: iconColor,
      );
    } else {
      imageWidget = Image.asset(
        icon,
        width: 24.w,
        height: 24.h,
        fit: BoxFit.scaleDown,
        color: iconColor,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        imageWidget,
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
