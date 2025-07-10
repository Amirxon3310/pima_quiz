import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pima_quiz/features/auth/domain/repository/auth_repository.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc({required this.repository})
      : super(AuthState(
          pageViewCurrentIndex: 0,
          status: AuthStatus.initial,
        )) {
    on<ChangePageViewCurrentIndex>((event, emit) {
      emit(state.copyWith(pageViewCurrentIndex: event.index));
    });

    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        await repository.register(user: event.user, password: event.password);
        emit(state.copyWith(status: AuthStatus.success));
      } catch (e) {
        emit(state.copyWith(
          status: AuthStatus.failure,
          message: e.toString(),
        ));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        await repository.login(event.email, event.password);
        emit(state.copyWith(status: AuthStatus.success));
      } catch (e) {
        emit(state.copyWith(
          status: AuthStatus.failure,
          message: e.toString(),
        ));
      }
    });
  }
}
