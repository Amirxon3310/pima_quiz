import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'auth_datasource.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  AuthDataSourceImpl({required this.firestore, required this.firebaseAuth});

  @override
  Future<void> register({
    required UserModel user,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      final uid = userCredential.user!.uid;
      await firestore.collection('users').doc(uid).set(user.toMap(uid));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Bu email allaqachon ro‘yxatdan o‘tgan.');
        throw "Bu email allaqachon ro‘yxatdan o‘tgan.";
      } else if (e.code == 'invalid-email') {
        print('Email noto‘g‘ri formatda.');
        throw "Email noto‘g‘ri formatda.";
      } else if (e.code == 'weak-password') {
        print('Parol juda oddiy.');
        throw "Parol juda oddiy.";
      } else {
        print('Ro‘yxatdan o‘tishda xatolik: ${e.message}');
        throw {e.toString()};
      }
    } catch (e) {
      print('Xatolik yuz berdi: $e');
      throw "Xatolik";
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('Bunday foydalanuvchi topilmadi.');
      } else if (e.code == 'wrong-password') {
        throw ('Parol noto‘g‘ri.');
      } else if (e.code == 'invalid-email') {
        throw ('Email noto‘g‘ri formatda.');
      } else if (e.code == 'too-many-requests') {
        throw ('Juda ko‘p urinish. Keyinroq urinib ko‘ring.');
      } else {
        throw ('Kirishda xatolik: ${e.message}');
      }
    } catch (e) {
      throw ('Kutilmagan xatolik yuz berdi: $e');
    }
  }
}
