import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'package:pima_quiz/features/profile/data/models/tests_done_model.dart';

class ProfileState {
  final bool isLoading;
  final UserModel? user;
  final String? error;
  final List<TestsDoneModel>? tests;

  const ProfileState({
    this.isLoading = false,
    this.user,
    this.error,
    this.tests,
  });

  ProfileState copyWith({
    bool? isLoading,
    UserModel? user,
    String? error,
    List<TestsDoneModel>? tests,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
      tests: tests ?? this.tests,
    );
  }
}
