import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/domain/entities/users_entity.dart';

class UsersModel extends UsersEntity {
  UsersModel({
    required super.name,
    required super.point,
    required super.url,
  });

  factory UsersModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UsersModel(
      name: data["full_name"] ?? "Unknown",
      point: data["point"] ?? "0",
      url: data["image"] ?? "",
    );
  }
  @override
  String toString() {
    return "\nName: $name\nPoint: $point\nUrl: $url";
  }
}
