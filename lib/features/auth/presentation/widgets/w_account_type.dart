import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';

class WAccountType extends StatelessWidget {
  final IconData icon;
  final String title;
  final LinearGradient gradient;
  const WAccountType({
    super.key,
    required this.icon,
    required this.title,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.dark4,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 92,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              ),
            ),
            child: Center(
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff1F222A).withAlpha(32),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 26.w,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 27),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "Nunito",
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
