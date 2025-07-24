import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
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

  String? answerId;
  String questionId = "";
  ValueNotifier<bool> isClose = ValueNotifier(false);

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
                  builder: (context) => TestResultScreen(
                    totalQusetion: state.count,
                    correctAnswer: state.correctAnswer,
                  ),
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
                    isClose: isClose);
              } else if (state.checkBox == false) {
                showTopNotification(
                  context: context,
                  message: "Fyuhhh.. That was close",
                  backgroundColor: AppColors.error,
                  title: "Incorrect",
                  isClose: isClose,
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
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${state.count2 + 1}/${state.tests.length}',
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
                                curve: Curves.easeInOut,
                                width:
                                    400 * (state.count2 / state.tests.length),
                                height: 16,
                                duration: Duration(seconds: 1),
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
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 12,
                            ),
                            child: BlocConsumer<QuizBloc, QuizState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  final test = state.tests[state.index];
                                  print(state.checkBox);
                                  print(state.count);
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
                                            image: test.image != null
                                                ? NetworkImage(test.image!)
                                                    as ImageProvider
                                                : AssetImage(
                                                        'assets/images/profileBanner.png')
                                                    as ImageProvider,
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
                                                onTap: () {
                                                  context.read<QuizBloc>().add(
                                                      SelectedAnswerEvent(
                                                          answerId: test
                                                              .options[0].id));
                                                  answerId = test.options[0].id;
                                                  questionId = test.id;
                                                },
                                                color: state
                                                        .selectedAnswer.isEmpty
                                                    ? AppColors.blue
                                                    : state.selectedAnswer ==
                                                            test.options[0].id
                                                        ? AppColors.blue
                                                        : AppColors.blue
                                                            .withAlpha(50),
                                                title: test.options[0].text,
                                                titleColor: state
                                                        .selectedAnswer.isEmpty
                                                    ? AppColors.white
                                                    : state.selectedAnswer ==
                                                            test.options[0].id
                                                        ? AppColors.white
                                                        : AppColors.white
                                                            .withAlpha(50),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: VariantButton(
                                                onTap: () {
                                                  context.read<QuizBloc>().add(
                                                      SelectedAnswerEvent(
                                                          answerId: test
                                                              .options[1].id));
                                                  answerId = test.options[1].id;
                                                  questionId = test.id;
                                                },
                                                color: state
                                                        .selectedAnswer.isEmpty
                                                    ? AppColors.success
                                                    : state.selectedAnswer ==
                                                            test.options[1].id
                                                        ? AppColors.success
                                                        : AppColors.success
                                                            .withAlpha(50),
                                                title: test.options[1].text,
                                                titleColor: state
                                                        .selectedAnswer.isEmpty
                                                    ? AppColors.white
                                                    : state.selectedAnswer ==
                                                            test.options[1].id
                                                        ? AppColors.white
                                                        : AppColors.white
                                                            .withAlpha(50),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: VariantButton(
                                                onTap: () {
                                                  context.read<QuizBloc>().add(
                                                      SelectedAnswerEvent(
                                                          answerId: test
                                                              .options[2].id));
                                                  answerId = test.options[2].id;
                                                  questionId = test.id;
                                                },
                                                color: state
                                                        .selectedAnswer.isEmpty
                                                    ? AppColors.orange
                                                    : state.selectedAnswer ==
                                                            test.options[2].id
                                                        ? AppColors.orange
                                                        : AppColors.orange
                                                            .withAlpha(50),
                                                title: test.options[2].text,
                                                titleColor: state
                                                        .selectedAnswer.isEmpty
                                                    ? AppColors.white
                                                    : state.selectedAnswer ==
                                                            test.options[2].id
                                                        ? AppColors.white
                                                        : AppColors.white
                                                            .withAlpha(50),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: VariantButton(
                                                onTap: () {
                                                  context.read<QuizBloc>().add(
                                                      SelectedAnswerEvent(
                                                          answerId: test
                                                              .options[3].id));
                                                  answerId = test.options[3].id;
                                                  questionId = test.id;
                                                },
                                                color: state
                                                        .selectedAnswer.isEmpty
                                                    ? AppColors.error
                                                    : state.selectedAnswer ==
                                                            test.options[3].id
                                                        ? AppColors.error
                                                        : AppColors.error
                                                            .withAlpha(50),
                                                title: test.options[3].text,
                                                titleColor: state
                                                        .selectedAnswer.isEmpty
                                                    ? AppColors.white
                                                    : state.selectedAnswer ==
                                                            test.options[3].id
                                                        ? AppColors.white
                                                        : AppColors.white
                                                            .withAlpha(50),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ),
                          4.height,
                          BlocBuilder<QuizBloc, QuizState>(
                            builder: (context, state) {
                              print("NEXT: ${state.nextQuestion}");
                              return state.nextQuestion
                                  ? CustomButton(
                                      text: "Next",
                                      onTap: () {
                                        answerId = null;
                                        questionId = "";
                                        isClose.value = state.nextQuestion;
                                        context
                                            .read<QuizBloc>()
                                            .add(NextQuestion());
                                      })
                                  : CustomButton(
                                      text: "Submit answer",
                                      onTap: answerId != null &&
                                              questionId.isNotEmpty
                                          ? () {
                                              isClose.value =
                                                  state.nextQuestion;
                                              context.read<QuizBloc>().add(
                                                    CheckAnswer(
                                                        answerId: answerId!,
                                                        questionid: questionId),
                                                  );
                                            }
                                          : () {},
                                      isFilled: state.selectedAnswer.isNotEmpty
                                          ? true
                                          : false);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
