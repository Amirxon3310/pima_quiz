import 'package:pima_quiz/features/home/domain/entities/users_entity.dart';

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersSearching extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UsersEntity> originalUsersList;
  final List<UsersEntity> filteredUsersList;

  UsersLoaded({
    required this.originalUsersList,
    required this.filteredUsersList,
  });
}

class UsersError extends UsersState {
  final String message;
  UsersError(this.message);
}
