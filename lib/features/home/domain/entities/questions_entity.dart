class QuestionsEntity {
  final String id;
  final String categoryId;
  final Map<String, dynamic> creator;
  final String favorited;
  final String photo;
  final String questions;
  final String questionsBodyId;
  final String title;

  QuestionsEntity({
    required this.id,
    required this.categoryId,
    required this.creator,
    required this.favorited,
    required this.photo,
    required this.questions,
    required this.questionsBodyId,
    required this.title,
  });
}
