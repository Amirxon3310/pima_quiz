import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pima_quiz/core/extensions/app_extensions.dart';
import 'package:pima_quiz/core/widgets/custom_button.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_event.dart';
import 'package:pima_quiz/features/home/presentation/pages/rankings_screen.dart';

class TestResultScreen extends StatefulWidget {
  final int totalQusetion;
  final int correctAnswer;
  final String testId;
  final String image;
  final String name;
  final int quizCount;
  const TestResultScreen({
    super.key,
    required this.totalQusetion,
    required this.correctAnswer,
    required this.testId,
    required this.image,
    required this.name,
    required this.quizCount,
  });

  @override
  State<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<QuizBloc>().add(AddTestUserHistory(
          testId: widget.testId,
          image: widget.image,
          name: widget.name,
          quizCount: widget.quizCount,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/purple_bakcgorund.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RankingsScreen(),
                        ),
                      );
                      context.read<QuizBloc>().add(RestartAllEvent());
                    },
                    icon: Icon(
                      Icons.clear,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Sizning natijangiz",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  30.width,
                ],
              ),
              Column(
                children: [
                  Text(
                    "Umumiy savollar: ${widget.totalQusetion}",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Tog'ri javoblar soni: ${widget.correctAnswer}",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${((widget.correctAnswer / widget.totalQusetion) * 100).toInt()}%",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: Lottie.asset('assets/lotties/Trophy.json'),
                  )
                ],
              ),
              CustomButton(
                fillColor: Colors.white,
                text: "Next",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RankingsScreen(),
                    ),
                  );
                  context.read<QuizBloc>().add(RestartAllEvent());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
