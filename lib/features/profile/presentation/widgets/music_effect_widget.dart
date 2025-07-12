import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';

class MusicEffectSwitch extends StatefulWidget {
  final String title;
  const MusicEffectSwitch({super.key, required this.title});

  @override
  State<MusicEffectSwitch> createState() => _MusicEffectSwitchState();
}

class _MusicEffectSwitchState extends State<MusicEffectSwitch> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Nunito",
            color: Colors.white,
          ),
        ),
        Spacer(),
        Switch.adaptive(
          padding: EdgeInsets.all(0),
          value: isSwitched,
          activeColor: AppColors.primary500,
          inactiveThumbColor: AppColors.dark4,
          thumbColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.white;
              }
              return Colors.white;
            },
          ),
          onChanged: (bool value) {
            setState(() {
              isSwitched = value;
            });
          },
        )
      ],
    );
  }
}
