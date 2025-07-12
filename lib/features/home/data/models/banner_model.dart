// lib/features/banners/data/models/banner_model.dart
import '../../domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required super.id,
    required super.path,
    required super.url,
    required super.title,
  });

  factory BannerModel.fromMap(Map<String, dynamic> map, String docId) {
    return BannerModel(
        id: docId,
        path: map['path'] ?? '',
        url: map['url'] ?? '',
        title: map['title'] ?? '');
  }
}
