import 'package:pima_quiz/features/profile/domain/entities/quiz_attempt.dart';

abstract class QuizAttemptRepository {
  Stream<List<QuizAttempt>> getUserAttempts(String uid);
  Future<void> startAttempt(String uid, String quizId, int totalQuestions, String quizTitle, String quizPhoto);
  Future<void> finishAttempt(String uid, String quizId, int score);
}
