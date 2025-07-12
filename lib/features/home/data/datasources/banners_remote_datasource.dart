// lib/features/banners/data/datasource/banners_remote_datasource.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/banner_model.dart';

abstract class BannersRemoteDatasource {
  Future<List<BannerModel>> getBanners();
}

class BannersRemoteDatasourceImpl implements BannersRemoteDatasource {
  final FirebaseFirestore firestore;

  BannersRemoteDatasourceImpl(this.firestore);

  @override
  Future<List<BannerModel>> getBanners() async {
    final snapshot = await firestore.collection('banners').get();
    return snapshot.docs
        .map((doc) => BannerModel.fromMap(doc.data(), doc.id))
        .toList();
  }
}
