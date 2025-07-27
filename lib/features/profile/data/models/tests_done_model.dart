class TestsDoneModel {
  final String? id;
  final String? image;
  final String? name;
  final String? playersCount;
  final int? quizCount;

  TestsDoneModel(
    this.id,
    this.image,
    this.name,
    this.playersCount,
    this.quizCount,
  );

  factory TestsDoneModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return TestsDoneModel(
      map['id'],
      map['image'] as String?,
      map['name'] as String?,
      map['players_count'] as String?,
      map['quiz_count'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'playersCount': playersCount,
      'quizCount': quizCount,
    };
  }
}
