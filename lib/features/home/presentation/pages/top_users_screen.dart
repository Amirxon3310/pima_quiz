import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/constants/app_constants.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_state.dart';

class TopUsersScreen extends StatefulWidget {
  const TopUsersScreen({super.key});

  @override
  State<TopUsersScreen> createState() => _TopUsersScreenState();
}

class _TopUsersScreenState extends State<TopUsersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersBloc>(context).add(LoadUsersEvent());
  }

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
          child: Navigator.canPop(context)
              ? PressEffect(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    AppIcons.arrowLeft,
                    width: 28.w,
                    height: 28.h,
                    color: AppColors.white,
                  ),
                )
              : null,
        ),
        title: Text(
          "Top Foydalanuvchilar",
          style: AppTextstyles.h4w700s24.copyWith(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                context.read<UsersBloc>().add(SearchUsersEvent(value));
              },
              cursorColor: AppColors.grey600,
              style: AppTextstyles.bw400s16.copyWith(color: AppColors.grey600),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.dark2,
                hintText: "Search email, name or phone number",
                hintStyle:
                    AppTextstyles.bw400s16.copyWith(color: AppColors.grey600),
                prefixIcon: SvgPicture.asset(
                  AppIcons.search,
                  width: 20,
                  height: 20,
                  fit: BoxFit.scaleDown,
                  color: AppColors.grey600,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            // ViewAllWidget(title: "People you may know", onTap: () {}),
            // SizedBox(height: 24.h),
            Flexible(
              child: BlocBuilder<UsersBloc, UsersState>(
                builder: (context, state) {
                  if (state is UsersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UsersLoaded) {
                    final usersList = state.filteredUsersList;
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final user = usersList[index];
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage: NetworkImage(user.url.isNotEmpty
                                  ? user.url
                                  : AppConstants.errorImage),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                user.name.isNotEmpty ? user.name : "Unknown",
                                style: AppTextstyles.h6w600s18
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                            Spacer(),
                            FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                  backgroundColor: AppColors.primary500),
                              child: Text(
                                user.point,
                                style: AppTextstyles.bw600s14
                                    .copyWith(color: AppColors.white),
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 24.h);
                      },
                      itemCount: usersList.length,
                    );
                  } else if (state is UsersError) {
                    return Center(child: Text("Xatolik: ${state.message}"));
                  } else if (state is UsersSearching) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            SizedBox(height: 50.h)
          ],
        ),
      ),
    );
  }
}
