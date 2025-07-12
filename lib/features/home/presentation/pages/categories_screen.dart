import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/constants/app_constants.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_state.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(LoadCategoryEvent());
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
          child: GestureDetector(
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
          "Kategoriyalar",
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
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryLoaded) {
            final categoryList = state.categoryList;
            return Padding(
              padding: const EdgeInsets.all(24),
              child: GridView.builder(
                itemCount: categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.h,
                  mainAxisSpacing: 16.w,
                  // mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) {
                  final category = categoryList[index];
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.network(
                          category.url.isNotEmpty
                              ? category.url
                              : AppConstants.errorImage,
                          width: double.infinity,
                          height: 100.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 12.w,
                        bottom: 40.h,
                        child: Text(
                          category.title,
                          style: AppTextstyles.bw700s16
                              .copyWith(color: AppColors.white),
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          } else if (state is CategoryError) {
            return Center(child: Text("Xatolik: ${state.message}"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
