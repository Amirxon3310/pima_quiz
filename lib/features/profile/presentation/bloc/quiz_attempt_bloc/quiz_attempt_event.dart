abstract class QuizAttemptEvent {}

class LoadUserAttempts extends QuizAttemptEvent {
  final String uid;
  LoadUserAttempts(this.uid);
}

class StartAttemptEvent extends QuizAttemptEvent {
  final String uid;
  final String quizId;
  final int totalQuestions;
  final String quizTitle;
  final String quizPhoto;
  StartAttemptEvent(this.uid, this.quizId, this.totalQuestions, this.quizTitle, this.quizPhoto);
}

class FinishAttemptEvent extends QuizAttemptEvent {
  final String uid;
  final String quizId;
  final int score;
  FinishAttemptEvent(this.uid, this.quizId, this.score);
}