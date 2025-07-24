import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';

class VariantButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onTap;
  final Color titleColor;
  const VariantButton(
      {super.key,
      required this.color,
      required this.title,
      required this.onTap,
      required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return PressEffect(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Text(
            maxLines: 5,
            title,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Nunito",
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}
