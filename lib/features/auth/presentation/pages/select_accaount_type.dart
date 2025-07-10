import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/features/auth/presentation/widgets/w_account_type.dart';

class SelectAccaountType extends StatelessWidget {
  const SelectAccaountType({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff181A20),
        body: Padding(
          padding: EdgeInsets.only(top: 16, left: 24, right: 24),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 1.sh,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                        Container(
                          width: 0.6.sw,
                          height: 12.h,
                          decoration: BoxDecoration(
                            color: Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.33,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF6C5CE7),
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Siz qaysi toifaga kirasiz?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Toyfani tanlash orqali sizga qanday testlarni\ntafsiya qilishni xal qilamiz!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 14.sp,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Column(
                      spacing: 24,
                      children: [
                        WAccountType(
                          icon: Icons.school,
                          title: 'Maktab o\'quvchisi',
                          color: Color(0xff3476fd),
                        ),
                        WAccountType(
                          icon: Icons.person,
                          title: 'O\'qtuvchi',
                          color: Color(0xFFFF9500),
                        ),
                        WAccountType(
                          icon: Icons.group,
                          title: 'Talaba',
                          color: Color(0xFF00C896),
                        ),
                        WAccountType(
                          icon: Icons.work,
                          title: 'Ishchi',
                          color: Color(0xFFFF6B6B),
                        ),
                      ],
                    ),
                    SizedBox(height: 42),
                    CustomButton(
                      text: "Skip",
                      onTap: () {},
                      isFilled: false,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
