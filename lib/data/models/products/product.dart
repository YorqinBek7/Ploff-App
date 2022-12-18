import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ploff/data/models/products/brand.dart';
import 'package:ploff/data/models/products/categories.dart';
import 'package:ploff/data/models/products/description.dart';
import 'package:ploff/data/models/products/measurement.dart';
import 'package:ploff/data/models/products/rate.dart';
import 'package:ploff/data/models/products/title.dart';

part 'product.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Products {
  @JsonKey(defaultValue: false, name: "active")
  @HiveField(0)
  final bool active;

  @JsonKey(defaultValue: false, name: "is_divisible")
  @HiveField(1)
  final bool is_divisible;

  @JsonKey(defaultValue: false, name: "has_modifier")
  @HiveField(2)
  final bool has_modifier;

  @JsonKey(defaultValue: "", name: "order")
  @HiveField(3)
  final String order;

  @JsonKey(defaultValue: 0, name: "in_price")
  @HiveField(4)
  final int in_price;

  @JsonKey(defaultValue: 0, name: "out_price")
  @HiveField(5)
  final int out_price;

  @JsonKey(defaultValue: "", name: "currency")
  @HiveField(6)
  final String currency;

  @JsonKey(defaultValue: "", name: "count")
  @HiveField(7)
  final String count;

  @JsonKey(defaultValue: "", name: "id")
  @HiveField(8)
  final String id;

  @JsonKey(defaultValue: "", name: "slug")
  @HiveField(9)
  final String slug;

  @JsonKey(defaultValue: "", name: "image")
  @HiveField(10)
  final String image;

  @JsonKey(defaultValue: "", name: "code")
  @HiveField(11)
  final String code;

  @JsonKey(defaultValue: "", name: "iiko_id")
  @HiveField(12)
  final String iiko_id;

  @JsonKey(defaultValue: "", name: "jowi_id")
  @HiveField(13)
  final String jowi_id;

  @JsonKey(name: "description")
  @HiveField(14)
  final Description description;

  @JsonKey(name: "title")
  @HiveField(15)
  final Title title;

  @JsonKey(name: "brand")
  @HiveField(16)
  final Brand brand;

  @JsonKey(name: "measurement")
  @HiveField(17)
  final Measurement measurement;

  @JsonKey(name: "rate")
  @HiveField(18)
  final Rate rate;

  @JsonKey(defaultValue: false, name: "active_in_menu")
  @HiveField(19)
  final bool active_in_menu;

  @JsonKey(defaultValue: "", name: "from_time")
  @HiveField(20)
  final String from_time;

  @JsonKey(defaultValue: "", name: "to_time")
  @HiveField(21)
  final String to_time;

  @JsonKey(defaultValue: false, name: "off_always")
  @HiveField(22)
  final bool off_always;

  @JsonKey(defaultValue: [], name: "categories")
  @HiveField(23)
  final List<Categories> categories;

  @JsonKey(defaultValue: "", name: "type")
  @HiveField(24)
  final String type;
  Products({
    required this.active,
    required this.active_in_menu,
    required this.brand,
    required this.categories,
    required this.code,
    required this.count,
    required this.currency,
    required this.description,
    required this.from_time,
    required this.has_modifier,
    required this.id,
    required this.iiko_id,
    required this.image,
    required this.in_price,
    required this.is_divisible,
    required this.jowi_id,
    required this.measurement,
    required this.off_always,
    required this.order,
    required this.out_price,
    required this.rate,
    required this.slug,
    required this.title,
    required this.to_time,
    required this.type,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
