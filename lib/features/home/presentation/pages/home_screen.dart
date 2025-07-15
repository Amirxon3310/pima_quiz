import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pima_quiz/core/constants/app_constants.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_textstyles.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/home/presentation/blocs/banners_bloc/banners_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/banners_bloc/banners_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/banners_bloc/banners_state.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_state.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/news_bloc/news_state.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/user_bloc/users_state.dart';
import 'package:pima_quiz/features/home/presentation/pages/categories_screen.dart';
import 'package:pima_quiz/features/home/presentation/pages/category_details_screen.dart';
import 'package:pima_quiz/features/home/presentation/pages/news_details_screen.dart';
import 'package:pima_quiz/features/home/presentation/pages/news_screen.dart';
import 'package:pima_quiz/features/home/presentation/pages/top_users_screen.dart';
import 'package:pima_quiz/features/home/presentation/widgets/category_widget.dart';
import 'package:pima_quiz/features/home/presentation/widgets/container_widget.dart';
import 'package:pima_quiz/features/home/presentation/widgets/view_all_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<BannersBloc>(context).add(LoadBannersEvent());
    BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent());
    BlocProvider.of<UsersBloc>(context).add(LoadUsersEvent());
    BlocProvider.of<CategoryBloc>(context).add(LoadCategoryEvent());

    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        setState(() {
          _currentIndex = (_currentIndex + 1);
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
        surfaceTintColor: AppColors.dark1,
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
          SvgPicture.asset(
            AppIcons.notification,
            width: 28.w,
            height: 28.h,
            fit: BoxFit.scaleDown,
            color: AppColors.white,
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
              BlocBuilder<BannersBloc, BannersState>(
                builder: (context, state) {
                  if (state is BannersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BannersLoaded) {
                    final banners = state.banners;
                    final index = _currentIndex % banners.length;

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Stack(
                        children: [
                          Image(
                            width: double.infinity,
                            height: 160.h,
                            fit: BoxFit.cover,
                            image: banners[index].url.isNotEmpty
                                ? NetworkImage(banners[index].url)
                                : AssetImage("assets/images/purple_banner.png")
                                    as ImageProvider,
                          ),
                          Positioned.fill(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 12.h),
                              alignment: Alignment.centerLeft,
                              color: Colors.black.withOpacity(0.3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 220.w,
                                    child: Text(
                                      banners[index].title,
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
                    );
                  } else if (state is BannersError) {
                    return Text("Xatolik: ${state.message}");
                  } else {
                    return const SizedBox();
                  }
                },
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
              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewsLoaded) {
                    final newsList = state.newsList;

                    return SizedBox(
                      height: 260.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        itemCount: newsList.length,
                        itemBuilder: (context, index) {
                          final news = newsList[index];
                          return PressEffect(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailsScreen(
                                    news: news,
                                  ),
                                ),
                              );
                            },
                            child: ContainerWidget(
                              image: news.url.isNotEmpty
                                  ? news.url
                                  : AppConstants.errorImage,
                              title: news.title,
                              authorName: news.authorName,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 16.w);
                        },
                      ),
                    );
                  } else if (state is NewsError) {
                    return Center(
                      child: Text("Xatolik: ${state.message}"),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
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
              BlocBuilder<UsersBloc, UsersState>(
                builder: (context, state) {
                  if (state is UsersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UsersLoaded) {
                    final usersList = state.originalUsersList;
                    return SizedBox(
                      height: 110.h,
                      child: ListView.separated(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final users = usersList[index];
                          return Column(
                            spacing: 12.h,
                            children: [
                              CircleAvatar(
                                radius: 40.r,
                                backgroundImage: NetworkImage(
                                    users.url.isNotEmpty
                                        ? users.url
                                        : AppConstants.errorImage),
                              ),
                              Text(
                                  users.name.isNotEmpty
                                      ? users.name.split(" ").first
                                      : "Unknown",
                                  style: AppTextstyles.bw700s16)
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 20.w,
                          );
                        },
                        itemCount: usersList.length,
                      ),
                    );
                  } else if (state is UsersError) {
                    return Center(child: Text("Xatolik: ${state.message}"));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              SizedBox(height: 24.h),
              ViewAllWidget(
                title: "Kategoriyalar",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CategoryLoaded) {
                    final categoriesList = state.categoryList;
                    return SizedBox(
                      height: 100.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        itemCount: categoriesList.length,
                        itemBuilder: (context, index) {
                          final categories = categoriesList[index];
                          return PressEffect(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryDetailsScreen(
                                      category: categories),
                                ),
                              );
                            },
                            child: CategoryWidget(
                              title: categories.title,
                              image: categories.url.isNotEmpty
                                  ? categories.url
                                  : AppConstants.errorImage,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 16.w);
                        },
                      ),
                    );
                  } else if (state is CategoryError) {
                    return Center(
                      child: Text("Xatolik: ${state.message}"),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
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
                      image:
                          "https://img.freepik.com/free-vector/bird-colorful-gradient-design-vector_343694-2506.jpg?semt=ais_hybrid&w=740",
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
                      image:
                          "https://img.freepik.com/free-vector/bird-colorful-gradient-design-vector_343694-2506.jpg?semt=ais_hybrid&w=740",
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
