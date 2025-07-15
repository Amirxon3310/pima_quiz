import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';

class ViewAllWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ViewAllWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextstyles.h5w700s20.copyWith(color: AppColors.white),
        ),
        PressEffect(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Ko'rish",
                style: AppTextstyles.bw600s16
                    .copyWith(color: AppColors.primary500),
              ),
              SvgPicture.asset(
                AppIcons.arrowRight,
                width: 24,
                height: 24,
                fit: BoxFit.scaleDown,
                color: AppColors.primary500,
              )
            ],
          ),
        )
      ],
    );
  }
}
