import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  const CategoryWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16.r),
      child: Stack(
        children: [
          Image.network(
            "https://t3.ftcdn.net/jpg/14/00/03/24/360_F_1400032430_oXDjfVkNTnOAeHZpSMbQsZKQOH4NB7Nf.jpg",
            width: 180.w,
            height: 120.h,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 12.h,
            left: 12.w,
            child: Text(
              title,
              style: AppTextstyles.bw700s16.copyWith(color: AppColors.white),
            ),
          )
        ],
      ),
    );
  }
}
