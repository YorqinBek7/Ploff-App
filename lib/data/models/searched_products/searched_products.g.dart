// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedProducts _$SearchedProductsFromJson(Map<String, dynamic> json) =>
    SearchedProducts(
      outPrice: json['out_price'] as int? ?? 0,
      title: TitleModel.fromJson(json['title'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchedProductsToJson(SearchedProducts instance) =>
    <String, dynamic>{
      'title': instance.title,
      'out_price': instance.outPrice,
    };
