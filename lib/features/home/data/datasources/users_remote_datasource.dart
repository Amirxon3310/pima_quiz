import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/data/models/users_model.dart';

abstract class UsersRemoteDatasource {
  Future<List<UsersModel>> getUsers();
  Future<List<UsersModel>> getSortedUsers();
}

class UsersRemoteDatasourceImpl implements UsersRemoteDatasource {
  final FirebaseFirestore firestore;

  UsersRemoteDatasourceImpl(this.firestore);

  @override
  Future<List<UsersModel>> getUsers() async {
    final snap = await firestore.collection("users").get();
    return snap.docs.map((e) => UsersModel.fromDoc(e)).toList();
  }

  @override
  Future<List<UsersModel>> getSortedUsers() async {
    final snapshot = await firestore
        .collection("users")
        .orderBy("point", descending: true)
        .get();
    List<UsersModel> users =
        snapshot.docs.map((e) => UsersModel.fromDoc(e)).toList();
    // return snapshot.docs.map((e) => UsersModel.fromDoc(e)).toList();

    users.sort((a, b) => int.parse(b.point).compareTo(int.parse(a.point)));
    return users;
  }
}
