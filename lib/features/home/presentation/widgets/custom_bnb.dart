import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/home/presentation/widgets/custom_bnbi.dart';

class CustomBnb extends StatelessWidget {
  final ValueNotifier<int> selectedIndexNotifier;

  const CustomBnb({
    super.key,
    required this.selectedIndexNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndexNotifier,
      builder: (context, selectedIndex, _) {
        return ClipRRect(
          child: IntrinsicHeight(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.w, sigmaY: 20.h),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 28.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                  color: const Color(0xD9181A20),
                  border: Border(top: BorderSide(color: AppColors.dark3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    5,
                    (index) {
                      final icons = [
                        AppIcons.home,
                        AppIcons.category,
                        "assets/icons/join.svg",
                        AppIcons.plus,
                        AppIcons.profile
                      ];
                      final titles = [
                        "Home",
                        "Library",
                        "Join",
                        "Plus",
                        "Profile"
                      ];
                      return PressEffect(
                        onTap: () => selectedIndexNotifier.value = index,
                        child: CustomBnbi(
                          icon: icons[index],
                          title: titles[index],
                          isSelected: selectedIndex == index,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
