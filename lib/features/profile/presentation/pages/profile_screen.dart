import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_state.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/w_header.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/w_quizzolist.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/w_stats.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/w_tabs.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/w_userinfo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.h,
            children: [
              24.height,
              Header(),
              UserInfo(),
              Stats(),
              Tabs(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return Text(
                        "${state.tests?.length ?? 0} Quizzo",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Nunito",
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                  Text(
                    "Played",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nunito",
                      color: AppColors.primary500,
                    ),
                  )
                ],
              ),
              QuizzoList(),
              64.height,
            ],
          ),
        ),
      ),
    );
  }
}
