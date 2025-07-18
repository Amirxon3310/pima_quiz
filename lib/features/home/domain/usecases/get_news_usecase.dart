import '../entities/news_entity.dart';
import '../repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;
  GetNewsUseCase(this.repository);

  Future<List<NewsEntity>> call() => repository.getNews();
}
