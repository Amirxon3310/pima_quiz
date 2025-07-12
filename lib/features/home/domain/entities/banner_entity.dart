// lib/features/banners/domain/entities/banner_entity.dart
class BannerEntity {
  final String id;
  final String path;
  final String url;
  final String title;

  BannerEntity({
    required this.id,
    required this.path,
    required this.url,
    required this.title
  });
}
