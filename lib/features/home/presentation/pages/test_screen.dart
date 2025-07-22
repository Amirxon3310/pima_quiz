import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/custom_showsnackbar.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_state.dart';
import 'package:pima_quiz/features/home/presentation/pages/test_result_screen.dart';
import 'package:pima_quiz/features/home/presentation/widgets/variant_button.dart';

class TestScreen extends StatefulWidget {
  final String testId;
  const TestScreen({super.key, required this.testId});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<QuizBloc>().add(GetTestsById(widget.testId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.dark1,
        body: BlocListener<QuizBloc, QuizState>(
          listener: (context, state) {
            if (state.theEnd == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestResultScreen(),
                ),
              );
            }
          },
          child: BlocListener<QuizBloc, QuizState>(
            listenWhen: (previous, current) => previous.count < current.count,
            listener: (context, state) {
              if (state.checkBox == true) {
                showTopNotification(
                  context: context,
                  message: "+2",
                  backgroundColor: AppColors.success,
                  title: "Correct",
                );
              } else if (state.checkBox == false) {
                showTopNotification(
                  context: context,
                  message: "Fyuhhh.. That was close",
                  backgroundColor: AppColors.error,
                  title: "Incorrect",
                );
              }
            },
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<QuizBloc, QuizState>(
                  builder: (context, state) {
                    if (state.tests.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Column(
                      children: [
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${1}/${state.tests.length}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "Nunito",
                              ),
                            ),
                            Text(
                              'Puzzle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "Nunito",
                              ),
                            ),
                            SizedBox(
                              height: 28,
                              width: 28.w,
                              child: SvgPicture.asset(
                                // ignore: deprecated_member_use
                                color: Colors.white,
                                AppIcons.moreCircle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.dark4,
                              ),
                            ),
                            AnimatedContainer(
                              width: double.infinity,
                              height: 16,
                              duration: Duration(milliseconds: 500),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).padding.bottom + 12,
                          ),
                          child: BlocConsumer<QuizBloc, QuizState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                final test = state.tests[state.index];
                                return Column(
                                  spacing: 20,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/profileBanner.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      test.question,
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: AppColors.dark4,
                                    ),
                                    SizedBox(
                                      height: 280,
                                      child: Column(
                                        spacing: 12,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: VariantButton(
                                              onTap: () async {
                                                context
                                                    .read<QuizBloc>()
                                                    .add(CheckAnswer(
                                                      answerId:
                                                          test.options[0].id,
                                                      questionid: test.id,
                                                    ));
                                              },
                                              color: AppColors.blue,
                                              title: test.options[0].text,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: VariantButton(
                                              onTap: () async {
                                                context
                                                    .read<QuizBloc>()
                                                    .add(CheckAnswer(
                                                      answerId:
                                                          test.options[1].id,
                                                      questionid: test.id,
                                                    ));
                                              },
                                              color: AppColors.success,
                                              title: test.options[1].text,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: VariantButton(
                                              onTap: () async {
                                                context
                                                    .read<QuizBloc>()
                                                    .add(CheckAnswer(
                                                      answerId:
                                                          test.options[2].id,
                                                      questionid: test.id,
                                                    ));
                                              },
                                              color: AppColors.orange,
                                              title: test.options[2].text,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: VariantButton(
                                              onTap: () async {
                                                context
                                                    .read<QuizBloc>()
                                                    .add(CheckAnswer(
                                                      answerId:
                                                          test.options[3].id,
                                                      questionid: test.id,
                                                    ));
                                              },
                                              color: AppColors.error,
                                              title: test.options[3].text,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              }),
                        ),
                        Spacer(),
                        CustomButton(
                          text: "Submit answer",
                          onTap: () {},
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
