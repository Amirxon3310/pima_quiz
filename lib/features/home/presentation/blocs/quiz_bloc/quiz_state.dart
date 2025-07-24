import 'package:pima_quiz/features/home/data/models/quiz_model.dart';
import 'package:pima_quiz/features/home/data/models/test_model.dart';

class QuizState {
  final QuizModel? quiz;
  final List<TestModel> tests;
  bool? checkBox;
  final int index;
  final int count;
  final bool? theEnd;
  final bool isLoading;
  final int correctAnswer;
  final String selectedAnswer;
  final bool nextQuestion;
  final int count2;

  QuizState({
    required this.tests,
    required this.quiz,
    this.checkBox,
    required this.index,
    required this.count,
    this.theEnd,
    required this.isLoading,
    required this.correctAnswer,
    required this.selectedAnswer,
    required this.nextQuestion,
    required this.count2,
  });

  QuizState copyWith(
      {QuizModel? quiz,
      List<TestModel>? tests,
      bool? checkBox,
      int? index,
      int? count,
      bool? theEnd,
      bool? isLoading,
      int? correctAnswer,
      String? selectedAnswer,
      bool? nextQuestion,
      int? count2}) {
    return QuizState(
        quiz: quiz ?? this.quiz,
        tests: tests ?? this.tests,
        checkBox: checkBox ?? this.checkBox,
        index: index ?? this.index,
        count: count ?? this.count,
        theEnd: theEnd ?? this.theEnd,
        isLoading: isLoading ?? this.isLoading,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        selectedAnswer: selectedAnswer ?? this.selectedAnswer,
        nextQuestion: nextQuestion ?? this.nextQuestion,
        count2: count2 ?? this.count2);
  }
}
