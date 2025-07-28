import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_state.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_state.dart';
import 'package:pima_quiz/features/auth/presentation/pages/create_new_password_screen.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final defaultPinTheme = PinTheme(
    width: 64.w,
    height: 64.w,
    textStyle: TextStyle(fontSize: 24.sp, color: Colors.white),
    decoration: BoxDecoration(
      color: AppColors.dark4,
      borderRadius: BorderRadius.circular(12.r),
    ),
  );

  @override
  void didChangeDependencies() {
    context.read<AuthBloc>().add(StartCountdown());
    super.didChangeDependencies();
  }

  String? otp;

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
        child: BlocBuilder<OtpBloc, OtpState>(
          builder: (context, state) {
            print("OTP tepasi");
            if (state is OtpSent) {
              print("OTP: ${state.otp}");
              otp = state.otp;
            }
            return Column(
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
                  textAlign: TextAlign.center,
                  "We have sent the OTP verification code to your email address. Check your email and enter the code below.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Nunito',
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 32.h),
                Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme,
                  showCursor: true,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<AuthBloc>().add(ChangeOtp(value: value));
                  },
                ),
                SizedBox(height: 24.h),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Text(
                      "Didn’t receive email ?\nYou can resend code in ${state.countdown} s",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Nunito',
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
                Spacer(),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomButton(
                      isFilled: state.otp.length == 6,
                      text: "Confirm",
                      onTap: state.otp.length == 6 &&
                              state.countdown > 0 &&
                              state.otp == otp
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CreateNewPasswordScreen(),
                                ),
                              );
                            }
                          : () {},
                    );
                  },
                ),
                SizedBox(height: 24.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
