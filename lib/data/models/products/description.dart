import 'dart:convert';

class Description_v2 {
  final String uz;
  final String ru;
  final String en;
  Description_v2({
    required this.uz,
    required this.ru,
    required this.en,
  });

  Description_v2 copyWith({
    String? uz,
    String? ru,
    String? en,
  }) {
    return Description_v2(
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

  factory Description_v2.fromMap(Map<String, dynamic> map) {
    return Description_v2(
      uz: map['uz'] as String,
      ru: map['ru'] as String,
      en: map['en'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Description_v2.fromJson(String source) =>
      Description_v2.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Description_v2(uz: $uz, ru: $ru, en: $en)';

  @override
  bool operator ==(covariant Description_v2 other) {
    if (identical(this, other)) return true;

    return other.uz == uz && other.ru == ru && other.en == en;
  }

  @override
  int get hashCode => uz.hashCode ^ ru.hashCode ^ en.hashCode;
}
