import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pima_quiz/features/auth/domain/repository/auth_repository.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Timer? timer;
  final AuthRepository repository;
  AuthBloc({required this.repository})
      : super(AuthState(
          pageViewCurrentIndex: 0,
          status: AuthStatus.initial,
          otp: "",
          countdown: 60,
        )) {
    on<ChangePageViewCurrentIndex>((event, emit) {
      emit(state.copyWith(pageViewCurrentIndex: event.index));
    });

    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        await repository.register(user: event.user, password: event.password);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
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
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        emit(state.copyWith(status: AuthStatus.success));
      } catch (e) {
        emit(state.copyWith(
          status: AuthStatus.failure,
          message: e.toString(),
        ));
      }
    });

    on<ChangeOtp>((event, emit) {
      emit(state.copyWith(otp: event.value));
    });

    on<StartCountdown>((event, emit) async {
      timer?.cancel();

      await emit.forEach<int>(
        Stream.periodic(const Duration(seconds: 1), (x) => 59 - x).take(60),
        onData: (count) => state.copyWith(countdown: count),
      );
    });
  }
  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
