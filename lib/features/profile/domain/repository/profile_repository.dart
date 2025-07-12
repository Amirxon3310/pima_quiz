import 'package:pima_quiz/features/auth/data/models/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel> getUserById(String userId);
}
