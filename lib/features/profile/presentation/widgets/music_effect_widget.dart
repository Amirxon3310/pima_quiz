import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';

class MusicEffectSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const MusicEffectSwitch({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Nunito",
            color: Colors.white,
          ),
        ),
        Spacer(),
        Switch.adaptive(
          value: value,
          activeColor: AppColors.primary500,
          inactiveThumbColor: AppColors.dark4,
          thumbColor: MaterialStateProperty.resolveWith((_) => Colors.white),
          onChanged: onChanged,
        )
      ],
    );
  }
}
