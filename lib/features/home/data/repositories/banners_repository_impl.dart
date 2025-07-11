// lib/features/banners/data/repository/banners_repository_impl.dart
import 'package:pima_quiz/features/home/data/datasources/banners_remote_datasource.dart';
import 'package:pima_quiz/features/home/domain/repositories/banners_repository.dart';

import '../../domain/entities/banner_entity.dart';

class BannersRepositoryImpl implements BannersRepository {
  final BannersRemoteDatasource remoteDatasource;

  BannersRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<BannerEntity>> getBanners() {
    return remoteDatasource.getBanners();
  }
}
