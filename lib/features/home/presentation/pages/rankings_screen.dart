import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/constants/app_constants.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_state.dart';
import 'package:pima_quiz/features/home/presentation/pages/main_screen.dart';
import 'package:pima_quiz/features/home/presentation/widgets/podium_widget.dart';

class RankingsScreen extends StatefulWidget {
  const RankingsScreen({super.key});

  @override
  State<RankingsScreen> createState() => _RankingsScreenState();
}

class _RankingsScreenState extends State<RankingsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(LoadUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/ranking_background.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: PressEffect(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              },
              child: Icon(Icons.close, color: AppColors.white, size: 28),
            ),
            title: Text(
              "Umumiy reyting",
              style: AppTextstyles.h4w700s24.copyWith(color: AppColors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is UsersLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UsersLoaded) {
                  final usersList = state.originalUsersList;
                  final topThree = usersList.take(3).toList();
                  final remainingUsers = usersList.skip(3).toList();
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (topThree.length > 1)
                            PodiumWidget(
                              name: topThree[1].name.isNotEmpty
                                  ? topThree[1].name.split(" ").first
                                  : "Unknown",
                              point: topThree[1].point,
                              stepType: "silver_step",
                              medalType: "silver_medal",
                              containerWidth: 124,
                              containerHeight: 154,
                              medalWidth: 130,
                              medalHeight: 130,
                              color: AppColors.primary400,
                              image: topThree[1].url.isNotEmpty
                                  ? topThree[1].url
                                  : AppConstants.errorImage,
                            ),
                          if (topThree.isNotEmpty)
                            PodiumWidget(
                              name: topThree[0].name.isNotEmpty
                                  ? topThree[0].name.split(" ").first
                                  : "Unknown",
                              point: topThree[0].point,
                              stepType: "gold_step",
                              medalType: "gold_medal",
                              containerWidth: 132,
                              containerHeight: 188,
                              medalWidth: 140,
                              medalHeight: 140,
                              gradient: AppColors.gradientPurple,
                              image: topThree[0].url.isNotEmpty
                                  ? topThree[0].url
                                  : AppConstants.errorImage,
                            ),
                          if (topThree.length > 2)
                            PodiumWidget(
                              name: topThree[2].name.isNotEmpty
                                  ? topThree[2].name.split(" ").first
                                  : "Unknown",
                              point: topThree[2].point,
                              stepType: "bronze_step",
                              medalType: "bronze_medal",
                              containerWidth: 124,
                              containerHeight: 124,
                              medalWidth: 120,
                              medalHeight: 120,
                              color: AppColors.primary400,
                              image: topThree[2].url.isNotEmpty
                                  ? topThree[2].url
                                  : AppConstants.errorImage,
                            ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: remainingUsers.length,
                        itemBuilder: (context, index) {
                          final user = remainingUsers[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              color: AppColors.dark2,
                              child: Column(
                                children: [
                                  SizedBox(height: 12.h),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30.w,
                                        height: 30.w,
                                        child: Text(
                                          "${index + 4}",
                                          style: AppTextstyles.h5w700s20
                                              .copyWith(color: AppColors.white),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage: NetworkImage(
                                            user.url.isNotEmpty
                                                ? user.url
                                                : AppConstants.errorImage),
                                      ),
                                      SizedBox(width: 20.w),
                                      Text(
                                        user.name.isNotEmpty
                                            ? user.name.split(" ").first
                                            : "Unknown",
                                        style: AppTextstyles.h5w700s20
                                            .copyWith(color: AppColors.white),
                                      ),
                                      Spacer(),
                                      Text(
                                        user.point.isNotEmpty
                                            ? user.point
                                            : "0",
                                        style: AppTextstyles.h5w700s20
                                            .copyWith(color: AppColors.white),
                                      )
                                    ],
                                  ),
                                  12.height,
                                  Divider(color: AppColors.dark4),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  );
                } else if (state is UsersError) {
                  return Center(child: Text("Xatolik: ${state.message}"));
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
          bottomNavigationBar: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(gradient: AppColors.gradientPurple),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Row(
                spacing: 16.w,
                children: [
                  Expanded(
                    child: PressEffect(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.grey300, width: 5))),
                        child: Center(
                          child: Text(
                            "Saqlash",
                            style: AppTextstyles.bw700s16
                                .copyWith(color: AppColors.primary500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PressEffect(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.grey300, width: 5))),
                        child: Center(
                          child: Text(
                            "Asosiy sahifa",
                            style: AppTextstyles.bw700s16
                                .copyWith(color: AppColors.primary500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
