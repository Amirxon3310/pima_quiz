import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/data/models/creator_model.dart';

class QuizModel {
  final String? id;
  final String? title;
  final String? photo;
  final String? categoryId;
  final String? createAt;
  final String? played;
  final String? favorited;
  final String? shared;
  final String? questions;
  final String? questionsBodyId;
  final Creator? creator;

  QuizModel({
    this.id,
    this.title,
    this.photo,
    this.categoryId,
    this.createAt,
    this.played,
    this.favorited,
    this.shared,
    this.questions,
    this.questionsBodyId,
    this.creator,
  });

  factory QuizModel.fromMap(DocumentSnapshot map) {
    final data = map.data() as Map<String, dynamic>;
    return QuizModel(
      id: data['id'] as String?,
      title: data['title'] as String?,
      photo: data['photo'] as String?,
      categoryId: data['category_id'] as String?,
      createAt: data['create_at'] as String?,
      played: data['played'] as String?,
      favorited: data['favorited'] as String?,
      shared: data['shared'] as String?,
      questions: data['questions'] as String?,
      questionsBodyId: data['questions_body_id'] as String?,
      creator: data['creator'] != null
          ? Creator.fromMap(data['creator'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'photo': photo,
      'category_id': categoryId,
      'create_at': createAt,
      'played': played,
      'favorited': favorited,
      'shared': shared,
      'questions': questions,
      'questions_body_id': questionsBodyId,
      'creator': creator?.toMap(),
    };
  }

  QuizModel copyWith({
    String? id,
    String? title,
    String? photo,
    String? categoryId,
    String? createAt,
    String? played,
    String? favorited,
    String? shared,
    String? questions,
    String? questionsBodyId,
    Creator? creator,
  }) {
    return QuizModel(
      id: id ?? this.id,
      title: title ?? this.title,
      photo: photo ?? this.photo,
      categoryId: categoryId ?? this.categoryId,
      createAt: createAt ?? this.createAt,
      played: played ?? this.played,
      favorited: favorited ?? this.favorited,
      shared: shared ?? this.shared,
      questions: questions ?? this.questions,
      questionsBodyId: questionsBodyId ?? this.questionsBodyId,
      creator: creator ?? this.creator,
    );
  }
}
