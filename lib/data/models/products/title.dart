import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'title.g.dart';

@JsonSerializable()
@HiveType(typeId: 6)
class Title1 {
  @JsonKey(defaultValue: "", name: "uz")
  @HiveField(0)
  final String uz;

  @JsonKey(defaultValue: "", name: "ru")
  @HiveField(1)
  final String ru;

  @JsonKey(defaultValue: "", name: "en")
  @HiveField(2)
  final String en;
  Title1({
    required this.en,
    required this.ru,
    required this.uz,
  });

  factory Title1.fromJson(Map<String, dynamic> json) {
    return _$TitleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TitleToJson(this);
}
