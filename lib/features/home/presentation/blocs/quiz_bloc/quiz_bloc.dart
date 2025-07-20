import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pima_quiz/features/home/data/datasources/quiz_remote_datasource.dart';
import 'package:pima_quiz/features/home/data/models/quiz_model.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/quiz_bloc/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizRemoteDatasourceImpl data;
  QuizBloc(this.data)
      : super(QuizState(
          quiz: QuizModel(),
          tests: [],
          checkBox: false,
        )) {
    on<GetQuizById>((event, emit) async {
      final result = await data.getQuizById(event.id);
      emit(state.copyWith(quiz: result));
    });

    on<GetTestsById>(
      (event, emit) async {
        final result = await data.getTestsById(event.id);
        emit(state.copyWith(tests: result));
      },
    );

    on<CheckAnswer>((event, emit) async {
      final result = await data.checkAnswer(
          answerId: event.answerId, questionId: event.questionid);
      emit(state.copyWith(checkBox: result));
    });
  }
}
