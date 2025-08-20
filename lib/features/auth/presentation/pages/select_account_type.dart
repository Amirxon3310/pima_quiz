// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pima_quiz/core/resources/app_colors.dart';
// import 'package:pima_quiz/core/widgets/custom_button.dart';
// import 'package:pima_quiz/core/widgets/press_effect.dart';
// import 'package:pima_quiz/example.dart';
// import 'package:pima_quiz/features/auth/data/models/user_model.dart';
// import 'package:pima_quiz/features/auth/presentation/widgets/w_account_type.dart';

// class SelectAccountType extends StatelessWidget {
//   const SelectAccountType({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.dark1,
//       body: Padding(
//         padding: EdgeInsets.only(top: 72, left: 24, right: 24),
//         child: SingleChildScrollView(
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//               minHeight: 1.sh,
//             ),
//             child: IntrinsicHeight(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Icon(
//                           Icons.arrow_back,
//                           size: 24.sp,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Container(
//                         width: 0.6.sw,
//                         height: 12.h,
//                         decoration: BoxDecoration(
//                           color: AppColors.dark4,
//                           borderRadius: BorderRadius.circular(100.r),
//                         ),
//                         child: FractionallySizedBox(
//                           alignment: Alignment.centerLeft,
//                           widthFactor: 0.33,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: AppColors.primary500,
//                               borderRadius: BorderRadius.circular(100.r),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(),
//                     ],
//                   ),
//                   SizedBox(height: 24.h),
//                   Center(
//                     child: Text(
//                       'Siz qaysi toifaga kirasiz ?',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24.sp,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "Nunito",
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//                   Center(
//                     child: Text(
//                       'Toyfani tanlash orqali sizga qanday testlarni\ntafsiya qilishni xal qilamiz!',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFFB0B0B0),
//                         fontSize: 14.sp,
//                         height: 1.4,
//                         fontFamily: "Nunito",
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 40.h),
//                   Column(
//                     spacing: 24,
//                     children: [
//                       PressEffect(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => RegisterScreen(
//                                 status: UserStatus.schoolStudent,
//                               ),
//                             ),
//                           );
//                         },
//                         child: WAccountType(
//                           icon: Icons.school,
//                           title: 'Maktab o\'quvchisi',
//                           gradient: AppColors.gradientBlue,
//                         ),
//                       ),
//                       PressEffect(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => RegisterScreen(
//                                 status: UserStatus.teacher,
//                               ),
//                             ),
//                           );
//                         },
//                         child: WAccountType(
//                           icon: Icons.person,
//                           title: 'O\'qtuvchi',
//                           gradient: AppColors.gradientOrange,
//                         ),
//                       ),
//                       PressEffect(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => RegisterScreen(
//                                 status: UserStatus.stduent,
//                               ),
//                             ),
//                           );
//                         },
//                         child: WAccountType(
//                           icon: Icons.group,
//                           title: 'Talaba',
//                           gradient: AppColors.gradientGreen,
//                         ),
//                       ),
//                       PressEffect(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => RegisterScreen(
//                                 status: UserStatus.worker,
//                               ),
//                             ),
//                           );
//                         },
//                         child: WAccountType(
//                           icon: Icons.work,
//                           title: 'Ishchi',
//                           gradient: AppColors.gradientRed,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 42),
//                   CustomButton(
//                     text: "Skip",
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => RegisterScreen(),
//                         ),
//                       );
//                     },
//                     isFilled: false,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
