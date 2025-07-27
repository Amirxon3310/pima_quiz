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

class SelectedAnswerEvent extends QuizEvent {
  final String answerId;

  SelectedAnswerEvent({required this.answerId});
}

class NextQuestion extends QuizEvent {}

class AddTestUserHistory extends QuizEvent {
  String testId;
  String image;
  String name;
  int quizCount;

  AddTestUserHistory({
    required this.testId,
    required this.image,
    required this.name,
    required this.quizCount,
  });
}
