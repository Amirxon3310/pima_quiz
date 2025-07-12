import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/custom_textfield.dart';
import 'package:pima_quiz/features/auth/presentation/pages/otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final controller = TextEditingController();
  final key = GlobalKey<FormState>();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forgot Password 🔑",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                  color: Colors.white,
                )),
            SizedBox(height: 8.h),
            Text(
              "Enter your email address to get an OTP code to reset your password.",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Nunito',
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 32.h),
            SizedBox(height: 8.h),
            Form(
              key: key,
              child: CustomTextField(
                controller: controller,
                title: "Email",
                hintText: 'andrew.ainsley@yourdomain.com',
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Email manzilingizni kiriting';
                  }
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(v)) {
                    return 'To‘g‘ri email manzil kiriting';
                  }
                  return null;
                },
              ),
            ),
            Spacer(),
            CustomButton(
              text: "Continue",
              onTap: () {
                if (key.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpVerificationScreen(),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
