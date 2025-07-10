import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';

class ContainerWidget extends StatelessWidget {
  final String image;
  final String title;
  final String authorName;
  const ContainerWidget({
    super.key,
    required this.image,
    required this.title,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border(bottom: BorderSide(width: 4, color: AppColors.dark4)),
        color: AppColors.dark3,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Image.network(
              "https://img.freepik.com/free-vector/bird-colorful-gradient-design-vector_343694-2506.jpg?semt=ais_hybrid&w=740",
              width: double.infinity,
              height: 140.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(
              right: 16.w,
              left: 16.w,
              bottom: 16.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style:
                      AppTextstyles.h6w700s18.copyWith(color: AppColors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  spacing: 8.w,
                  children: [
                    CircleAvatar(radius: 20.r),
                    Text(
                      authorName,
                      style: AppTextstyles.bw600s10
                          .copyWith(color: AppColors.white),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
