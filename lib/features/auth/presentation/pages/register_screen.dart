import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/custom_textfield.dart';
import 'package:pima_quiz/features/auth/data/models/user_model.dart';

class RegisterScreen extends StatefulWidget {
  final UserStatus? status;
  const RegisterScreen({super.key, this.status});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final emailController = TextEditingController();
  final ageNameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: Padding(
        padding: EdgeInsets.only(top: 72, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24.sp,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 0.6.sw,
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: AppColors.dark4,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.66,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary500,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(),
                ],
              ),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create an account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Nunito",
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '✏️',
                    style: TextStyle(fontSize: 24.sp),
                  ),
                ],
              ),
              16.height,
              Center(
                child: Text(
                  'Please complete your profile.\nDon\'t worry, your data will remain private and\nonly you can see it.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFB0B0B0),
                    fontSize: 14.sp,
                    height: 1.4,
                    fontFamily: "Nunito",
                  ),
                ),
              ),
              32.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 24.h,
                children: [
                  CustomTextField(
                    title: "Full Name",
                    controller: fullNameController,
                    hintText: "Andrew Ainsley",
                  ),
                  CustomTextField(
                    title: "Username",
                    controller: fullNameController,
                    hintText: "andrew_ainsley",
                  ),
                  CustomTextField(
                    title: "Date of Birth",
                    controller: fullNameController,
                    hintText: "12/27/1995",
                  ),
                  CustomTextField(
                    title: "Email",
                    controller: fullNameController,
                    hintText: "andrew.ainsley@yourdomain.com",
                  ),
                  CustomTextField(
                    title: "Age",
                    controller: fullNameController,
                    hintText: "25",
                  ),
                  CustomTextField(
                    title: "Password",
                    controller: fullNameController,
                    hintText: "●●●●●●●●●●●●",
                    isPassword: true,
                  ),
                  CustomTextField(
                    title: "Password Confirm",
                    controller: fullNameController,
                    hintText: "●●●●●●●●●●●●",
                    isPassword: true,
                  ),
                  24.height,
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.dark4,
          ),
          Container(
            color: AppColors.dark1,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 36.h, right: 24.w, left: 24.w, top: 24.h),
              child: CustomButton(text: "Continue", onTap: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
