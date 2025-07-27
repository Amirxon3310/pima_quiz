import 'package:flutter/material.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/features/home/presentation/pages/categories_screen.dart';
import 'package:pima_quiz/features/home/presentation/pages/home_screen.dart';
import 'package:pima_quiz/features/home/presentation/pages/news_screen.dart';
import 'package:pima_quiz/features/home/presentation/pages/top_users_screen.dart';
import 'package:pima_quiz/features/home/presentation/widgets/custom_bnb.dart';
import 'package:pima_quiz/features/profile/presentation/pages/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    NewsScreen(),
    TopUsersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: Stack(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, value, _) {
              return screens[value];
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBnb(
              selectedIndexNotifier: _selectedIndex,
            ),
          )
        ],
      ),
    );
  }
}
