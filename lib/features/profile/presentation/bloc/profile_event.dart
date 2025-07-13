abstract class ProfileEvent {}

class GetUserByIdEvent extends ProfileEvent {
  GetUserByIdEvent();
}

class EditUserDateOfBirhtday extends ProfileEvent {
  final DateTime newDate;
  EditUserDateOfBirhtday(this.newDate);
}

class EditUserAllInfo extends ProfileEvent {
  final String newFullName;
  final String phoneNumber;
  final String age;
  EditUserAllInfo({
    required this.age,
    required this.newFullName,
    required this.phoneNumber,
  });
}
