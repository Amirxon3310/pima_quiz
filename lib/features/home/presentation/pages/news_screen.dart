import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/constants/app_constants.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_state.dart';
import 'package:pima_quiz/features/home/presentation/pages/news_details_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
          "Yangiliklar",
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
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoaded) {
            final newsList = state.newsList;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsScreen(news: news),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
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
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                          child: Image.network(
                            news.url.isNotEmpty
                                ? news.url
                                : AppConstants.errorImage,
                            width: 140.w,
                            height: 110.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news.title,
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
                                  CircleAvatar(radius: 10.r),
                                  Text(
                                    news.authorName,
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
            );
          } else if (state is NewsError) {
            return Center(
              child: Text("Xatolik: ${state.message}"),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
