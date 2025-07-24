import 'package:cloud_firestore/cloud_firestore.dart';

enum UserStatus {
  teacher,
  stduent,
  schoolStudent,
  worker,
}

class UserModel {
  final String id;
  final int? age;
  final String? fullName;
  final String email;
  final String? phoneNumber;
  final String? username;
  final DateTime? birthday;
  final UserStatus? userStatus;
  final DateTime? createdAt;
  final String? image;

  UserModel({
    required this.id,
    this.age,
    this.fullName,
    required this.email,
    this.phoneNumber,
    this.username,
    this.userStatus,
    this.birthday,
    required this.createdAt,
    this.image,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      age: json['age'],
      fullName: json['full_name'],
      email: json['email'],
      phoneNumber: json['phone'],
      username: json['username'],
      userStatus: UserModel.parseUserStatus(json['status']),
      birthday: json['birthday'] != null
          ? (json['birthday'] as Timestamp).toDate()
          : null,
      createdAt: json['createdAt'] is Timestamp
          ? (json['createdAt'] as Timestamp).toDate()
          : null,
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap(String uid) {
    return {
      'user_id': uid,
      'age': age,
      'full_name': fullName,
      'email': email,
      'phone': phoneNumber,
      'username': username,
      'status': userStatus?.name,
      'birthday': birthday != null ? Timestamp.fromDate(birthday!) : null,
      'createdAt': Timestamp.fromDate(createdAt ?? DateTime.now()),
      'image': image
    };
  }

  static UserStatus? parseUserStatus(String? status) {
    if (status == null) return null;
    try {
      return UserStatus.values.firstWhere((e) => e.name == status);
    } catch (e) {
      return null;
    }
  }
}
