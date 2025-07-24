class Option {
  final String id;
  final String text;

  Option({
    required this.id,
    required this.text,
  });

  factory Option.fromMap(Map<String, dynamic>? map) {
    return Option(
      id: map?['id'] ?? '',
      text: map?['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }
}

class TestModel {
  final String id;
  final String? image;
  final String question;
  final List<Option> options;

  TestModel({
    required this.id,
    this.image,
    required this.question,
    required this.options,
  });

  factory TestModel.fromMap(Map<String, dynamic>? map) {
    return TestModel(
      id: map?['id'] ?? '',
      image: map?['image'],
      question: map?['question'] ?? '',
      options: (map?['options'] as List<dynamic>? ?? [])
          .map((opt) => Option.fromMap(opt as Map<String, dynamic>?))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'question': question,
      'options': options.map((opt) => opt.toMap()).toList(),
    };
  }
}
