import 'package:pima_quiz/features/profile/data/datasource/quiz_attempt_remote_datasource.dart';
import 'package:pima_quiz/features/profile/domain/entities/quiz_attempt.dart';
import 'package:pima_quiz/features/profile/domain/repository/quiz_attempt_repository.dart';

class QuizAttemptRepositoryImpl implements QuizAttemptRepository {
  final QuizAttemptRemoteDataSource remoteDataSource;

  QuizAttemptRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<QuizAttempt>> getUserAttempts(String uid) {
    return remoteDataSource.getUserAttempts(uid);
  }

  @override
  Future<void> startAttempt(
      String uid, String quizId, int totalQuestions, String quizTitle, String quizPhoto) {
    return remoteDataSource.startAttempt(uid, quizId, totalQuestions, quizTitle, quizPhoto);
  }

  @override
  Future<void> finishAttempt(String uid, String quizId, int score) {
    return remoteDataSource.finishAttempt(uid, quizId, score);
  }
}
