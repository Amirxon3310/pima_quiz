import 'package:pima_quiz/features/home/domain/entities/category_entity.dart';
import 'package:pima_quiz/features/home/domain/repositories/category_repository.dart';

class GetCategoriesUsecase {
  final CategoryRepository repository;

  GetCategoriesUsecase(this.repository);

  Future<List<CategoryEntity>> call() => repository.getCategories();
}
