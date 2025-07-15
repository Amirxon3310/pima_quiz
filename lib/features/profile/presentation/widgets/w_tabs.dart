import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 1, child: TabButton(title: "Quizzo", isSelected: true)),
        Flexible(flex: 1, child: TabButton(title: "Collections")),
        Flexible(flex: 1, child: TabButton(title: "About")),
      ],
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  const TabButton({super.key, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary500 : Colors.transparent,
          border: Border.all(color: AppColors.primary500),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
