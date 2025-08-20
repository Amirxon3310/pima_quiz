import 'package:pima_quiz/features/profile/domain/entities/quiz_attempt.dart';

abstract class QuizAttemptState {}

class QuizAttemptInitial extends QuizAttemptState {}

class QuizAttemptLoading extends QuizAttemptState {}

class QuizAttemptLoaded extends QuizAttemptState {
  final List<QuizAttempt> attempts;
  QuizAttemptLoaded(this.attempts);
}

class QuizAttemptError extends QuizAttemptState {
  final String message;
  QuizAttemptError(this.message);
}