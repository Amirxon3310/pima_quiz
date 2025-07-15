import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/data/models/users_model.dart';

abstract class UsersRemoteDatasource {
  Future<List<UsersModel>> getUsers();
}

class UsersRemoteDatasourceImpl implements UsersRemoteDatasource {
  final FirebaseFirestore firestore;

  UsersRemoteDatasourceImpl(this.firestore);

  @override
  Future<List<UsersModel>> getUsers() async {
    final snap = await firestore.collection("users").get();
    return snap.docs.map((e) => UsersModel.fromDoc(e)).toList();
  }
}
