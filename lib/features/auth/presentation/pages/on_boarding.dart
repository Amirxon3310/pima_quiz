import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_state.dart';
import 'package:pima_quiz/features/auth/presentation/pages/login_screen.dart';
import 'package:pima_quiz/features/auth/presentation/pages/select_accaount_type.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  final List<Map<String, String>> _data = [
    {
      "image": AppImages.onBoarding1,
      "text": "Create, share and play quizzes whenever and wherever you want",
    },
    {
      "image": AppImages.onBoarding2,
      "text": "Find fun and interesting quizzes to boost up your knowledge",
    },
    {
      "image": AppImages.onBoarding3,
      "text": "Play and take quiz challenges together with your friends.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                context
                    .read<AuthBloc>()
                    .add(ChangePageViewCurrentIndex(index: index));
              },
              itemCount: _data.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_data[index]['image']!, height: 300.h),
                      SizedBox(height: 20.h),
                      Text(
                        _data[index]['text']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Nunito",
                          color: Colors.white,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _data.length,
                (index) => Container(
                  margin: EdgeInsets.all(4.w),
                  width: state.pageViewCurrentIndex == index ? 32.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: state.pageViewCurrentIndex == index
                        ? AppColors.primary500
                        : AppColors.dark4,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              children: [
                CustomButton(
                  text: "GET STARTED",
                  onTap: () {
                    final currentIndex =
                        context.read<AuthBloc>().state.pageViewCurrentIndex;
                    if (currentIndex < _data.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectAccaountType(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  text: "I ALREADY HAVE AN ACCOUNT",
                  isFilled: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
