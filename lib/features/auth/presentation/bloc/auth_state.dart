enum AuthStatus { initial, loading, success, failure }

class AuthState {
  int pageViewCurrentIndex;
  String? message;
  AuthStatus status;

  AuthState({
    required this.pageViewCurrentIndex,
    this.message,
    required this.status,
  });

  AuthState copyWith({
    int? pageViewCurrentIndex,
    String? message,
    AuthStatus? status,
  }) {
    return AuthState(
      pageViewCurrentIndex: pageViewCurrentIndex ?? this.pageViewCurrentIndex,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
