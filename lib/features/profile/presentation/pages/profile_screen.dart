// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pima_quiz/core/extensions/app_extensions.dart';
// import 'package:pima_quiz/core/resources/app_colors.dart';
// import 'package:pima_quiz/features/profile/presentation/widgets/w_header.dart';
// import 'package:pima_quiz/features/profile/presentation/widgets/w_quizzolist.dart';
// import 'package:pima_quiz/features/profile/presentation/widgets/w_stats.dart';
// import 'package:pima_quiz/features/profile/presentation/widgets/w_tabs.dart';
// import 'package:pima_quiz/features/profile/presentation/widgets/w_userinfo.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.dark1,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         child: SingleChildScrollView(
//           child: Column(
//             spacing: 20.h,
//             children: [
//               24.height,
//               Header(),
//               UserInfo(),
//               Stats(),
//               Tabs(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "45 Quizzo",
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "Nunito",
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "Newest",
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "Nunito",
//                       color: AppColors.primary500,
//                     ),
//                   )
//                 ],
//               ),
//               QuizzoList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/features/profile/data/datasource/quiz_attempt_remote_datasource.dart';
import 'package:pima_quiz/features/profile/data/repository/quiz_attempt_repository_impl.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/quiz_attempt_bloc/quiz_attempt_event.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/w_header.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/w_stats.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/w_tabs.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/w_userinfo.dart';
import 'package:pima_quiz/features/profile/presentation/widgets/w_quizzolist.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/quiz_attempt_bloc/quiz_attempt_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final String uid; // foydalanuvchi id
  const ProfileScreen({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizAttemptBloc(
        QuizAttemptRepositoryImpl(QuizAttemptRemoteDataSource(
            FirebaseFirestore.instance)), // repository instance
      )..add(LoadUserAttempts(uid)), // ekranga kirishda event yuboramiz
      child: Scaffold(
        backgroundColor: AppColors.dark1,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20.h,
              children: [
                24.height,
                Header(),
                UserInfo(),
                Stats(),
                Tabs(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quizzo Attempts",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Newest",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                        color: AppColors.primary500,
                      ),
                    )
                  ],
                ),
                QuizzoList(),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
