// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedProducts _$SearchedProductsFromJson(Map<String, dynamic> json) =>
    SearchedProducts(
      out_price: json['out_price'] as int? ?? 0,
      title: Title.fromJson(json['title'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchedProductsToJson(SearchedProducts instance) =>
    <String, dynamic>{
      'title': instance.title,
      'out_price': instance.out_price,
    };
