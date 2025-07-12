import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'package:pima_quiz/features/profile/data/datasource/profile_datasource.dart';

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
}
