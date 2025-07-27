import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_state.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String enteredOtp = '';

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: AppTextstyles.bw500s18.copyWith(color: AppColors.white),
      decoration: BoxDecoration(
        color: AppColors.dark1,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey500),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.dark2,
          ),
          child: BlocConsumer<OtpBloc, OtpState>(
            listener: (context, state) {
              if (state is OtpVerified) {
                Navigator.pushReplacementNamed(context, '/success');
              } else if (state is OtpError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "OTP Verification",
                    style: AppTextstyles.h5w500s20
                        .copyWith(color: AppColors.white),
                  ),
                  SizedBox(height: 20.h),
                  Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: AppColors.primary500),
                      ),
                    ),
                    showCursor: true,
                    onCompleted: (pin) {
                      enteredOtp = pin;
                    },
                  ),
                  SizedBox(height: 20.h),
                  state is OtpVerifying
                      ? CircularProgressIndicator(color: AppColors.primary500)
                      : CustomButton(
                          text: "Verify",
                          onTap: () {
                            context.read<OtpBloc>().add(
                                  VerifyOtpPressed(
                                    email: widget.email,
                                    otpCode: enteredOtp,
                                  ),
                                );
                          },
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
