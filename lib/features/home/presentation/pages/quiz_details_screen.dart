import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/features/home/presentation/pages/test_screen.dart';
import 'package:pima_quiz/features/home/presentation/widgets/w_test_details.dart';

class QuizDetailsScreen extends StatefulWidget {
  const QuizDetailsScreen({super.key});

  @override
  State<QuizDetailsScreen> createState() => _QuizDetailsScreenState();
}

class _QuizDetailsScreenState extends State<QuizDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.clear,
            color: Colors.white,
            size: 28,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Row(
              children: [
                SizedBox(
                  height: 28,
                  child: SvgPicture.asset(
                    AppIcons.star,
                    color: AppColors.orange,
                  ),
                ),
                16.width,
                SizedBox(
                  height: 28,
                  child: SvgPicture.asset(
                    AppIcons.moreCircle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.h,
          children: [
            1.width,
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.profileImages),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              width: double.infinity,
              height: 180.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Having Fun & Always Smile!",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    color: Colors.white,
                  ),
                ),
                Text(
                  "text narxi: 12 coin",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: "Nunito",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 12,
              children: [
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.dark4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child:
                          WTestDetails(title: "26", description: 'Qusetions'),
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: AppColors.dark4,
                    ),
                    Flexible(
                      flex: 1,
                      child:
                          WTestDetails(title: "18.5K", description: 'Played'),
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: AppColors.dark4,
                    ),
                    Flexible(
                      flex: 1,
                      child:
                          WTestDetails(title: "925", description: 'Favorited'),
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: AppColors.dark4,
                    ),
                    Flexible(
                      flex: 1,
                      child: WTestDetails(title: "256", description: 'Shared'),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.dark4,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Invite your friends to play quiz together!",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "Nunito",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Row(
                spacing: 16,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "Add to favorite",
                      onTap: () {},
                      isFilled: false,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "Testni boshlash",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
