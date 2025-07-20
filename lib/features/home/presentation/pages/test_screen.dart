import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/resources/app_colors.dart';
import 'package:pima_quiz/core/resources/app_icons.dart';
import 'package:pima_quiz/core/resources/app_images.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/core/widgets/press_effect.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_state.dart';
import 'package:pima_quiz/features/home/presentation/widgets/variant_button.dart';

class TestScreen extends StatefulWidget {
  final String testId;
  const TestScreen({super.key, required this.testId});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final PageController _pageController = PageController();
  Map<int, int> selectedAnswers = {};
  int currentPage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<QuizBloc>().add(GetTestsById(widget.testId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state.tests.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              final currentTest = state.tests[currentPage];

              return Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${currentPage + 1}/${state.tests.length}',
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
                        width: MediaQuery.of(context).size.width *
                            ((currentPage + 1) / state.tests.length),
                        height: 16,
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.tests.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final test = state.tests[index];
                        final selected = selectedAnswers[index];

                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: AssetImage(AppImages.profileImages),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              test.question,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              color: AppColors.dark4,
                              height: 1,
                            ),
                            SizedBox(height: 12),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: test.options.length,
                              itemBuilder: (context, i) {
                                final isDimmed =
                                    selected != null && selected != i;

                                return PressEffect(
                                  onTap: () {
                                    setState(() {
                                      selectedAnswers[index] = i;
                                    });
                                  },
                                  child: Opacity(
                                    opacity: isDimmed ? 0.5 : 1.0,
                                    child: VariantButton(
                                      color: [
                                        AppColors.blue,
                                        AppColors.success,
                                        AppColors.orange,
                                        AppColors.error
                                      ][i % 4],
                                      title: test.options[i].text,
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, i) => 12.height,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 12,
                    ),
                    child: BlocListener<QuizBloc, QuizState>(
                      listener: (context, state) {
                        // Bu yerda javob natijalarini qayta ishlash mumkin
                      },
                      child: CustomButton(
                        text: "Submit answer",
                        onTap: selectedAnswers.containsKey(currentPage)
                            ? () {
                                final selectedOptionIndex =
                                    selectedAnswers[currentPage]!;
                                final selectedOptionId =
                                    currentTest.options[selectedOptionIndex].id;

                                // Javobni tekshirish
                                context.read<QuizBloc>().add(CheckAnswer(
                                      answerId: selectedOptionId,
                                      questionid: currentTest.id,
                                    ));

                                // Keyingi sahifaga o'tish
                                if (currentPage + 1 < state.tests.length) {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  // currentPage onPageChanged da avtomatik yangilanadi
                                } else {
                                  // Test tugadi - natijalar sahifasiga o'tish
                                  print('Test tugadi!');
                                  // Navigator.push(...) yoki boshqa yo'l
                                }
                              }
                            : () {
                                // Javob tanlanmagan holatda xabar berish
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Iltimos, javobni tanlang!'),
                                    backgroundColor: AppColors.error,
                                  ),
                                );
                              },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
