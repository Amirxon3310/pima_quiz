import 'package:pima_quiz/features/home/domain/entities/users_entity.dart';

abstract class UsersRepository {
  Future<List<UsersEntity>> getUsers();
}
