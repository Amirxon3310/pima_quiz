class BannerEntity {
  final String id;
  final String path;
  final String url;
  final String title;

  BannerEntity(
      {required this.id,
      required this.path,
      required this.url,
      required this.title});

  factory BannerEntity.fromJson(Map<String, dynamic> json) {
    return BannerEntity(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      path: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
    };
  }
}
