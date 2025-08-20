class QuizAttempt {
  final String quizId;
  final String status; // in_progress | completed
  final DateTime startedAt;
  final DateTime? completedAt;
  final int? score;
  final int totalQuestions;
  final String quizTitle;
  final String quizPhoto;

  QuizAttempt({
    required this.quizId,
    required this.status,
    required this.startedAt,
    this.completedAt,
    this.score,
    required this.totalQuestions,
    required this.quizTitle,
    required this.quizPhoto,
  });
}
