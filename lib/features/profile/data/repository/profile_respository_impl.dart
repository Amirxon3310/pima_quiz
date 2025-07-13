import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'package:pima_quiz/features/profile/data/datasource/profile_datasource.dart';
import 'package:pima_quiz/features/profile/domain/repository/profile_repository.dart';

class ProfileRespositoryImpl implements ProfileRepository {
  final ProfileDatasource dataSource;

  ProfileRespositoryImpl({required this.dataSource});

  @override
  Future<UserModel?> getUserById() {
    return dataSource.getUserById();
  }

  @override
  Future<bool> editUserDateOfBirthday({required DateTime newDate}) {
    return dataSource.editUserDateOfBirthday(newDate: newDate);
  }

  @override
  Future<bool> editUserAllInfo({
    required String newFullName,
    required String phoneNumber,
    required String age,
  }) {
    return dataSource.editUserAllInfo(
      newFullName: newFullName,
      phoneNumber: phoneNumber,
      age: age,
    );
  }
}
