import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/custom_datetime_picker.dart';
import 'package:pima_quiz/core/widgets/custom_datetime_widget.dart';
import 'package:pima_quiz/core/widgets/custom_textfield.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_event.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_state.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/profile_info_shimmer.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  void didChangeDependencies() {
    context.read<ProfileBloc>().add(GetUserByIdEvent());
    super.didChangeDependencies();
  }

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
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return ProfileInfoShimmer();
          }
          if (state.error != null) {
            return Center(
              child: Text(
                "Error: ${state.error}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }
          emailController.text = state.user?.email ?? "";
          fullNameController.text = state.user?.fullName ?? "";
          phoneNumberController.text = state.user?.phoneNumber ?? "";
          dateOfBirth = state.user?.birthday;
          ageNameController.text = state.user?.age.toString() ?? "";
          print("KELDI ANU KELDI: ${state.user?.birthday}");
          return Center(
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
                                image: (state.user?.image != null &&
                                        state.user!.image!.isNotEmpty)
                                    ? NetworkImage(state.user!.image!)
                                        as ImageProvider
                                    : AssetImage(AppImages.personalInfoAvatar)
                                        as ImageProvider,
                                fit: BoxFit.cover,
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
                    CustomDatetimeWidget(
                      title: "Date of Birth",
                      valueText: dateOfBirth,
                      onTap: () async {
                        DateTime? selectedDateTime =
                            await CustomDatetimePicker.pickDateTime(context);
                        if (selectedDateTime != null) {
                          if (context.mounted) {
                            context
                                .read<ProfileBloc>()
                                .add(EditUserDateOfBirhtday(selectedDateTime));
                          }
                        }
                      },
                    ),
                    CustomTextField(
                      title: "age",
                      controller: ageNameController,
                      hintText: "25",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    100.height,
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(24),
        child: CustomButton(
          text: "Edit",
          onTap: () {
            context.read<ProfileBloc>().add(
                  EditUserAllInfo(
                    age: ageNameController.text,
                    newFullName: fullNameController.text,
                    phoneNumber: phoneNumberController.text,
                  ),
                );
          },
        ),
      ),
    );
  }
}
