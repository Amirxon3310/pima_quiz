import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_event.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_state.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  @override
  void didChangeDependencies() {
    context.read<ProfileBloc>().add(GetUserByIdEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
        ),
        title: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Text(
              state.user!.fullName ?? "Foydalanuvchi",
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: SizedBox(
              height: 28,
              child: SvgPicture.asset(
                AppIcons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary500,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Center(
                            child: Text(
                              "Followers",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    12.width,
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: AppColors.primary500,
                          ),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Center(
                            child: Text(
                              "Following",
                              style: TextStyle(
                                color: AppColors.primary500,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.all(0),
                separatorBuilder: (context, index) => 12.height,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImages.personalInfoAvatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Foydalanuvchi",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "state.user!.email",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Flexible(
                      flex: 3,
                      child: PressEffect(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary500,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            'Follow',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
