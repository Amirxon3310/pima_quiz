import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_lotties.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/custom_textfield.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_state.dart';
import 'package:pima_quiz/features/auth/presentation/pages/forgot_password.dart';
import 'package:pima_quiz/features/home/presentation/pages/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: SafeArea(
        child: Form(
          key: key,
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
                        fontFamily: "Nunito",
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
                SizedBox(height: 20.h),
                CustomTextField(
                  controller: passwordController,
                  title: 'Password',
                  isPassword: true,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Parolni kiriting';
                    }
                    if (v.length < 6) {
                      return 'Parol kamida 6 ta belgidan iborat bo‘lishi kerak';
                    }
                    return null;
                  },
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.bold,
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
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.status == AuthStatus.success) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                      );
                    }
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Column(
                          children: [
                            if (state.message != null)
                              Text(
                                state.message!,
                                style: TextStyle(color: Colors.red),
                              ),
                            SizedBox(height: 16.h),
                            state.status == AuthStatus.loading
                                ? SizedBox(
                                    height: 48.h,
                                    child: Center(
                                      child: Lottie.asset(
                                          AppLotties.splashLoading),
                                    ),
                                  )
                                : CustomButton(
                                    text: "SIGN IN",
                                    onTap: () {
                                      if (key.currentState!.validate()) {
                                        context.read<AuthBloc>().add(
                                              LoginEvent(
                                                emailController.text,
                                                passwordController.text,
                                              ),
                                            );
                                      }
                                    },
                                  ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
