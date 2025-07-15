import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/data/local_datasource.dart';
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
  bool biometricId = false;
  bool faceId = false;
  bool sms = false;
  bool googleAuth = false;

  @override
  void initState() {
    super.initState();
    loadSettingsFromHive();
  }

  void loadSettingsFromHive() {
    biometricId = HiveController.instance.read<bool>('BiometricID') ?? false;
    faceId = HiveController.instance.read<bool>('faceID') ?? false;
    sms = HiveController.instance.read<bool>('sms') ?? false;
    googleAuth = HiveController.instance.read<bool>('googleAuth') ?? false;
    setState(() {});
  }

  void updateSetting(String key, bool value) async {
    await HiveController.instance.write<bool>(key, value);
    setState(() {
      switch (key) {
        case 'BiometricID':
          biometricId = value;
          break;
        case 'faceID':
          faceId = value;
          break;
        case 'sms':
          sms = value;
          break;
        case 'googleAuth':
          googleAuth = value;
          break;
      }
    });
  }

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
              value: biometricId,
              title: "Biometric ID",
              onChanged: (value) => updateSetting('BiometricID', value),
            ),
            MusicEffectSwitch(
              value: faceId,
              onChanged: (value) => updateSetting('faceID', value),
              title: "Face ID",
            ),
            MusicEffectSwitch(
              value: sms,
              onChanged: (value) => updateSetting('sms', value),
              title: "SMS Authenticator",
            ),
            MusicEffectSwitch(
              value: googleAuth,
              onChanged: (value) => updateSetting('googleAuth', value),
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
