import '../../../domain/entities/news_entity.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsEntity> newsList;
  NewsLoaded(this.newsList);
}

class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}
