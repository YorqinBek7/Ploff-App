import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/models/category_with_products/description.dart';
import 'package:ploff/data/models/category_with_products/title.dart';

part 'categ_with_product.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class CategProducts {
  @JsonKey(defaultValue: "", name: "id")
  @HiveField(0)
  final String id;

  @JsonKey(defaultValue: "", name: "slug")
  @HiveField(1)
  final String slug;

  @JsonKey(defaultValue: "", name: "parent_id")
  @HiveField(2)
  final String parent_id;

  @JsonKey(name: "description")
  @HiveField(3)
  final Description description;

  @JsonKey(name: "title")
  @HiveField(4)
  final Title title1;

  @JsonKey(defaultValue: "", name: "order_no")
  @HiveField(5)
  final String order_no;

  @JsonKey(defaultValue: false, name: "active")
  @HiveField(6)
  final bool active;

  @JsonKey(name: "products")
  @HiveField(7)
  final List<CategWithProduct> products;

  CategProducts({
    required this.id,
    required this.slug,
    required this.parent_id,
    required this.description,
    required this.title1,
    required this.order_no,
    required this.active,
    required this.products,
  });

  factory CategProducts.fromJson(Map<String, dynamic> json) {
    return _$CategProductsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategProductsToJson(this);
}
