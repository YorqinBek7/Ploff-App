import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'description.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Description {
  @JsonKey(defaultValue: "", name: "uz")
  @HiveField(0)
  final String uz;

  @JsonKey(defaultValue: "", name: "ru")
  @HiveField(1)
  final String ru;

  @JsonKey(defaultValue: "", name: "en")
  @HiveField(2)
  final String en;

  Description({
    required this.en,
    required this.ru,
    required this.uz,
  });

  factory Description.fromJson(Map<String, dynamic> json) {
    return _$DescriptionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}
