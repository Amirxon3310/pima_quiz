import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'package:pima_quiz/features/profile/data/models/tests_done_model.dart';

abstract class ProfileRepository {
  Future<UserModel?> getUserById();
  Future<bool> editUserDateOfBirthday({
    required DateTime newDate,
  });
  Future<bool> editUserAllInfo({
    required String newFullName,
    required String phoneNumber,
    required String age,
  });
  Future<List<TestsDoneModel>> getTestsByUserId();
}
