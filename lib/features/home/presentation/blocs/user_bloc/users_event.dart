abstract class UsersEvent {}

class LoadUsersEvent extends UsersEvent {}

class SearchUsersEvent extends UsersEvent {
  final String query;

  SearchUsersEvent(this.query);
}
