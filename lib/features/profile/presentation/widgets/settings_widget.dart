import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';

class SettingsWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final String title;
  final Function onTap;
  const SettingsWidget({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PressEffect(
      onTap: () {
        onTap();
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          spacing: 20,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withAlpha(20),
                shape: BoxShape.circle,
              ),
              width: 56,
              height: 56,
              child: SizedBox(
                child: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(
                    icon,
                    color: color,
                  ),
                ),
              ),
            ),
            Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  fontFamily: "Nunito",
                  color: Colors.white,
                )),
            Spacer(),
            SizedBox(
              height: 20.h,
              child: SvgPicture.asset(
                AppIcons.arrowRight,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
