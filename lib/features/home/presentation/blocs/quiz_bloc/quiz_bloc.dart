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
          checkBox: null,
          index: 0,
          count: 0,
          theEnd: null,
          correctAnswer: 0,
          isLoading: false,
          selectedAnswer: "",
          nextQuestion: false,
          count2: 0,
        )) {
    on<GetQuizById>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await data.getQuizById(event.id);
      emit(state.copyWith(quiz: result, isLoading: false));
    });

    on<GetTestsById>(
      (event, emit) async {
        final result = await data.getTestsById(event.id);
        emit(state.copyWith(tests: result));
      },
    );

    on<CheckAnswer>((event, emit) async {
      final result = await data.checkAnswer(
        answerId: event.answerId,
        questionId: event.questionid,
      );

      if (result == true) {
        emit(state.copyWith(correctAnswer: state.correctAnswer + 1));
      }

      emit(state.copyWith(
          checkBox: result,
          count: state.count + 1,
          nextQuestion: true,
          isAnswered: true));
    });

    on<NextQuestion>((event, emit) {
      final newIndex = state.index + 1;
      if (newIndex < state.tests.length) {
        emit(state.copyWith(
            index: newIndex,
            selectedAnswer: "",
            nextQuestion: false,
            count2: state.count,
            isAnswered: false));
      } else {
        emit(state.copyWith(theEnd: true, nextQuestion: false));
      }
    });

    on<SelectedAnswerEvent>((event, emit) {
      if (!state.isAnswered) {
        emit(state.copyWith(selectedAnswer: event.answerId));
      }
    });

    on<AddTestUserHistory>((event, emit) {
      data.addTestForUser(
        testId: event.testId,
        image: event.image,
        name: event.name,
        quizCount: event.quizCount,
      );
      data.incrementPlayed();
    });

    on<RestartAllEvent>((event, emit) {
      emit(
        QuizState(
          tests: [],
          quiz: QuizModel(),
          index: 0,
          count: 0,
          isLoading: false,
          correctAnswer: 0,
          selectedAnswer: "",
          nextQuestion: false,
          count2: 0,
        ),
      );
    });
  }
}
