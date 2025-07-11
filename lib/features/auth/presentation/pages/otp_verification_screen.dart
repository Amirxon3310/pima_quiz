import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/features/auth/presentation/pages/create_new_password_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      appBar: AppBar(
        backgroundColor: AppColors.dark1,
        elevation: 0,
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Text("You’ve got mail 📧",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                  color: Colors.white,
                )),
            SizedBox(height: 8.h),
            Text(
              "We have sent the OTP verification code to your email address. Check your email and enter the code below.",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Nunito',
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => Container(
                  width: 64.w,
                  height: 64.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '*',
                    style: TextStyle(fontSize: 24.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "Didn’t receive email?\nYou can resend code in 55 s",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Nunito',
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            CustomButton(
              text: "Confirm",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateNewPasswordScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
