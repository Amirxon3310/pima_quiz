import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_state.dart';
import 'package:pima_quiz/features/home/presentation/pages/test_screen.dart';
import 'package:pima_quiz/features/home/presentation/widgets/w_test_details.dart';

class QuizDetailsScreen extends StatefulWidget {
  final String quizId;
  const QuizDetailsScreen({super.key, required this.quizId});

  @override
  State<QuizDetailsScreen> createState() => _QuizDetailsScreenState();
}

class _QuizDetailsScreenState extends State<QuizDetailsScreen> {
  @override
  void didChangeDependencies() {
    context.read<QuizBloc>().add(GetQuizById(widget.quizId));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('QuizDetailsScreen');
    return Scaffold(
      backgroundColor: AppColors.dark1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: Colors.white,
            size: 28,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Row(
              children: [
                SizedBox(
                  height: 28,
                  child: SvgPicture.asset(
                    AppIcons.star,
                    color: AppColors.orange,
                  ),
                ),
                16.width,
                SizedBox(
                  height: 28,
                  child: SvgPicture.asset(
                    AppIcons.moreCircle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            return state.isLoading
                ? Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20.h,
                    children: [
                      1.width,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: (state.quiz?.photo != null &&
                                    state.quiz!.photo!.isNotEmpty)
                                ? NetworkImage(state.quiz!.photo!)
                                : AssetImage(AppImages.profileImages)
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        width: double.infinity,
                        height: 180.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.quiz?.title ?? '',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Nunito",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "text narxi: 12 coin",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: "Nunito",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 12,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: AppColors.dark4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                flex: 1,
                                child: WTestDetails(
                                    title: state.quiz?.questions ?? '0',
                                    description: 'Qusetions'),
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: AppColors.dark4,
                              ),
                              Flexible(
                                flex: 1,
                                child: WTestDetails(
                                    title: state.quiz?.played ?? '0',
                                    description: 'Played'),
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: AppColors.dark4,
                              ),
                              Flexible(
                                flex: 1,
                                child: WTestDetails(
                                    title: state.quiz?.favorited ?? '0',
                                    description: 'Favorited'),
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: AppColors.dark4,
                              ),
                              Flexible(
                                flex: 1,
                                child: WTestDetails(
                                    title: state.quiz?.shared ?? '0',
                                    description: 'Shared'),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: AppColors.dark4,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Nunito",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Invite your friends to play ${state.quiz?.title} together!",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "Nunito",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).padding.bottom),
                        child: Row(
                          spacing: 16,
                          children: [
                            Flexible(
                              flex: 1,
                              child: CustomButton(
                                text: "Add to favorite",
                                onTap: () {},
                                isFilled: false,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: CustomButton(
                                text: "Testni boshlash",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TestScreen(
                                        image: state.quiz?.photo ?? '',
                                        name: state.quiz?.title ?? '',
                                        testId:
                                            state.quiz?.questionsBodyId ?? '',
                                        quizCount: int.parse(
                                            state.quiz?.questions ?? '0'),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      2.height,
                    ],
                  );
          },
        ),
      ),
    );
  }
}
