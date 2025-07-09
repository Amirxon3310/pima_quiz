class AuthState {
  int pageViewCurrentIndex;

  AuthState({required this.pageViewCurrentIndex});

  AuthState copyWith({int? pageViewCurrentIndex}) {
    return AuthState(
      pageViewCurrentIndex: pageViewCurrentIndex ?? this.pageViewCurrentIndex,
    );
  }
}
