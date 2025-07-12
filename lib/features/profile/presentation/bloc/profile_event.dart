abstract class ProfileEvent {}

class GetUserByIdEvent extends ProfileEvent {
  final String userId;

  GetUserByIdEvent(this.userId);
}
