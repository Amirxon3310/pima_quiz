import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_state.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          spacing: 12.h,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          state.user?.played?.toString() ?? '0',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Played",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 1,
                    height: 50.h,
                    color: AppColors.dark4,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          state.user?.point ?? '10',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Point",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 1,
                    height: 50.h,
                    color: AppColors.dark4,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "${((state.user?.played == 0 || int.parse(state.user?.point ?? '0') == 0) ? 0 : (int.parse(state.user?.point ?? '0') / ((state.user?.played ?? 0) * 10)) * 100).toInt()}%",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Success",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.dark4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "--",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "----",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 1,
                    height: 50.h,
                    color: AppColors.dark4,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "--",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "----",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 1,
                    height: 50.h,
                    color: AppColors.dark4,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "--",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "----",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.dark4,
            ),
          ],
        );
      },
    );
  }
}
