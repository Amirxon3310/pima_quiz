abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpSending extends OtpState {}

class OtpSent extends OtpState {
  final String otp;

  OtpSent(this.otp);
}

class OtpVerifying extends OtpState {}

class OtpVerified extends OtpState {}

class OtpError extends OtpState {
  final String error;
  OtpError(this.error);
}
