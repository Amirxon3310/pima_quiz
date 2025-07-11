import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/core/widgets/custom_datetime_picker.dart';
import 'package:pima_quiz/core/widgets/custom_textfield.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final ageNameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  DateTime? dateOfBirth;
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
          'Personal Info',
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24.h,
              children: [
                SizedBox(
                  height: 120.h,
                  width: 120.w,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppImages.personalInfoAvatar,
                            ),
                          ),
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 30.h,
                            child: Transform.scale(
                              scale: 1.5,
                              child: SvgPicture.asset(
                                AppIcons.editSquare,
                                color: AppColors.primary500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.dark4,
                ),
                CustomTextField(
                  title: "Full name",
                  controller: fullNameController,
                  hintText: "Andrew Ainsley",
                ),
                CustomTextField(
                  title: "Email",
                  controller: emailController,
                  hintText: "andrew.ainsley@yourdomain.com",
                ),
                CustomTextField(
                  title: "Phone Number",
                  controller: phoneNumberController,
                  hintText: "+1-300-555-0399",
                ),
                CustomTextField(
                  title: "Date of Birth",
                  hintText: "12/27/1995",
                  onTap: () async {
                    DateTime? selectedDateTime =
                        await CustomDatetimePicker.pickDateTime(context);
                    if (selectedDateTime != null) {
                      print('Tanlangan sana va vaqt: $selectedDateTime');
                      dateOfBirth = selectedDateTime;
                    }
                  },
                ),
                CustomTextField(
                  title: "age",
                  controller: ageNameController,
                  hintText: "25",
                ),
                36.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
