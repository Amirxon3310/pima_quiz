import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/music_effect_widget.dart';

class MusicAndEffectsScreen extends StatefulWidget {
  const MusicAndEffectsScreen({super.key});

  @override
  State<MusicAndEffectsScreen> createState() => _MusicAndEffectsScreenState();
}

class _MusicAndEffectsScreenState extends State<MusicAndEffectsScreen> {
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
          'Music & Effects',
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
              title: "Biometric ID",
            ),
            MusicEffectSwitch(
              title: "Face ID",
            ),
            MusicEffectSwitch(
              title: "SMS Authenticator",
            ),
            MusicEffectSwitch(
              title: "Google Authenticator",
            ),
          ],
        ),
      ),
    );
  }
}
