import 'package:flutter/material.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: Center(
        child: Text(
          "✅ OTP Verified Successfully!",
          style: AppTextstyles.h5w500s20.copyWith(color: AppColors.primary500),
        ),
      ),
    );
  }
}
