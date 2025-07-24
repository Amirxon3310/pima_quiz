import 'package:pima_quiz/features/home/domain/entities/questions_entity.dart';

abstract class QuestionsRepository {
  Future<List<QuestionsEntity>> getQuestions();
}
