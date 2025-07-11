import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicEffectWidget extends StatefulWidget {
  final String title;
  const MusicEffectWidget({super.key, required this.title});

  @override
  State<MusicEffectWidget> createState() => _MusicEffectWidgetState();
}

class _MusicEffectWidgetState extends State<MusicEffectWidget> {
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
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: Icon(
            Icons.navigate_next_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
