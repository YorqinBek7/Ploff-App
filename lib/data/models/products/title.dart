import 'dart:convert';

class Title {
  final String uz;
  final String ru;
  final String en;
  Title({
    required this.uz,
    required this.ru,
    required this.en,
  });

  Title copyWith({
    String? uz,
    String? ru,
    String? en,
  }) {
    return Title(
      uz: uz ?? this.uz,
      ru: ru ?? this.ru,
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uz': uz,
      'ru': ru,
      'en': en,
    };
  }

  factory Title.fromMap(Map<String, dynamic> map) {
    return Title(
      uz: map['uz'] as String,
      ru: map['ru'] as String,
      en: map['en'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Title.fromJson(String source) =>
      Title.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Title(uz: $uz, ru: $ru, en: $en)';

  @override
  bool operator ==(covariant Title other) {
    if (identical(this, other)) return true;

    return other.uz == uz && other.ru == ru && other.en == en;
  }

  @override
  int get hashCode => uz.hashCode ^ ru.hashCode ^ en.hashCode;
}
