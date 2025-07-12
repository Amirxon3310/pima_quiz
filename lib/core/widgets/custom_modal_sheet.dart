import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';

void customBottomSheet({
  required BuildContext context,
  required String title,
  Color? colorTitle,
  required Widget content,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.35,
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.dark2,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              child: Column(
                spacing: 20.h,
                children: [
                  Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: AppColors.dark4,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nunito",
                      color: colorTitle,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: AppColors.dark4,
                  ),
                  content
                ],
              ),
            ),
          ),
        ),
      );
    },
    barrierColor: Colors.black.withAlpha(25),
  );
}
