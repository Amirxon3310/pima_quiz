import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/data/local_datasource.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/music_effect_widget.dart';

class MusicAndEffectsScreen extends StatefulWidget {
  const MusicAndEffectsScreen({super.key});

  @override
  State<MusicAndEffectsScreen> createState() => _MusicAndEffectsScreenState();
}

class _MusicAndEffectsScreenState extends State<MusicAndEffectsScreen> {
  bool biometricID = false;
  bool faceID = false;
  bool smsAuth = false;
  bool googleAuth = false;

  @override
  void initState() {
    super.initState();
    loadSettingsFromHive();
  }

  void loadSettingsFromHive() {
    biometricID = HiveController.instance.read<bool>('biometricID') ?? false;
    faceID = HiveController.instance.read<bool>('faceID') ?? false;
    smsAuth = HiveController.instance.read<bool>('smsAuth') ?? false;
    googleAuth = HiveController.instance.read<bool>('googleAuth') ?? false;
    setState(() {});
  }

  void updateSetting(String key, bool value) async {
    await HiveController.instance.write<bool>(key, value);
    setState(() {
      switch (key) {
        case 'biometricID':
          biometricID = value;
          break;
        case 'faceID':
          faceID = value;
          break;
        case 'smsAuth':
          smsAuth = value;
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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
        ),
        title: Text(
          'Music & Effects',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            MusicEffectSwitch(
              title: "Biometric ID",
              value: biometricID,
              onChanged: (val) => updateSetting('biometricID', val),
            ),
            MusicEffectSwitch(
              title: "Face ID",
              value: faceID,
              onChanged: (val) => updateSetting('faceID', val),
            ),
            MusicEffectSwitch(
              title: "SMS Authenticator",
              value: smsAuth,
              onChanged: (val) => updateSetting('smsAuth', val),
            ),
            MusicEffectSwitch(
              title: "Google Authenticator",
              value: googleAuth,
              onChanged: (val) => updateSetting('googleAuth', val),
            ),
          ],
        ),
      ),
    );
  }
}
