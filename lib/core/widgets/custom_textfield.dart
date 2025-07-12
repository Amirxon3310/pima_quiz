import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String? hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.title,
    this.hintText,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          controller: controller,
          obscureText: isPassword,
          style: TextStyle(
            fontFamily: "Nunito",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white70, fontFamily: "Nunito"),
              suffixIcon: isPassword
                  ? const Icon(Icons.visibility_off, color: Color(0xff6949FF))
                  : null,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff6949FF)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff6949FF),
                ),
              ),
              errorStyle: TextStyle(
                color: const Color.fromARGB(255, 255, 0, 0),
              )),
        ),
      ],
    );
  }
}
