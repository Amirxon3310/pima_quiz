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
  bool music = false;
  bool soundEffects = false;
  bool animationsEffects = false;
  bool visualEffetcts = false;

  @override
  void initState() {
    super.initState();
    loadSettingsFromHive();
  }

  void loadSettingsFromHive() {
    music = HiveController.instance.read<bool>('Music') ?? false;
    soundEffects = HiveController.instance.read<bool>('SoundEffects') ?? false;
    animationsEffects =
        HiveController.instance.read<bool>('AnimationEffects') ?? false;
    visualEffetcts =
        HiveController.instance.read<bool>('VisualEffects') ?? false;
    setState(() {});
  }

  void updateSetting(String key, bool value) async {
    await HiveController.instance.write<bool>(key, value);
    setState(() {
      switch (key) {
        case 'Music':
          music = value;
          break;
        case 'SoundEffects':
          soundEffects = value;
          break;
        case 'AnimationEffects':
          animationsEffects = value;
          break;
        case 'VisualEffects':
          visualEffetcts = value;
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
          spacing: 16.h,
          children: [
            MusicEffectSwitch(
              title: "Music",
              value: music,
              onChanged: (val) => updateSetting('Music', val),
            ),
            MusicEffectSwitch(
              title: "Sound Effects",
              value: soundEffects,
              onChanged: (val) => updateSetting('SoundEffects', val),
            ),
            MusicEffectSwitch(
              title: "Animation Effects",
              value: animationsEffects,
              onChanged: (val) => updateSetting('AnimationEffects', val),
            ),
            MusicEffectSwitch(
              title: "Visual Effects",
              value: visualEffetcts,
              onChanged: (val) => updateSetting('VisualEffects', val),
            ),
          ],
        ),
      ),
    );
  }
}
