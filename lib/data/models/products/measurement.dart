import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ploff/data/models/products/title.dart';

part 'measurement.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class Measurement {
  @JsonKey(defaultValue: "", name: "id")
  @HiveField(0)
  final String id;

  @JsonKey(defaultValue: "", name: "slug")
  @HiveField(1)
  final String slug;

  @JsonKey(name: "title")
  @HiveField(2)
  final Title1 title;

  @JsonKey(defaultValue: "", name: "short_name")
  @HiveField(3)
  final String short_name;

  @JsonKey(defaultValue: 0, name: "accuracy")
  @HiveField(4)
  final int accuracy;

  Measurement({
    required this.id,
    required this.slug,
    required this.title,
    required this.accuracy,
    required this.short_name,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) {
    return _$MeasurementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MeasurementToJson(this);
}
