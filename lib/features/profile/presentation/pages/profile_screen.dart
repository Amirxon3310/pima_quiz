import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/features/profile/presentation/pages/profile_settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      appBar: AppBar(
        backgroundColor: AppColors.dark1,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileSettingsScreen(),
                ),
              );
            },
            child: SvgPicture.asset(
              AppIcons.setting,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
