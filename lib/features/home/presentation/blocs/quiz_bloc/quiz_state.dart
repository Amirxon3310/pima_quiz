import 'package:pima_quiz/features/home/data/models/quiz_model.dart';
import 'package:pima_quiz/features/home/data/models/test_model.dart';

class QuizState {
  final QuizModel? quiz;
  final List<TestModel> tests;
  final bool checkBox;

  QuizState({required this.tests, required this.quiz, required this.checkBox});

  QuizState copyWith(
      {QuizModel? quiz, List<TestModel>? tests, bool? checkBox}) {
    return QuizState(
      quiz: quiz ?? this.quiz,
      tests: tests ?? this.tests,
      checkBox: checkBox ?? this.checkBox,
    );
  }
}
