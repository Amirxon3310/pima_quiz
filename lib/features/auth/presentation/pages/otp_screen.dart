import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_state.dart';
import 'package:pima_quiz/features/auth/presentation/pages/verification_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.dark2,
          ),
          child: BlocConsumer<OtpBloc, OtpState>(
            listener: (context, state) {
              if (state is OtpSent) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        VerificationScreen(email: emailController.text),
                  ),
                );
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
                  TextFormField(
                    controller: emailController,
                    cursorColor: AppColors.primary500,
                    style:
                        AppTextstyles.bw400s18.copyWith(color: AppColors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your email address",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.grey500),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(color: AppColors.primary500),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  state is OtpSending
                      ? CircularProgressIndicator(color: AppColors.primary500)
                      : CustomButton(
                          text: "Send Code",
                          onTap: () {
                            final email = emailController.text.trim();
                            if (email.isNotEmpty) {
                              context
                                  .read<OtpBloc>()
                                  .add(SendOtpPressed(email));
                            }
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
