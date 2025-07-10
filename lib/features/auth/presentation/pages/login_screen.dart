import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181A20),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              InkWell(
                child: Icon(Icons.arrow_back, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(
                    "Hello there ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("👋", style: TextStyle(fontSize: 26)),
                ],
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                controller: emailController,
                title: 'Email',
                hintText: 'andrew.ainsley@yourdomain.com',
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                controller: passwordController,
                title: 'Password',
                isPassword: true,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (v) {},
                    activeColor: Color(0xFF7B61FF),
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF7B61FF),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade700)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text("or", style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade700)),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: Color(0xFF1C1C2E),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.grey.shade800),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.google,
                      height: 20.h,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Continue with Google",
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomButton(text: "SIGN IN", onTap: () {}),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
