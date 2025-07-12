import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pima_quiz/features/profile/domain/repository/profile_repository.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_event.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;

  ProfileBloc({required this.repository}) : super(ProfileState()) {
    on<GetUserByIdEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true, error: null));
        try {
          final user = await repository.getUserById(event.userId);
          emit(state.copyWith(isLoading: false, user: user));
        } catch (e, stack) {
          emit(state.copyWith(isLoading: false, error: e.toString()));
          print(stack);
        }
      },
    );
  }
}
