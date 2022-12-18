import 'package:json_annotation/json_annotation.dart';
import 'package:ploff/data/models/products/description.dart';
import 'package:ploff/data/models/products/title.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories {
  @JsonKey(defaultValue: "", name: "id")
  final String id;

  @JsonKey(defaultValue: "", name: "slug")
  final String slug;

  @JsonKey(defaultValue: "", name: "parent_id")
  final String parent_id;

  @JsonKey(defaultValue: "", name: "image")
  final String image;

  @JsonKey(name: "description")
  final Description description;

  @JsonKey(name: "title")
  final Title1 title;

  @JsonKey(defaultValue: "", name: "order_no")
  final String order_no;

  @JsonKey(defaultValue: false, name: "active")
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
