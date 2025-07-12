import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/constants/app_constants.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/features/home/domain/entities/news_entity.dart';

class NewsDetailsScreen extends StatefulWidget {
  final NewsEntity news;
  const NewsDetailsScreen({
    super.key,
    required this.news,
  });

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      appBar: AppBar(
        backgroundColor: AppColors.dark1,
        surfaceTintColor: AppColors.dark1,
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
        actions: [
          SvgPicture.asset(
            AppIcons.send,
            width: 28,
            height: 28,
            color: AppColors.white,
          ),
          SizedBox(width: 20.w),
          SvgPicture.asset(
            AppIcons.moreCircle,
            width: 28,
            height: 28,
            color: AppColors.white,
          ),
          SizedBox(width: 24.w)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16.r),
              child: Image.network(
                widget.news.url.isNotEmpty
                    ? widget.news.url
                    : AppConstants.errorImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120.h,
              ),
            ),
            SizedBox(height: 24.h),
            // Row(
            //   children: [
            //     CircleAvatar(radius: 30.r),
            //     SizedBox(width: 20.w),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           mainAxisSize: MainAxisSize.min,
            //           spacing: 8.w,
            //           children: [
            //             Text(
            //               widget.news.authorName,
            //               style: AppTextstyles.h5w500s20
            //                   .copyWith(color: AppColors.white),
            //             ),
            //             Icon(
            //               Icons.verified,
            //               color: AppColors.blue,
            //             )
            //           ],
            //         ),
            //         Text(
            //           "Username",
            //           style: AppTextstyles.bw500s14.copyWith(
            //             color: AppColors.grey300,
            //           ),
            //         )
            //       ],
            //     ),
            //     Spacer(),
            //     FilledButton(
            //       onPressed: () {},
            //       style: FilledButton.styleFrom(
            //           backgroundColor: AppColors.primary500),
            //       child: Text(
            //         "Follow",
            //         style: AppTextstyles.bw600s14
            //             .copyWith(color: AppColors.white),
            //       ),
            //     )
            //   ],
            // ),

            Row(
              children: [
                CircleAvatar(radius: 30.r),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8.w,
                        children: [
                          Flexible(
                            child: Text(
                              widget.news.authorName,
                              style: AppTextstyles.h5w500s20
                                  .copyWith(color: AppColors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Icon(
                            Icons.verified,
                            color: AppColors.blue,
                            size: 20.r,
                          ),
                        ],
                      ),
                      Text(
                        "Username",
                        style: AppTextstyles.bw500s14.copyWith(
                          color: AppColors.grey300,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                  child: Text(
                    "Follow",
                    style:
                        AppTextstyles.bw600s14.copyWith(color: AppColors.white),
                  ),
                )
              ],
            ),

            SizedBox(height: 12.h),
            Divider(color: AppColors.dark4),
            SizedBox(height: 24.h),
            Text(
              widget.news.title,
              style: AppTextstyles.h4w500s24.copyWith(color: AppColors.white),
            ),
            SizedBox(height: 26.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.news.body,
                    style:
                        AppTextstyles.bw500s18.copyWith(color: AppColors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
