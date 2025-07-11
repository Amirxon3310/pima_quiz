import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'auth_datasource.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  AuthDataSourceImpl({required this.firebaseAuth, required this.firestore});

  @override
  Future<void> register({
    required UserModel user,
    required String password,
  }) async {
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: password,
    );

    final uid = userCredential.user!.uid;

    await firestore.collection('users').doc(uid).set(user.toMap());
  }

  @override
  Future<void> login(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
