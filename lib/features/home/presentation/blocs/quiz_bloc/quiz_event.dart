abstract class QuizEvent {}

class GetQuizById extends QuizEvent {
  String id;

  GetQuizById(this.id);
}

class GetTestsById extends QuizEvent {
  final String id;

  GetTestsById(this.id);
}

class CheckAnswer extends QuizEvent {
  final String questionid;
  final String answerId;

  CheckAnswer({required this.answerId, required this.questionid});
}

class RestartAllEvent extends QuizEvent {}
