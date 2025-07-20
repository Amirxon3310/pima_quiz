import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/data/models/quiz_model.dart';
import 'package:pima_quiz/features/home/data/models/test_model.dart';

abstract class QuizRemoteDatasource {
  Future<QuizModel?> getQuizById(String id);
  Future<List<TestModel>> getTestsById(String id);
  Future<bool> checkAnswer(
      {required String questionId, required String answerId});
}

class QuizRemoteDatasourceImpl extends QuizRemoteDatasource {
  final FirebaseFirestore firestore;

  QuizRemoteDatasourceImpl(this.firestore);

  @override
  Future<QuizModel?> getQuizById(String id) async {
    try {
      final result = await firestore.collection('questions').doc(id).get();
      return QuizModel.fromMap(result);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<TestModel>> getTestsById(String id) async {
    try {
      final snapshot = await firestore
          .collection('questions_body')
          .doc(id)
          .collection('questions')
          .get();

      List<TestModel> questions = snapshot.docs.map((doc) {
        final data = doc.data();
        return TestModel.fromMap(data);
      }).toList();

      return questions;
    } catch (e) {
      print('Error fetching questions: $e');
      return [];
    }
  }

  @override
  Future<bool> checkAnswer({
    required String questionId,
    required String answerId,
  }) async {
    try {
      final result =
          await firestore.collection('answers').doc(questionId).get();
      if (result['answer_id'] == answerId) {
        print('true');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
