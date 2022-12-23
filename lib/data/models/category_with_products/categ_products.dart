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
  final int outPrice;

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
  final String orderNo;

  @JsonKey(defaultValue: [], name: "categories")
  @HiveField(6)
  final List<String> categories;

  @JsonKey(defaultValue: "", name: "brand_id")
  @HiveField(7)
  final String brandId;

  @JsonKey(defaultValue: "", name: "rate_id")
  @HiveField(8)
  final String rateId;

  @JsonKey(defaultValue: "", name: "image")
  @HiveField(9)
  final String image;

  @JsonKey(defaultValue: false, name: "active_in_menu")
  @HiveField(10)
  final bool activeInMenu;

  @JsonKey(defaultValue: false, name: "has_modifier")
  @HiveField(11)
  final bool hasModifier;

  @JsonKey(defaultValue: "", name: "from_time")
  @HiveField(12)
  final String fromTime;

  @JsonKey(defaultValue: "", name: "to_time")
  @HiveField(13)
  final String toTime;

  @JsonKey(defaultValue: false, name: "off_always")
  @HiveField(14)
  final bool offAlways;

  @JsonKey(name: "title")
  @HiveField(15)
  final TitleModel title;

  @JsonKey(name: "description")
  @HiveField(16)
  final Description description;

  @JsonKey(defaultValue: false, name: "active")
  @HiveField(17)
  final bool active;

  @JsonKey(defaultValue: "", name: "iiko_id")
  @HiveField(18)
  final String iikoId;

  @JsonKey(defaultValue: "", name: "jowi_id")
  @HiveField(19)
  final String jowiId;

  CategWithProduct({
    required this.id,
    required this.orderNo,
    required this.active,
    required this.categories,
    required this.outPrice,
    required this.currency,
    required this.string,
    required this.type,
    required this.brandId,
    required this.rateId,
    required this.image,
    required this.activeInMenu,
    required this.hasModifier,
    required this.fromTime,
    required this.toTime,
    required this.offAlways,
    required this.title,
    required this.description,
    required this.iikoId,
    required this.jowiId,
  });

  factory CategWithProduct.fromJson(Map<String, dynamic> json) {
    return _$CategWithProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategWithProductToJson(this);
}
