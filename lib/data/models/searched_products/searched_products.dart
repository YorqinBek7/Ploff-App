import 'package:json_annotation/json_annotation.dart';
import 'package:ploff/data/models/category_with_products/title.dart';

part 'searched_products.g.dart';

@JsonSerializable()
class SearchedProducts {
  @JsonKey(name: "title")
  final TitleModel title;

  @JsonKey(defaultValue: 0, name: "out_price")
  final int out_price;

  SearchedProducts({required this.out_price, required this.title});

  factory SearchedProducts.fromJson(Map<String, dynamic> json) {
    return _$SearchedProductsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchedProductsToJson(this);
}
