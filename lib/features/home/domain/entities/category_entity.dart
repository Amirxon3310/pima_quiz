class CategoryEntity {
  final String id;
  final String title;
  final String url;
  final List quizs;

  const CategoryEntity({
    required this.id,
    required this.title,
    required this.url,
    required this.quizs,
  });
}
