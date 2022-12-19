import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ploff/data/models/category_with_products/description.dart';
import 'package:ploff/data/models/category_with_products/title.dart';

part 'categ_products.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CategWithProduct {
  @JsonKey(defaultValue: "", name: "id")
  @HiveField(0)
  final String id;

  @JsonKey(defaultValue: 0, name: "out_price")
  @HiveField(1)
  final int out_price;

  @JsonKey(defaultValue: "", name: "currency")
  @HiveField(2)
  final String currency;

  @JsonKey(defaultValue: "", name: "string")
  @HiveField(3)
  final String string;

  @JsonKey(defaultValue: "", name: "type")
  @HiveField(4)
  final String type;

  @JsonKey(defaultValue: "", name: "order_no")
  @HiveField(5)
  final String order_no;

  @JsonKey(defaultValue: [], name: "categories")
  @HiveField(6)
  final List<String> categories;

  @JsonKey(defaultValue: "", name: "brand_id")
  @HiveField(7)
  final String brand_id;

  @JsonKey(defaultValue: "", name: "rate_id")
  @HiveField(8)
  final String rate_id;

  @JsonKey(defaultValue: "", name: "image")
  @HiveField(9)
  final String image;

  @JsonKey(defaultValue: false, name: "active_in_menu")
  @HiveField(10)
  final bool active_in_menu;

  @JsonKey(defaultValue: false, name: "has_modifier")
  @HiveField(11)
  final bool has_modifier;

  @JsonKey(defaultValue: "", name: "from_time")
  @HiveField(12)
  final String from_time;

  @JsonKey(defaultValue: "", name: "to_time")
  @HiveField(13)
  final String to_time;

  @JsonKey(defaultValue: false, name: "off_always")
  @HiveField(14)
  final bool off_always;

  @JsonKey(name: "title")
  @HiveField(15)
  final Title title;

  @JsonKey(name: "description")
  @HiveField(16)
  final Description description;

  @JsonKey(defaultValue: false, name: "active")
  @HiveField(17)
  final bool active;

  @JsonKey(defaultValue: "", name: "iiko_id")
  @HiveField(18)
  final String iiko_id;

  @JsonKey(defaultValue: "", name: "jowi_id")
  @HiveField(19)
  final String jowi_id;

  CategWithProduct({
    required this.id,
    required this.order_no,
    required this.active,
    required this.categories,
    required this.out_price,
    required this.currency,
    required this.string,
    required this.type,
    required this.brand_id,
    required this.rate_id,
    required this.image,
    required this.active_in_menu,
    required this.has_modifier,
    required this.from_time,
    required this.to_time,
    required this.off_always,
    required this.title,
    required this.description,
    required this.iiko_id,
    required this.jowi_id,
  });

  factory CategWithProduct.fromJson(Map<String, dynamic> json) {
    return _$CategWithProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategWithProductToJson(this);
}
