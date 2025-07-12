class NewsEntity {
  final String id;
  final String title;
  final String body;
  final String url;
  final String authorName;

  const NewsEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.url,
    required this.authorName,
  });
}