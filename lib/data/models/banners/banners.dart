import 'package:json_annotation/json_annotation.dart';

import 'package:ploff/data/models/category_with_products/title.dart';

part 'banners.g.dart';

@JsonSerializable()
class Banners {
  @JsonKey(defaultValue: "", name: "id")
  final String id;

  @JsonKey(name: "title")
  final TitleModel title;

  @JsonKey(defaultValue: "", name: "position")
  final String position;

  @JsonKey(defaultValue: "", name: "url")
  final String url;

  @JsonKey(defaultValue: "", name: "image")
  final String image;

  @JsonKey(defaultValue: false, name: "active")
  final bool active;

  @JsonKey(defaultValue: "", name: "created_at")
  final String createdAt;

  @JsonKey(defaultValue: "", name: "updated_at")
  final String updatedAt;

  @JsonKey(defaultValue: "", name: "shipper_id")
  final String shipperId;

  @JsonKey(defaultValue: "", name: "about")
  final String about;

  Banners({
    required this.id,
    required this.title,
    required this.about,
    required this.active,
    required this.createdAt,
    required this.position,
    required this.shipperId,
    required this.updatedAt,
    required this.url,
    required this.image,
  });

  factory Banners.fromJson(Map<String, dynamic> json) {
    return _$BannersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BannersToJson(this);
}
