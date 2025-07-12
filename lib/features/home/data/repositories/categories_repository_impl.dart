import 'package:pima_quiz/features/home/data/datasources/categories_remote_datasource.dart';
import 'package:pima_quiz/features/home/domain/entities/category_entity.dart';
import 'package:pima_quiz/features/home/domain/repositories/category_repository.dart';

class CategoriesRepositoryImpl implements CategoryRepository {
  final CategoriesRemoteDatasource remote;
  CategoriesRepositoryImpl(this.remote);

  @override
  Future<List<CategoryEntity>> getCategories() => remote.getCategories();
}
