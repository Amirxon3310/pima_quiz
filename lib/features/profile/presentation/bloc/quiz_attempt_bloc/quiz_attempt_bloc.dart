import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pima_quiz/features/profile/domain/entities/quiz_attempt.dart';
import 'package:pima_quiz/features/profile/domain/repository/quiz_attempt_repository.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/quiz_attempt_bloc/quiz_attempt_event.dart';
import 'package:pima_quiz/features/profile/presentation/bloc/quiz_attempt_bloc/quiz_attempt_state.dart';

class QuizAttemptBloc extends Bloc<QuizAttemptEvent, QuizAttemptState> {
  final QuizAttemptRepository repo;

  QuizAttemptBloc(this.repo) : super(QuizAttemptInitial()) {
    on<LoadUserAttempts>((event, emit) async {
      emit(QuizAttemptLoading());
      await emit.forEach<List<QuizAttempt>>(
        repo.getUserAttempts(event.uid),
        onData: (attempts) => QuizAttemptLoaded(attempts),
        onError: (_, __) => QuizAttemptError("Xatolik yuz berdi"),
      );
    });

    on<StartAttemptEvent>((event, emit) async {
      await repo.startAttempt(event.uid, event.quizId, event.totalQuestions,
          event.quizTitle, event.quizPhoto);
    });

    on<FinishAttemptEvent>((event, emit) async {
      await repo.finishAttempt(event.uid, event.quizId, event.score);
    });
  }
}
