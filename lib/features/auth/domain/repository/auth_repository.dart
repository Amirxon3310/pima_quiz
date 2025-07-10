import 'package:pima_quiz/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<void> register({required UserModel user, required String password});
  Future<void> login(String email, String password);
}
