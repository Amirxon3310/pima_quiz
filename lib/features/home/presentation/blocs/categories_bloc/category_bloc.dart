import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pima_quiz/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_event.dart';
import 'package:pima_quiz/features/home/presentation/blocs/categories_bloc/category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUsecase useCase;
  CategoryBloc(this.useCase) : super(CategoryInitial()) {
    on<LoadCategoryEvent>(
      (event, emit) async {
        emit(CategoryLoading());
        try {
          final categories = await useCase();
          emit(CategoryLoaded(categories));
        } catch (e) {
          emit(CategoryError(e.toString()));
        }
      },
    );
  }
}
