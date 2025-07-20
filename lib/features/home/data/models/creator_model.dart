class Creator {
  final String? id;
  final String? name;
  final String? photo;
  final String? userid;
  final String? favorited;

  Creator({
    this.id,
    this.name,
    this.photo,
    this.userid,
    this.favorited,
  });

  factory Creator.fromMap(Map<String, dynamic> map) {
    return Creator(
      id: map['id'] as String?,
      name: map['name'] as String?,
      photo: map['photo'] as String?,
      userid: map['userid'] as String?,
      favorited: map['favorited'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
      'userid': userid,
      'favorited': favorited,
    };
  }

  Creator copyWith({
    String? id,
    String? name,
    String? photo,
    String? userid,
    String? favorited,
  }) {
    return Creator(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      userid: userid ?? this.userid,
      favorited: favorited ?? this.favorited,
    );
  }
}
