import 'package:pima_quiz/features/home/domain/entities/category_entity.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categoryList;
  CategoryLoaded(this.categoryList);
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}
