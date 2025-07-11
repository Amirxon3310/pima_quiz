import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel({
    required super.id,
    required super.title,
    required super.body,
    required super.url,
    required super.authorName,
  });

  factory NewsModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NewsModel(
      id: doc.id,
      title: data['title'] ?? '',
      body: data['body'] ?? '',
      url: data['url'] ?? '',
      authorName: data['author']?['name'] ?? '',
    );
  }
}
