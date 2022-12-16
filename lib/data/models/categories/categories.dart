import 'dart:convert';

class Categorie {
  final String id;
  final String slug;
  final String parent_id;
  final String image;
  final Description description;
  final Title title;
  final String order_no;
  final bool active;
  Categorie({
    required this.id,
    required this.slug,
    required this.parent_id,
    required this.image,
    required this.description,
    required this.title,
    required this.order_no,
    required this.active,
  });

  Categorie copyWith({
    String? id,
    String? slug,
    String? parent_id,
    String? image,
    Description? description,
    Title? title,
    String? order_no,
    bool? active,
  }) {
    return Categorie(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      parent_id: parent_id ?? this.parent_id,
      image: image ?? this.image,
      description: description ?? this.description,
      title: title ?? this.title,
      order_no: order_no ?? this.order_no,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'parent_id': parent_id,
      'image': image,
      'description': description.toMap(),
      'title': title.toMap(),
      'order_no': order_no,
      'active': active,
    };
  }

  factory Categorie.fromMap(Map<String, dynamic> map) {
    return Categorie(
      id: map['id'] as String,
      slug: map['slug'] as String,
      parent_id: map['parent_id'] as String,
      image: map['image'] as String,
      description:
          Description.fromMap(map['description'] as Map<String, dynamic>),
      title: Title.fromMap(map['title'] as Map<String, dynamic>),
      order_no: map['order_no'] as String,
      active: map['active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorie.fromJson(String source) =>
      Categorie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Categorie(id: $id, slug: $slug, parent_id: $parent_id, image: $image, description: $description, title: $title, order_no: $order_no, active: $active)';
  }

  @override
  bool operator ==(covariant Categorie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.slug == slug &&
        other.parent_id == parent_id &&
        other.image == image &&
        other.description == description &&
        other.title == title &&
        other.order_no == order_no &&
        other.active == active;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        slug.hashCode ^
        parent_id.hashCode ^
        image.hashCode ^
        description.hashCode ^
        title.hashCode ^
        order_no.hashCode ^
        active.hashCode;
  }
}

class Description {
  final String uz;
  final String ru;
  final String en;
  Description({
    required this.uz,
    required this.ru,
    required this.en,
  });

  Description copyWith({
    String? uz,
    String? ru,
    String? en,
  }) {
    return Description(
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

  factory Description.fromMap(Map<String, dynamic> map) {
    return Description(
      uz: map['uz'] as String,
      ru: map['ru'] as String,
      en: map['en'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Description.fromJson(String source) =>
      Description.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Description(uz: $uz, ru: $ru, en: $en)';

  @override
  bool operator ==(covariant Description other) {
    if (identical(this, other)) return true;

    return other.uz == uz && other.ru == ru && other.en == en;
  }

  @override
  int get hashCode => uz.hashCode ^ ru.hashCode ^ en.hashCode;
}

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
