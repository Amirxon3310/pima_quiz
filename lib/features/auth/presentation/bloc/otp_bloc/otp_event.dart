abstract class OtpEvent {}

class SendOtpPressed extends OtpEvent {
  final String email;
  SendOtpPressed(this.email);
}

class VerifyOtpPressed extends OtpEvent {
  final String email;
  final String otpCode;
  VerifyOtpPressed({required this.email, required this.otpCode});
}
