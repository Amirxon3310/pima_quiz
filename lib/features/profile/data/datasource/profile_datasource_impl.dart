import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'package:pima_quiz/features/profile/data/datasource/profile_datasource.dart';
import 'package:pima_quiz/features/profile/data/models/tests_done_model.dart';

class ProfileDatasourceImpl implements ProfileDatasource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  ProfileDatasourceImpl({required this.firestore, required this.firebaseAuth});

  @override
  Future<UserModel?> getUserById() async {
    final userId = firebaseAuth.currentUser?.uid;
    try {
      final doc = await firestore.collection('users').doc(userId).get();
      if (!doc.exists) throw Exception('User not found');
      return UserModel.fromMap(doc.data()!);
    } catch (e, stack) {
      print(stack);
      print(e);
      return null;
    }
  }

  @override
  Future<bool> editUserDateOfBirthday({
    required DateTime newDate,
  }) async {
    final userId = firebaseAuth.currentUser?.uid;
    try {
      await firestore
          .collection('users')
          .doc(userId)
          .update({'birthday': Timestamp.fromDate(newDate)});
      return true;
    } catch (e, stack) {
      print(stack);
      print(e);
      return false;
    }
  }

  @override
  Future<bool> editUserAllInfo({
    required String newFullName,
    required String phoneNumber,
    required String age,
  }) async {
    final userId = firebaseAuth.currentUser?.uid;
    try {
      await firestore.collection('users').doc(userId).update({
        'full_name': newFullName,
        'phone': phoneNumber,
        'age': int.parse(age)
      });
      return true;
    } catch (e, stack) {
      print(stack);
      print(e);
      return false;
    }
  }

  @override
  Future<List<TestsDoneModel>> getTestsByUserId() async {
    try {
      DocumentSnapshot doc = await firestore
          .collection('tests_done')
          .doc(firebaseAuth.currentUser?.uid)
          .get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        List<dynamic> testResults = data['tests'] ?? [];
        List<TestsDoneModel> tests = testResults
            .map((e) => TestsDoneModel.fromMap(e as Map<String, dynamic>))
            .toList();

        return tests;
      } else {
        return [];
      }
    } catch (e) {
      print("Xatolik yuz berdi: $e");
      return [];
    }
  }
}
