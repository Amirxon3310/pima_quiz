// lib/features/banners/domain/repository/banners_repository.dart
import '../entities/banner_entity.dart';

abstract class BannersRepository {
  Future<List<BannerEntity>> getBanners();
}
