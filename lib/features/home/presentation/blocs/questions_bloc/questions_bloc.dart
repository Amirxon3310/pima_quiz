import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pima_quiz/features/home/domain/repositories/questions_repository.dart';
import 'package:pima_quiz/features/home/presentation/blocs/questions_bloc/questions_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/questions_bloc/questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepository repository;

  QuestionsBloc(this.repository) : super(QuestionsInitial()) {
    on<LoadQuestionsByCategoryEvent>(_onLoadByCategory);
  }

  Future<void> _onLoadByCategory(
      LoadQuestionsByCategoryEvent event, Emitter<QuestionsState> emit) async {
    emit(QuestionsLoading());
    try {
      final allQuestions = await repository.getQuestions();
      final filteredQuestions =
          allQuestions.where((q) => q.categoryId == event.categoryId).toList();

      emit(QuestionsLoaded(filteredQuestions));
    } catch (e) {
      emit(QuestionsError(e.toString()));
    }
  }
}
