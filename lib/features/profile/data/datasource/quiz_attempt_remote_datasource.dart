import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/profile/domain/entities/quiz_attempt.dart';

class QuizAttemptRemoteDataSource {
  final FirebaseFirestore firestore;

  QuizAttemptRemoteDataSource(this.firestore);

  CollectionReference<Map<String, dynamic>> _attempts(String uid) =>
      firestore.collection("users").doc(uid).collection("quiz_attempts");

  Stream<List<QuizAttempt>> getUserAttempts(String uid) {
    return _attempts(uid)
        .orderBy("startedAt", descending: true)
        .snapshots()
        .map((snap) => snap.docs.map((doc) {
              final data = doc.data();
              return QuizAttempt(
                quizId: data["quizId"],
                status: data["status"],
                startedAt: (data["startedAt"] as Timestamp).toDate(),
                completedAt: data["completedAt"] != null
                    ? (data["completedAt"] as Timestamp).toDate()
                    : null,
                score: data["score"],
                totalQuestions: data["totalQuestions"],
                quizTitle: data["quizTitle"],
                quizPhoto: data["quizPhoto"],
              );
            }).toList());
  }

  Future<void> startAttempt(String uid, String quizId, int totalQuestions,
      String quizTitle, String quizPhoto) {
    final now = FieldValue.serverTimestamp();
    return _attempts(uid).doc(quizId).set({
      "quizId": quizId,
      "status": "in_progress",
      "startedAt": now,
      "totalQuestions": totalQuestions,
      "quizTitle": quizTitle,
      "quizPhoto": quizPhoto,
    });
  }

  Future<void> finishAttempt(String uid, String quizId, int score) {
    return _attempts(uid).doc(quizId).update({
      "status": "completed",
      "score": score,
      "completedAt": FieldValue.serverTimestamp(),
    });
  }
}
