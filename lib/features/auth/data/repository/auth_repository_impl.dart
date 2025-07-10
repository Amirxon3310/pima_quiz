import 'package:pima_quiz/features/auth/data/datasource/auth_datasource.dart';
import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<void> register({required UserModel user, required String password}) {
    return dataSource.register(user: user, password: password);
  }

  @override
  Future<void> login(String email, String password) {
    return dataSource.login(email, password);
  }
}
