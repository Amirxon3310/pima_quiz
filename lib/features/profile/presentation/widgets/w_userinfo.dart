import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_event.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_state.dart';
import 'package:pima_quiz/features/profile/presentation/pages/personal_info_screen.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  void didChangeDependencies() {
    context.read<ProfileBloc>().add(GetUserByIdEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.profileImages),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            20.height,
            Row(
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
                        image: (state.user?.image != null &&
                                state.user!.image!.isNotEmpty)
                            ? NetworkImage(state.user!.image!) as ImageProvider
                            : AssetImage(AppImages.personalInfoAvatar)
                                as ImageProvider,
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
                        state.user?.fullName ?? "Foydalanuvchi",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.user?.email ?? "example@.com",
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalInfoScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: AppColors.primary500,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Text(
                        'Edit Profile',
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
            12.height,
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.dark4,
            )
          ],
        );
      },
    );
  }
}
