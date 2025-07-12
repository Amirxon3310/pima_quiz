import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_lotties.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/custom_textfield.dart';
import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_state.dart';
import 'package:pima_quiz/features/home/presentation/pages/home_screen.dart';

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
  final phoneNumberController = TextEditingController();
  final ageNameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final key = GlobalKey<FormState>();

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
              Form(
                key: key,
                child: Column(
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
                      controller: userNameController,
                      hintText: "andrew_ainsley",
                    ),
                    CustomTextField(
                      title: "Date of Birth",
                      controller: dateOfBirthController,
                      hintText: "12/27/1995",
                    ),
                    CustomTextField(
                      title: "Email",
                      controller: emailController,
                      hintText: "andrew.ainsley@yourdomain.com",
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
                    CustomTextField(
                      title: "Age",
                      controller: ageNameController,
                      hintText: "25",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    CustomTextField(
                      title: "Phone number",
                      controller: phoneNumberController,
                      hintText: "+998 77 777 77 77",
                    ),
                    CustomTextField(
                      title: "Password",
                      controller: passwordController,
                      hintText: "●●●●●●●●●●●●",
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
                    CustomTextField(
                      title: "Password Confirm",
                      controller: passwordConfirmController,
                      hintText: "●●●●●●●●●●●●",
                      isPassword: true,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Parolni qayta kiriting';
                        }
                        if (passwordController.text !=
                            passwordConfirmController.text) {
                          return "Parollar mos emas, Parollar bir xil bo'lishi kerak";
                        }
                        return null;
                      },
                    ),
                    24.height,
                  ],
                ),
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
              child: BlocListener<AuthBloc, AuthState>(
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
                    return state.status == AuthStatus.loading
                        ? Center(
                            child: SizedBox(
                              height: 48.h,
                              child: Center(
                                child: Lottie.asset(
                                  AppLotties.splashLoading,
                                ),
                              ),
                            ),
                          )
                        : Column(
                            spacing: 16.h,
                            children: [
                              state.message != null
                                  ? Text(state.message!,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 255, 0, 0),
                                      ))
                                  : SizedBox(),
                              CustomButton(
                                text: "Continue",
                                onTap: () {
                                  if (key.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                          RegisterEvent(
                                            UserModel(
                                              id: '',
                                              age: int.tryParse(
                                                      ageNameController.text) ??
                                                  10,
                                              fullName: fullNameController.text,
                                              email: emailController.text,
                                              phoneNumber:
                                                  phoneNumberController.text,
                                              username: userNameController.text,
                                              userStatus: widget.status,
                                              birthday: DateTime
                                                  .now(), // DateTime.parse(dateOfBirthController.text),
                                              createdAt: DateTime.now(),
                                            ),
                                            passwordController.text,
                                          ),
                                        );
                                  }
                                },
                              ),
                            ],
                          );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
