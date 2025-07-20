import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/data/models/category_model.dart';

abstract class CategoriesRemoteDatasource {
  Future<List<CategoryModel>> getCategories();
}

class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  final FirebaseFirestore firestore;

  CategoriesRemoteDatasourceImpl(this.firestore);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final snap = await firestore.collection("categories").get();
      return snap.docs.map((e) => CategoryModel.fromDoc(e)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
