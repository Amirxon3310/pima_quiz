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
  final DateTime createdAt;
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
      // userStatus:  json['status'],
      birthday: DateTime.parse(json['birthday']),
      createdAt: json['createdAt'],
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
      'birthday': birthday?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'image': image
    };
  }
}
