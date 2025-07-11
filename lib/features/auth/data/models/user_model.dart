enum UserStatus {
  teacher,
  stduent,
  schoolStudent,
  worker,
}

class UserModel {
  final String id;
  final int age;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String username;
  final DateTime birthday;
  final UserStatus? userStatus;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.age,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.username,
    this.userStatus,
    required this.birthday,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      age: json['age'],
      fullName: json['full_name'],
      email: json['email'],
      phoneNumber: json['phone'],
      username: json['username'],
      userStatus: json['status'],
      birthday: json['birthday'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': id,
      'age': age,
      'full_name': fullName,
      'email': email,
      'phone': phoneNumber,
      'username': username,
      'status': userStatus?.name,
      'birthday': birthday.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
