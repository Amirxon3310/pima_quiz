import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isFilled;
  final Color? fillColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isFilled = true,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return PressEffect(
      onTap: () {
        onTap!();
      },
      child: SizedBox(
        width: double.infinity,
        height: 48.h,
        child: Container(
          decoration: BoxDecoration(
            color:
                isFilled ? fillColor ?? AppColors.primary500 : AppColors.dark3,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: fillColor != null ? AppColors.primary500 : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
