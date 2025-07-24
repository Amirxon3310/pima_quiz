import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/constants/app_constants.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/home/domain/entities/category_entity.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/questions_bloc/questions_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/questions_bloc/questions_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/questions_bloc/questions_state.dart';
import 'package:pima_quiz/features/home/presentation/pages/quiz_details_screen.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final CategoryEntity category;

  const CategoryDetailsScreen({
    super.key,
    required this.category,
  });

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent());
    context
        .read<QuestionsBloc>()
        .add(LoadQuestionsByCategoryEvent(widget.category.id));
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
          child: PressEffect(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              AppIcons.arrowLeft,
              width: 28.w,
              height: 28.h,
              color: AppColors.white,
            ),
          ),
        ),
        title: Text(
          widget.category.title,
          style: AppTextstyles.h4w700s24.copyWith(color: AppColors.white),
        ),
        actions: [
          SvgPicture.asset(
            AppIcons.search,
            width: 28,
            height: 28,
            color: AppColors.white,
          ),
          SizedBox(
            width: 24.w,
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20.r),
              child: Image.network(
                widget.category.url,
                width: double.infinity,
                height: 160.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<QuestionsBloc, QuestionsState>(
                  builder: (context, state) {
                    if (state is QuestionsLoaded) {
                      return Text(
                        "${state.questions.length} ta quiz",
                        style: AppTextstyles.h5w700s20
                            .copyWith(color: AppColors.white),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                PressEffect(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Default",
                        style: AppTextstyles.bw600s16
                            .copyWith(color: AppColors.primary500),
                      ),
                      12.width,
                      SvgPicture.asset(
                        AppIcons.swap,
                        width: 24,
                        height: 24,
                        fit: BoxFit.scaleDown,
                        color: AppColors.primary500,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24.h),
          BlocBuilder<QuestionsBloc, QuestionsState>(
            builder: (context, state) {
              if (state is QuestionsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is QuestionsLoaded) {
                final questionsList = state.questions;
                return Expanded(
                  child: ListView.builder(
                    itemCount: questionsList.length,
                    itemBuilder: (context, index) {
                      final questions = questionsList[index];
                      return PressEffect(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 24.w),
                          padding: EdgeInsets.only(right: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.dark4,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 16.w,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12.r),
                                      bottomLeft: Radius.circular(12.r),
                                    ),
                                    child: Image.network(
                                      questions.photo.isNotEmpty
                                          ? questions.photo
                                          : AppConstants.errorImage,
                                      width: 140.w,
                                      height: 110.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 12.h,
                                    right: 12.w,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 6.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary500,
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                      ),
                                      child: Text(
                                        "${questions.questions} Qs",
                                        style: AppTextstyles.bw600s10
                                            .copyWith(color: AppColors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      questions.title,
                                      style: AppTextstyles.h6w700s18
                                          .copyWith(color: AppColors.white),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 12.h),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "2 months ago",
                                          style: AppTextstyles.bw500s10
                                              .copyWith(color: AppColors.white),
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          "5.6K plays",
                                          style: AppTextstyles.bw500s10
                                              .copyWith(color: AppColors.white),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 12.h),
                                    Row(
                                      spacing: 8.w,
                                      children: [
                                        CircleAvatar(
                                          radius: 10.r,
                                          backgroundImage: NetworkImage(
                                              questions.creator["photo"]
                                                      .isNotEmpty
                                                  ? questions.creator["photo"]
                                                  : AppConstants.errorImage),
                                        ),
                                        Text(
                                          questions.creator["name"],
                                          style: AppTextstyles.bw600s10,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is QuestionsError) {
                return Center(
                  child: Text("Xatolik: ${state.message}"),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
