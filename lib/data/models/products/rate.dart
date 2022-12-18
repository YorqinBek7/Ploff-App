import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rate.g.dart';

@JsonSerializable()
@HiveType(typeId: 6)
class Rate {
  @JsonKey(defaultValue: "", name: "id")
  @HiveField(0)
  final String id;

  @JsonKey(defaultValue: "", name: "slug")
  @HiveField(1)
  final String slug;

  @JsonKey(defaultValue: "", name: "code")
  @HiveField(2)
  final String code;

  @JsonKey(defaultValue: "", name: "rate_amount")
  @HiveField(3)
  final String rate_amount;

  @JsonKey(defaultValue: "", name: "title")
  @HiveField(4)
  final String title;
  Rate({
    required this.id,
    required this.slug,
    required this.title,
    required this.code,
    required this.rate_amount,
  });

  factory Rate.fromJson(Map<String, dynamic> json) {
    return _$RateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RateToJson(this);
}
