import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pima_quiz/features/home/data/models/quiz_model.dart';
import 'package:pima_quiz/features/home/data/models/test_model.dart';

abstract class QuizRemoteDatasource {
  Future<QuizModel?> getQuizById(String id);
  Future<List<TestModel>> getTestsById(String id);
  Future<bool> checkAnswer(
      {required String questionId, required String answerId});
  Future<void> addTestForUser({
    required String testId,
    required String image,
    required String name,
    required int quizCount,
  });
  Future<void> incrementPlayed();
}

class QuizRemoteDatasourceImpl extends QuizRemoteDatasource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  QuizRemoteDatasourceImpl(this.firestore, this.firebaseAuth);

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
        print(false);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<void> addTestForUser({
    required String testId,
    required String image,
    required String name,
    required int quizCount,
  }) async {
    final docRef = FirebaseFirestore.instance
        .collection('tests_done')
        .doc(firebaseAuth.currentUser?.uid);

    final newTestMap = {
      'id': testId,
      'image': image,
      'name': name,
      'quiz_count': quizCount
    };

    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      await docRef.update({
        'tests': FieldValue.arrayUnion([newTestMap])
      });
    } else {
      await docRef.set({
        'tests': [newTestMap]
      });
    }
  }

  @override
  Future<void> incrementPlayed() async {
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid);

    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data();
      final currentPlayed = data?['played'];
      final point = int.parse(data?['point'] ?? '0');

      if (currentPlayed is int) {
        await docRef.update(
            {'played': currentPlayed + 1, 'point': (point + 10).toString()});
      } else {
        await docRef.update({
          'played': 1,
          'point': "10",
        });
      }
    } else {
      print("User document mavjud emas: ${firebaseAuth.currentUser?.uid}");
    }
  }
}
