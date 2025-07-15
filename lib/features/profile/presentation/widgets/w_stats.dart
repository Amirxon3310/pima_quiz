import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
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
                      "45",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Quizzo",
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
                      "5.6M",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Plays",
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
                      "16.8M",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Players",
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
                      "7",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Collections",
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
                      "372.5K",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Followers",
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
                      "269",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Followers",
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
  }
}
