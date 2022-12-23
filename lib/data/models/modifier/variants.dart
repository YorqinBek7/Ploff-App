import 'package:json_annotation/json_annotation.dart';
import 'package:ploff/data/models/category_with_products/title.dart';

part 'variants.g.dart';

@JsonSerializable()
class VariantsModel {
  @JsonKey(defaultValue: 0, name: "out_price")
  final int outPrice;

  @JsonKey(name: "title")
  final TitleModel title;

  VariantsModel({required this.outPrice, required this.title});

  factory VariantsModel.fromJson(Map<String, dynamic> json) {
    return _$VariantsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VariantsModelToJson(this);
}
