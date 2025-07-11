// lib/features/banners/domain/usecases/get_banners_usecase.dart
import 'package:pima_quiz/features/home/domain/repositories/banners_repository.dart';

import '../entities/banner_entity.dart';

class GetBannersUseCase {
  final BannersRepository repository;

  GetBannersUseCase(this.repository);

  Future<List<BannerEntity>> call() async {
    return await repository.getBanners();
  }
}
