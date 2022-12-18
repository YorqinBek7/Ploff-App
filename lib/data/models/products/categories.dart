import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ploff/data/models/products/description.dart';
import 'package:ploff/data/models/products/title.dart';

part 'categories.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Categories {
  @JsonKey(defaultValue: "", name: "id")
  @HiveField(0)
  final String id;

  @JsonKey(defaultValue: "", name: "slug")
  @HiveField(1)
  final String slug;

  @JsonKey(defaultValue: "", name: "parent_id")
  @HiveField(2)
  final String parent_id;

  @JsonKey(defaultValue: "", name: "image")
  @HiveField(3)
  final String image;

  @JsonKey(name: "description")
  @HiveField(4)
  final Description description;

  @JsonKey(name: "title")
  @HiveField(5)
  final Title1 title;

  @JsonKey(defaultValue: "", name: "order_no")
  @HiveField(6)
  final String order_no;

  @JsonKey(defaultValue: false, name: "active")
  @HiveField(7)
  final bool active;

  Categories({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.image,
    required this.parent_id,
    required this.active,
    required this.order_no,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return _$CategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
