import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/data/models/questions_model.dart';

abstract class QuestionsRemoteDatasource {
  Future<List<QuestionsModel>> getQuestions();
}

class QuestionsRemoteDatasourceImpl implements QuestionsRemoteDatasource {
  final FirebaseFirestore firestore;
  QuestionsRemoteDatasourceImpl(this.firestore);

  @override
  Future<List<QuestionsModel>> getQuestions() async {
    try {
      final snapshot = await firestore.collection("questions").get();
      return snapshot.docs.map((e) => QuestionsModel.fromDoc(e)).toList();
    } catch (e) {
      throw Exception("Xatolik: $e");
    }
  }
}
