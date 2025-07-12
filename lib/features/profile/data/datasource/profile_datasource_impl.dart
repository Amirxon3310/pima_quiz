import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/auth/data/models/user_model.dart';
import 'package:pima_quiz/features/profile/data/datasource/profile_datasource.dart';

class ProfileDatasourceImpl implements ProfileDatasource {
  final FirebaseFirestore firestore;

  ProfileDatasourceImpl({required this.firestore});

  @override
  Future<UserModel> getUserById(String userId) async {
    final doc = await firestore.collection('users').doc(userId).get();
    if (!doc.exists) throw Exception('User not found');
    return UserModel.fromMap(doc.data()!);
  }
}
