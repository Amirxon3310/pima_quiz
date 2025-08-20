// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pima_quiz/core/extensions/app_extensions.dart';
// import 'package:pima_quiz/core/resources/app_colors.dart';
// import 'package:pima_quiz/core/resources/app_images.dart';

// class QuizzoList extends StatelessWidget {
//   const QuizzoList({super.key});

//   Widget _quizItem(
//     String title,
//     String subtitle,
//     int questions,
//     String type,
//   ) =>
//       Container(
//         decoration: BoxDecoration(
//           color: AppColors.dark2,
//           borderRadius: BorderRadius.circular(16.r),
//           border: Border.all(color: AppColors.dark4),
//         ),
//         child: Row(
//           children: [
//             Container(
//               height: 100.h,
//               width: 120.w,
//               decoration: BoxDecoration(
//                 color: Colors.pinkAccent,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16.r),
//                   bottomLeft: Radius.circular(16.r),
//                 ),
//                 image: DecorationImage(
//                   image: AssetImage(AppImages.personalInfoAvatar),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Container(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
//                       decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(12.r),
//                       ),
//                       child: Text(
//                         "$questions Qs",
//                         style: TextStyle(
//                           fontFamily: 'Nunito',
//                           color: Colors.white,
//                           fontSize: 10.sp,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(width: 12.w),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 spacing: 4.h,
//                 children: [
//                   Text(
//                     title,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontFamily: 'Nunito',
//                       fontSize: 16.sp,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     subtitle,
//                     style: TextStyle(
//                       fontFamily: 'Nunito',
//                       fontSize: 12.sp,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Text(
//                     type,
//                     style: TextStyle(
//                       fontFamily: 'Nunito',
//                       fontSize: 12.sp,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       padding: EdgeInsets.all(0),
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: 10,
//       separatorBuilder: (context, index) => 12.height,
//       itemBuilder: (context, index) => _quizItem(
//         "Back to school quiz",
//         "Today 20 plays",
//         20,
//         "Public",
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/quiz_attempt_bloc/quiz_attempt_bloc.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/quiz_attempt_bloc/quiz_attempt_state.dart';

class QuizzoList extends StatelessWidget {
  const QuizzoList({super.key});

  Widget _quizItem({
    required String title,
    required String subtitle,
    required int questions,
    required String type,
    required String photo,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: AppColors.dark2,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.dark4),
        ),
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r),
                ),
                image: DecorationImage(
                  image: photo.isNotEmpty
                      ? NetworkImage(photo)
                      : AssetImage(AppImages.personalInfoAvatar)
                          as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        "$questions Qs",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    type,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizAttemptBloc, QuizAttemptState>(
      builder: (context, state) {
        if (state is QuizAttemptLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is QuizAttemptLoaded) {
          final attempts = state.attempts;

          if (attempts.isEmpty) {
            return Center(
              child: Text(
                "Hali ishlagan quizlaringiz yo'q",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: attempts.length,
            separatorBuilder: (context, index) => 12.height,
            itemBuilder: (context, index) {
              final attempt = attempts[index];
              return _quizItem(
                title: attempt.quizTitle,
                subtitle: "Score: ${attempt.score ?? 0}",
                questions: attempt.totalQuestions,
                type: "Public", // hozircha hardcode
                photo: attempt.quizPhoto,
              );
            },
          );
        } else if (state is QuizAttemptError) {
          return Center(
            child: Text(
              "Xatolik: ${state.message}",
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

