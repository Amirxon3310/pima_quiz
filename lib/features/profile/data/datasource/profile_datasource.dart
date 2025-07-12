import 'package:pima_quiz/features/auth/data/models/user_model.dart';

abstract class ProfileDatasource {
  Future<UserModel?> getUserById();
  Future<bool> editUserDateOfBirthday({
    required DateTime newDate,
  });
}
