import 'package:pima_quiz/features/home/domain/entities/questions_entity.dart';

abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoading extends QuestionsState {}

class QuestionsLoaded extends QuestionsState {
  final List<QuestionsEntity> questions;
  QuestionsLoaded(this.questions);
}

class QuestionsError extends QuestionsState {
  final String message;
  QuestionsError(this.message);
}
