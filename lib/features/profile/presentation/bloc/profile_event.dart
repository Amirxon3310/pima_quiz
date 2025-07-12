abstract class ProfileEvent {}

class GetUserByIdEvent extends ProfileEvent {
  GetUserByIdEvent();
}

class EditUserDateOfBirhtday extends ProfileEvent {
  final DateTime newDate;
  EditUserDateOfBirhtday(this.newDate);
}
