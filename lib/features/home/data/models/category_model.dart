import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.title,
    required super.url,
  });

  factory CategoryModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryModel(
      id: data["id"],
      title: data["title"] ?? "",
      url: data["url"] ?? "",
    );
  }
}
