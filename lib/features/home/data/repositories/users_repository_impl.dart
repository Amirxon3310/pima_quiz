import 'package:pima_quiz/features/home/data/datasources/users_remote_datasource.dart';
import 'package:pima_quiz/features/home/domain/entities/users_entity.dart';
import 'package:pima_quiz/features/home/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDatasource remote;

  UsersRepositoryImpl(this.remote);

  @override
  Future<List<UsersEntity>> getUsers() => remote.getUsers();
}
