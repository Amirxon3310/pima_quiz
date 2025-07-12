enum AuthStatus { initial, loading, success, failure }

class AuthState {
  int pageViewCurrentIndex;
  String? message;
  AuthStatus status;
  String otp;
  int countdown;

  AuthState(
      {required this.pageViewCurrentIndex,
      this.message,
      required this.status,
      required this.otp,
      required this.countdown});

  AuthState copyWith({
    int? pageViewCurrentIndex,
    String? message,
    AuthStatus? status,
    String? otp,
    int? countdown,
  }) {
    return AuthState(
      pageViewCurrentIndex: pageViewCurrentIndex ?? this.pageViewCurrentIndex,
      message: message ?? this.message,
      status: status ?? this.status,
      otp: otp ?? this.otp,
      countdown: countdown ?? this.countdown,
    );
  }
}
