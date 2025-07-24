import 'package:pima_quiz/features/home/domain/entities/users_entity.dart';
import 'package:pima_quiz/features/home/domain/repositories/users_repository.dart';

class GetUsersUsecase {
  final UsersRepository repository;

  GetUsersUsecase(this.repository);

  Future<List<UsersEntity>> call() => repository.getUsers();

  Future<List<UsersEntity>> getOrderedUsers() => repository.getSortedUsers();
}
