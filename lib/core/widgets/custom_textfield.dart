import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function? onTap;

  const CustomTextField({
    super.key,
    required this.title,
    this.hintText,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PressEffect(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: "Nunito",
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              onTap: () {
                if (onTap != null) {
                  onTap!();
                }
              },
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              validator: validator,
              controller: controller,
              obscureText: isPassword,
              cursorColor: AppColors.primary500,
              style: TextStyle(
                fontFamily: "Nunito",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle:
                      TextStyle(color: Colors.white70, fontFamily: "Nunito"),
                  suffixIcon: isPassword
                      ? Icon(Icons.visibility_off, color: AppColors.primary500)
                      : null,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary500),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary500,
                    ),
                  ),
                  errorStyle: TextStyle(
                    color: const Color.fromARGB(255, 255, 0, 0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
