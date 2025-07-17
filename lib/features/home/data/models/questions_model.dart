import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/domain/entities/questions_entity.dart';

class QuestionsModel extends QuestionsEntity {
  QuestionsModel({
    required super.id,
    required super.categoryId,
    required super.creator,
    required super.favorited,
    required super.photo,
    required super.questions,
    required super.questionsBodyId,
    required super.title,
  });

  factory QuestionsModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return QuestionsModel(
      id: data["id"],
      categoryId: data["category_id"],
      creator: data["creator"],
      favorited: data["favorited"],
      photo: data["photo"],
      questions: data["questions"],
      questionsBodyId: data["questions_body_id"],
      title: data["title"],
    );
  }
}
