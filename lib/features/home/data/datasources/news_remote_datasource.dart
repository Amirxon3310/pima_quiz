import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pima_quiz/features/home/data/models/news_model.dart';

abstract class NewsRemoteDatasource {
  Future<List<NewsModel>> getNews();
}

class NewsRemoteDatasourceImpl implements NewsRemoteDatasource {
  final FirebaseFirestore firestore;

  NewsRemoteDatasourceImpl(this.firestore);

  @override
  Future<List<NewsModel>> getNews() async {
    final snap = await firestore.collection('news').get();
    return snap.docs.map((e) => NewsModel.fromDoc(e)).toList();
  }
}