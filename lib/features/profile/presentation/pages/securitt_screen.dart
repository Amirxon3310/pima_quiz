import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/music_effect_widget.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/music_effect_widget_2.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool isSwitched = true;
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
        title: Text(
          'Security',
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 16.h,
        ),
        child: Column(
          spacing: 24.h,
          children: [
            MusicEffectSwitch(
              value: true,
              title: "Biometric ID",
              onChanged: (value) {},
            ),
            MusicEffectSwitch(
              value: true,
              onChanged: (value) {},
              title: "Face ID",
            ),
            MusicEffectSwitch(
              value: true,
              onChanged: (value) {},
              title: "SMS Authenticator",
            ),
            MusicEffectSwitch(
              value: true,
              onChanged: (value) {},
              title: "Google Authenticator",
            ),
            MusicEffectWidget(title: "Device Management"),
            MusicEffectWidget(title: "Change Email"),
            CustomButton(
              text: "ChangePassword",
              onTap: () {},
              isFilled: false,
            )
          ],
        ),
      ),
    );
  }
}
