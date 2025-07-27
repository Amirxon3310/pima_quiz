import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pima_quiz/features/auth/data/repository/otp_repository.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_event.dart';
import 'package:pima_quiz/features/auth/presentation/bloc/otp_bloc/otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpRepository repository;

  OtpBloc(this.repository) : super(OtpInitial()) {
    on<SendOtpPressed>(
      (event, emit) async {
        emit(OtpSending());
        try {
          await repository.sendOtpToEmail(event.email);
          emit(OtpSent());
        } catch (e) {
          emit(OtpError(e.toString()));
        }
      },
    );

    on<VerifyOtpPressed>((event, emit) async {
      emit(OtpVerifying());
      try {
        final success =
            await repository.verifyOtpCode(event.email, event.otpCode);
        if (success) {
          emit(OtpVerified());
        } else {
          emit(OtpError("Invalid code"));
        }
      } catch (e) {
        emit(OtpError(e.toString()));
      }
    });
  }
}
