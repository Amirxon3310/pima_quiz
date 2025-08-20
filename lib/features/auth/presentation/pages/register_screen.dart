import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pima_quiz/core/data/local_datasource.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_lotties.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/custom_datetime_picker.dart';
import 'package:pima_quiz/core/widgets/custom_datetime_widget.dart';
import 'package:pima_quiz/core/widgets/custom_textfield.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_state.dart';
import 'package:pima_quiz/features/auth/presentation/widgets/w_account_type.dart';
import 'package:pima_quiz/features/home/presentation/pages/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Form controllers
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final ageNameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  DateTime? dateOfBirth;
  UserStatus? selectedUserStatus;
  final key = GlobalKey<FormState>();

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  double _getProgressValue() {
    return (_currentPage + 1) / 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: Padding(
        padding: EdgeInsets.only(top: 72, left: 24, right: 24),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _previousPage,
                  child: Icon(
                    Icons.arrow_back,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 0.6.sw,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.dark4,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: _getProgressValue(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary500,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(),
              ],
            ),
            24.height,
            // PageView
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildAccountTypeSelectionPage(),
                  _buildRegistrationFormPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildAccountTypeSelectionPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Siz qaysi toifaga kirasiz ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
              ),
            ),
          ),
          16.height,
          Center(
            child: Text(
              'Toyfani tanlash orqali sizga qanday testlarni\ntafsiya qilishni xal qilamiz!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFB0B0B0),
                fontSize: 14.sp,
                height: 1.4,
                fontFamily: "Nunito",
              ),
            ),
          ),
          40.height,
          Column(
            spacing: 24,
            children: [
              PressEffect(
                onTap: () {
                  setState(() {
                    selectedUserStatus = UserStatus.schoolStudent;
                  });
                  _nextPage();
                },
                child: WAccountType(
                  icon: Icons.school,
                  title: "Maktab o'quvchisi",
                  gradient: AppColors.gradientBlue,
                ),
              ),
              PressEffect(
                onTap: () {
                  setState(() {
                    selectedUserStatus = UserStatus.teacher;
                  });
                  _nextPage();
                },
                child: WAccountType(
                  icon: Icons.person,
                  title: "O'qtuvchi",
                  gradient: AppColors.gradientOrange,
                ),
              ),
              PressEffect(
                onTap: () {
                  setState(() {
                    selectedUserStatus = UserStatus.stduent;
                  });
                  _nextPage();
                },
                child: WAccountType(
                  icon: Icons.group,
                  title: 'Talaba',
                  gradient: AppColors.gradientGreen,
                ),
              ),
              PressEffect(
                onTap: () {
                  setState(() {
                    selectedUserStatus = UserStatus.worker;
                  });
                  _nextPage();
                },
                child: WAccountType(
                  icon: Icons.work,
                  title: 'Ishchi',
                  gradient: AppColors.gradientRed,
                ),
              ),
            ],
          ),
          42.height,
        ],
      ),
    );
  }

  Widget _buildRegistrationFormPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create an account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Nunito",
                ),
              ),
            ],
          ),
          16.height,
          Center(
            child: Text(
              'Please complete your profile.\nDon\'t worry, your data will remain private and\nonly you can see it.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFB0B0B0),
                fontSize: 14.sp,
                height: 1.4,
                fontFamily: "Nunito",
              ),
            ),
          ),
          32.height,
          Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24.h,
              children: [
                CustomTextField(
                  title: "Full Name",
                  controller: fullNameController,
                  hintText: "Andrew Ainsley",
                ),
                CustomTextField(
                  title: "Username",
                  controller: userNameController,
                  hintText: "andrew_ainsley",
                ),
                CustomDatetimeWidget(
                  title: "Date of Birth",
                  valueText: dateOfBirth,
                  onTap: () async {
                    DateTime? selectedDateTime =
                        await CustomDatetimePicker.pickDateTime(context);
                    if (selectedDateTime != null) {
                      setState(() {
                        dateOfBirth = selectedDateTime;
                      });
                      print(selectedDateTime);
                    }
                  },
                ),
                CustomTextField(
                  title: "Email",
                  controller: emailController,
                  hintText: "andrew.ainsley@yourdomain.com",
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Email manzilingizni kiriting';
                    }
                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(v)) {
                      return "To'g'ri email manzil kiriting";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  title: "Age",
                  controller: ageNameController,
                  hintText: "25",
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                CustomTextField(
                  title: "Phone number",
                  controller: phoneNumberController,
                  hintText: "+998 77 777 77 77",
                ),
                CustomTextField(
                  title: "Password",
                  controller: passwordController,
                  hintText: "●●●●●●●●●●●●",
                  isPassword: true,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Parolni kiriting';
                    }
                    if (v.length < 6) {
                      return "Parol kamida 6 ta belgidan iborat bo'lishi kerak";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  title: "Password Confirm",
                  controller: passwordConfirmController,
                  hintText: "●●●●●●●●●●●●",
                  isPassword: true,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Parolni qayta kiriting';
                    }
                    if (passwordController.text !=
                        passwordConfirmController.text) {
                      return "Parollar mos emas, Parollar bir xil bo'lishi kerak";
                    }
                    return null;
                  },
                ),
                24.height,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          width: double.infinity,
          color: AppColors.dark4,
        ),
        Container(
          color: AppColors.dark1,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: 36.h, right: 24.w, left: 24.w, top: 24.h),
            child: _currentPage == 0
                ? _buildFirstPageButtons()
                : _buildSecondPageButtons(),
          ),
        ),
      ],
    );
  }

  Widget _buildFirstPageButtons() {
    return Column(
      // spacing: 16.h,
      children: [
        // CustomButton(
        //   text: "Continue",
        //   onTap: selectedUserStatus != null ? _nextPage : null,
        // ),
        CustomButton(
          text: "Skip",
          onTap: _nextPage,
          isFilled: false,
        ),
      ],
    );
  }

  Widget _buildSecondPageButtons() {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => MainScreen()),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.status == AuthStatus.loading
              ? Center(
                  child: SizedBox(
                    height: 48.h,
                    child: Center(
                      child: Lottie.asset(
                        AppLotties.splashLoading,
                      ),
                    ),
                  ),
                )
              : Column(
                  spacing: 16.h,
                  children: [
                    state.message != null
                        ? Text(state.message!,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 0, 0),
                            ))
                        : SizedBox(),
                    CustomButton(
                      text: "Continue",
                      onTap: () {
                        if (key.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                RegisterEvent(
                                  UserModel(
                                    id: '',
                                    age: int.tryParse(ageNameController.text) ??
                                        10,
                                    fullName: fullNameController.text,
                                    email: emailController.text,
                                    phoneNumber: phoneNumberController.text,
                                    username: userNameController.text,
                                    userStatus: selectedUserStatus,
                                    birthday: dateOfBirth,
                                    createdAt: DateTime.now(),
                                  ),
                                  passwordController.text,
                                ),
                              );
                        }
                      },
                    ),
                  ],
                );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    ageNameController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }
}
