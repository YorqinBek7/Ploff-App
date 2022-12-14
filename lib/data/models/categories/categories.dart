import 'dart:convert';

import 'package:flutter/foundation.dart';

class Categorie {
  final String id;
  final String name;
  final String slug;
  final String parent_id;
  final String description;
  final List<dynamic> child_categories;
  final String image;
  final String order_no;
  final List<dynamic> products;
  final Title title;
  final Description_v2 description_v2;
  Categorie({
    required this.id,
    required this.name,
    required this.slug,
    required this.parent_id,
    required this.description,
    required this.child_categories,
    required this.image,
    required this.order_no,
    required this.products,
    required this.title,
    required this.description_v2,
  });

  Categorie copyWith({
    String? id,
    String? name,
    String? slug,
    String? parent_id,
    String? description,
    List<dynamic>? child_categories,
    String? image,
    String? order_no,
    List<dynamic>? products,
    Title? title,
    Description_v2? description_v2,
  }) {
    return Categorie(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      parent_id: parent_id ?? this.parent_id,
      description: description ?? this.description,
      child_categories: child_categories ?? this.child_categories,
      image: image ?? this.image,
      order_no: order_no ?? this.order_no,
      products: products ?? this.products,
      title: title ?? this.title,
      description_v2: description_v2 ?? this.description_v2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'parent_id': parent_id,
      'description': description,
      'child_categories': child_categories,
      'image': image,
      'order_no': order_no,
      'products': products,
      'title': title.toMap(),
      'description_v2': description_v2.toMap(),
    };
  }

  factory Categorie.fromMap(Map<String, dynamic> map) {
    return Categorie(
      id: map['id'] as String,
      name: map['name'] as String,
      slug: map['slug'] as String,
      parent_id: map['parent_id'] as String,
      description: map['description'] as String,
      child_categories: List<dynamic>.from(
        (map['child_categories'] as List<dynamic>),
      ),
      image: map['image'] as String,
      order_no: map['order_no'] as String,
      products: List<dynamic>.from((map['products'] as List<dynamic>)),
      title: Title.fromMap(map['title'] as Map<String, dynamic>),
      description_v2:
          Description_v2.fromMap(map['description_v2'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorie.fromJson(String source) =>
      Categorie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Categorie(id: $id, name: $name, slug: $slug, parent_id: $parent_id, description: $description, child_categories: $child_categories, image: $image, order_no: $order_no, products: $products, title: $title, description_v2: $description_v2)';
  }

  @override
  bool operator ==(covariant Categorie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.parent_id == parent_id &&
        other.description == description &&
        listEquals(other.child_categories, child_categories) &&
        other.image == image &&
        other.order_no == order_no &&
        listEquals(other.products, products) &&
        other.title == title &&
        other.description_v2 == description_v2;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        parent_id.hashCode ^
        description.hashCode ^
        child_categories.hashCode ^
        image.hashCode ^
        order_no.hashCode ^
        products.hashCode ^
        title.hashCode ^
        description_v2.hashCode;
  }
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
