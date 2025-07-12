import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'package:pima_quiz/features/profile/data/datasource/profile_datasource.dart';
import 'package:pima_quiz/features/profile/domain/repository/profile_repository.dart';

class ProfileRespositoryImpl implements ProfileRepository {
  final ProfileDatasource dataSource;

  ProfileRespositoryImpl({required this.dataSource});

  @override
  Future<UserModel> getUserById(String userId) {
    return dataSource.getUserById(userId);
  }
}
