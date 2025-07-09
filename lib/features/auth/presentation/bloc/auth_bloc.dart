import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(pageViewCurrentIndex: 0)) {
    on<ChangePageViewCurrentIndex>((event, emit) {
      emit(state.copyWith(pageViewCurrentIndex: event.index));
    });
  }
}
