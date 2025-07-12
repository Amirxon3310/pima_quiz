import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_event.dart';
import 'news_state.dart';
import '../../../domain/usecases/get_news_usecase.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase useCase;

  NewsBloc(this.useCase) : super(NewsInitial()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        final news = await useCase();
        emit(NewsLoaded(news));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });
  }
}
