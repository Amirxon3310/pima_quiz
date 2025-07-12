import '../../domain/repositories/news_repository.dart';
import '../../domain/entities/news_entity.dart';
import '../datasources/news_remote_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDatasource remote;
  NewsRepositoryImpl(this.remote);

  @override
  Future<List<NewsEntity>> getNews() => remote.getNews();
}
