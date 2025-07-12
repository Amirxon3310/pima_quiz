import 'package:pima_quiz/features/auth/data/models/user_model.dart';

class ProfileState {
  final bool isLoading;
  final UserModel? user;
  final String? error;

  const ProfileState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  ProfileState copyWith({
    bool? isLoading,
    UserModel? user,
    String? error,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}
