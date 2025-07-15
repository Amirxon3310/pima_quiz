import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/constants/app_constants.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/home/domain/entities/category_entity.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_state.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_event.dart';

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
                spacing: 12.w,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "245 Quizzo",
                    style: AppTextstyles.h5w700s20
                        .copyWith(color: AppColors.white),
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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CategoryLoaded) {
                  final categoryList = state.categoryList;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        final category = categoryList[index];
                        return PressEffect(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         CategoryDetailsScreen(category: category),
                            //   ),
                            // );
                          },
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
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.r),
                                    bottomLeft: Radius.circular(12.r),
                                  ),
                                  child: Image.network(
                                    category.url.isNotEmpty
                                        ? category.url
                                        : AppConstants.errorImage,
                                    width: 140.w,
                                    height: 110.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        category.title,
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
                                                .copyWith(
                                                    color: AppColors.white),
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            "5.6K plays",
                                            style: AppTextstyles.bw500s10
                                                .copyWith(
                                                    color: AppColors.white),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 12.h),
                                      Row(
                                        spacing: 8.w,
                                        children: [
                                          CircleAvatar(radius: 10.r),
                                          Text(
                                            "category.authorName",
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
                } else if (state is CategoryError) {
                  return Center(
                    child: Text("Xatolik: ${state.message}"),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ));
  }
}
