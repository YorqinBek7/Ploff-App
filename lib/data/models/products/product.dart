import 'dart:convert';
import 'package:ploff/data/models/products/description.dart';
import 'package:ploff/data/models/products/title.dart';

class Product {
  final String id;
  final String name;
  final String slug;
  final String category_id;
  final String description;
  final String price;
  final String order_no;
  final String image;
  final Title title;
  final Description_v2 description_v2;
  final bool has_modifier;
  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.category_id,
    required this.description,
    required this.price,
    required this.order_no,
    required this.image,
    required this.title,
    required this.description_v2,
    required this.has_modifier,
  });

  Product copyWith({
    String? id,
    String? name,
    String? slug,
    String? category_id,
    String? description,
    String? price,
    String? order_no,
    String? image,
    Title? title,
    Description_v2? description_v2,
    bool? has_modifier,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      category_id: category_id ?? this.category_id,
      description: description ?? this.description,
      price: price ?? this.price,
      order_no: order_no ?? this.order_no,
      image: image ?? this.image,
      title: title ?? this.title,
      description_v2: description_v2 ?? this.description_v2,
      has_modifier: has_modifier ?? this.has_modifier,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'category_id': category_id,
      'description': description,
      'price': price,
      'order_no': order_no,
      'image': image,
      'title': title.toMap(),
      'description_v2': description_v2.toMap(),
      'has_modifier': has_modifier,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      slug: map['slug'] as String,
      category_id: map['category_id'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      order_no: map['order_no'] as String,
      image: map['image'] as String,
      title: Title.fromMap(map['title'] as Map<String, dynamic>),
      description_v2:
          Description_v2.fromMap(map['description_v2'] as Map<String, dynamic>),
      has_modifier: map['has_modifier'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Product(id: $id, name: $name, slug: $slug, category_id: $category_id, description: $description, price: $price, order_no: $order_no, image: $image, title: $title, description_v2: $description_v2, has_modifier: $has_modifier)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.category_id == category_id &&
        other.description == description &&
        other.price == price &&
        other.order_no == order_no &&
        other.image == image &&
        other.title == title &&
        other.description_v2 == description_v2 &&
        other.has_modifier == has_modifier;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        category_id.hashCode ^
        description.hashCode ^
        price.hashCode ^
        order_no.hashCode ^
        image.hashCode ^
        title.hashCode ^
        description_v2.hashCode ^
        has_modifier.hashCode;
  }
}
