import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';

class PodiumWidget extends StatelessWidget {
  final String name;
  final String image;
  final String point;
  final String stepType;
  final String medalType;
  final double containerWidth;
  final double containerHeight;
  final Color? color;
  final LinearGradient? gradient;
  final double medalWidth;
  final double medalHeight;
  // final double scrollPercent;
  const PodiumWidget({
    super.key,
    required this.name,
    required this.image,
    required this.point,
    required this.stepType,
    required this.medalType,
    required this.containerWidth,
    required this.containerHeight,
    this.color,
    this.gradient,
    required this.medalWidth,
    required this.medalHeight,
    // required this.scrollPercent
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(fit: FlexFit.loose, child: SizedBox()),
        CircleAvatar(radius: 36.r, backgroundImage: NetworkImage(image)),
        Text(
          name,
          style: AppTextstyles.h5w700s20.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 4.h),
        Chip(
          label: Text(
            point,
            style: AppTextstyles.bw600s14.copyWith(color: AppColors.white),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          backgroundColor: AppColors.dark2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100.r),
            side: BorderSide(color: AppColors.dark2),
          ),
        ),
        SizedBox(height: 12.h),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/$stepType.svg",
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(color: color, gradient: gradient),
                ),
                Positioned(
                  top: 0,
                  child: SvgPicture.asset(
                    "assets/icons/$medalType.svg",
                    width: medalWidth,
                    height: medalHeight,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
