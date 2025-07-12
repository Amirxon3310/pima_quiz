import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/custom_textfield.dart';
import 'package:pima_quiz/features/home/presentation/pages/home_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
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
            Text("Create new password 🔐",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                  color: Colors.white,
                )),
            SizedBox(height: 8.h),
            Text(
              "Save the new password in a safe place. If you forget it, you’ll have to reset again.",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Nunito',
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 32.h),
            CustomTextField(
                controller: passwordController,
                title: "Create a new password",
                hintText: "●●●●●●●●●●●●",
                isPassword: true),
            SizedBox(height: 32.h),
            CustomTextField(
                controller: passwordConfirmController,
                title: "Confirm a new password",
                hintText: "●●●●●●●●●●●●",
                isPassword: true),
            SizedBox(height: 16.h),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (_) {},
                  activeColor: Colors.deepPurple,
                ),
                Text(
                  "Remember me",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Nunito',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              text: "Continue",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
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
