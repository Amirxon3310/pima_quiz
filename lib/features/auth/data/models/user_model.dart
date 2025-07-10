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
  final UserStatus userStatus;

  UserModel({
    required this.id,
    required this.age,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.username,
    required this.userStatus,
    required this.birthday,
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
    );
  }
}
