import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      appBar: AppBar(
        backgroundColor: AppColors.dark1,
        surfaceTintColor: AppColors.dark1,
        centerTitle: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              AppIcons.arrowLeft,
              width: 28.w,
              height: 28.h,
              color: AppColors.white,
            ),
          ),
        ),
        title: Text(
          "Yangiliklar",
          style: AppTextstyles.h4w700s24.copyWith(color: AppColors.white),
        ),
        actions: [
          SvgPicture.asset(
            AppIcons.search,
            width: 28,
            height: 28,
            color: AppColors.white,
          ),
          SizedBox(
            width: 24.w,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.dark4,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 16.w,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  ),
                  child: Image.network(
                    "https://img.freepik.com/free-vector/bird-colorful-gradient-design-vector_343694-2506.jpg?semt=ais_hybrid&w=740",
                    width: 140.w,
                    height: 110.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Bu title",
                      style: AppTextstyles.h6w700s18
                          .copyWith(color: AppColors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "2 months ago",
                          style: AppTextstyles.bw500s10
                              .copyWith(color: AppColors.white),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "5.6K plays",
                          style: AppTextstyles.bw500s10
                              .copyWith(color: AppColors.white),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      spacing: 8.w,
                      children: [
                        CircleAvatar(radius: 10.r),
                        Text(
                          "Titus Kitamura",
                          style: AppTextstyles.bw600s10,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
