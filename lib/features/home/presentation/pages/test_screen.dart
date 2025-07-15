import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/custom_showsnackbar.dart';
import 'package:pima_quiz/features/home/presentation/pages/test_result_screen.dart';
import 'package:pima_quiz/features/home/presentation/widgets/variant_button.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  double count = 0.1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 24,
          children: [
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1/10',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "Nunito",
                  ),
                ),
                Text(
                  'Puzzle',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "Nunito",
                  ),
                ),
                SizedBox(
                  height: 28,
                  width: 28.w,
                  child: SvgPicture.asset(
                    AppIcons.moreCircle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.dark4,
                  ),
                ),
                AnimatedContainer(
                  width: 1.sw * count,
                  height: 16,
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: count < 0.4
                        ? AppColors.error
                        : count < 0.7
                            ? Colors.yellow
                            : Colors.greenAccent,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(AppImages.profileImages),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Order the following simple words!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: Colors.white,
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.dark4,
              height: 1,
            ),
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Column(
                spacing: 12,
                children: [
                  Flexible(
                    flex: 1,
                    child: VariantButton(
                      color: AppColors.blue,
                      title: "This",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: VariantButton(
                      color: AppColors.success,
                      title: "Calendar",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: VariantButton(
                      color: AppColors.orange,
                      title: "a",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: VariantButton(
                      color: AppColors.error,
                      title: "is",
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: CustomButton(
                text: "Submit Answer",
                onTap: () {
                  setState(() {
                    count += 0.1;
                  });
                  if (count > 0.5) {
                    showTopNotification(
                      context: context,
                      message: 'Incorrect! Fyuhhh.. That was close',
                      backgroundColor: AppColors.error,
                      title: "Incorrect",
                    );
                  } else {
                    showTopNotification(
                      context: context,
                      message: '+2593',
                      backgroundColor: AppColors.success,
                      title: "Correct!",
                    );
                  }
                  if (context.mounted) {
                    if (count > 0.9) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestResultScreen(),
                        ),
                      );
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
