import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';

class CustomDatetimeWidget extends StatelessWidget {
  final String title;
  final DateTime? valueText;
  final VoidCallback onTap;

  const CustomDatetimeWidget({
    super.key,
    required this.title,
    this.valueText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PressEffect(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: "Nunito",
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xff6949FF)),
                ),
              ),
              child: Text(
                "${valueText?.month.toString().padLeft(2, '0') ?? "--"}/"
                "${valueText?.day.toString().padLeft(2, '0') ?? "--"}/"
                "${valueText?.year ?? "----"}",
                style: TextStyle(
                  fontFamily: "Nunito",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
