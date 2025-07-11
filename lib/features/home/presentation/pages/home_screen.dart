import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/features/home/presentation/pages/news_screen.dart';
import 'package:pima_quiz/features/home/presentation/pages/top_users_screen.dart';
import 'package:pima_quiz/features/home/presentation/widgets/category_widget.dart';
import 'package:pima_quiz/features/home/presentation/widgets/container_widget.dart';
import 'package:pima_quiz/features/home/presentation/widgets/view_all_widget.dart';
import 'package:pima_quiz/features/profile/presentation/pages/profile_settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> _images = [
    "assets/images/purple_banner.png",
    "assets/images/blue_banner.png",
    "assets/images/green_banner.png",
    "assets/images/red_banner.png",
  ];

  final List<String> _titles = [
    "Qiziqarli testlarni yeching",
    "Mantiqiy testlarni yeching",
    "Matematikadan bilimlarizni sinab ko'ring",
    "Quizzo ilovasi bilan tez va oson",
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _images.length;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      appBar: AppBar(
        backgroundColor: AppColors.dark1,
        centerTitle: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Image.asset(
            "assets/images/on_boarding.png",
            width: 28.w,
            height: 28.h,
          ),
        ),
        title: Text(
          "Quizzo",
          style: AppTextstyles.h4w700s24.copyWith(color: AppColors.white),
        ),
        actions: [
          SvgPicture.asset(
            AppIcons.search,
            width: 28.w,
            height: 28.h,
            fit: BoxFit.scaleDown,
            color: AppColors.white,
          ),
          SizedBox(width: 20.w),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileSettingsScreen(),
                ),
              );
            },
            child: SvgPicture.asset(
              AppIcons.notification,
              width: 28.w,
              height: 28.h,
              fit: BoxFit.scaleDown,
              color: AppColors.white,
            ),
          ),
          SizedBox(width: 24.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Stack(
                  children: [
                    Image.asset(
                      _images[_currentIndex],
                      width: double.infinity,
                      height: 160.h,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        alignment: Alignment.centerLeft,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 220.w,
                              child: Text(
                                _titles[_currentIndex],
                                style: AppTextstyles.h6w600s18.copyWith(
                                  color: Colors.white,
                                ),
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.all(10)),
                              child: const Text("Start"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              ViewAllWidget(
                  title: "Yangiliklar",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsScreen(),
                      ),
                    );
                  }),
              SizedBox(height: 16.h),
              SizedBox(
                height: 260.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ContainerWidget(
                      image: "image",
                      title: "Get Smarter with Productivity Quizz...",
                      authorName: "Titus Kitamura",
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 16.w);
                  },
                ),
              ),
              SizedBox(height: 24.h),
              ViewAllWidget(
                title: "Top foydalanuvchilar",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopUsersScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 110.h,
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      spacing: 12.h,
                      children: [
                        CircleAvatar(
                          radius: 40.r,
                          backgroundColor: AppColors.teal,
                        ),
                        Text("Name", style: AppTextstyles.bw700s16)
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20.w,
                    );
                  },
                  itemCount: 10,
                ),
              ),
              SizedBox(height: 24.h),
              ViewAllWidget(
                title: "Kategoriyalar",
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CategoryWidget(title: "Mantiqiy");
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 16.w);
                  },
                ),
              ),
              SizedBox(height: 24.h),
              ViewAllWidget(title: "Trenddagi quizlar", onTap: () {}),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 260.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ContainerWidget(
                      image: "image",
                      title: "Get Smarter with Productivity Quizz...",
                      authorName: "Titus Kitamura",
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 16.w);
                  },
                ),
              ),
              SizedBox(height: 24.h),
              ViewAllWidget(title: "Top Picks", onTap: () {}),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 260.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ContainerWidget(
                      image: "image",
                      title: "Get Smarter with Productivity Quizz...",
                      authorName: "Titus Kitamura",
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 16.w);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
