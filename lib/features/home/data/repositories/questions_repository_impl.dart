import 'package:pima_quiz/features/home/data/datasources/questions_remote_datasource.dart';
import 'package:pima_quiz/features/home/domain/entities/questions_entity.dart';
import 'package:pima_quiz/features/home/domain/repositories/questions_repository.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsRemoteDatasource remote;
  QuestionsRepositoryImpl(this.remote);

  @override
  Future<List<QuestionsEntity>> getQuestions() => remote.getQuestions();
}
