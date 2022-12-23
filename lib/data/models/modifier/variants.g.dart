// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariantsModel _$VariantsModelFromJson(Map<String, dynamic> json) =>
    VariantsModel(
      outPrice: json['out_price'] as int? ?? 0,
      title: TitleModel.fromJson(json['title'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VariantsModelToJson(VariantsModel instance) =>
    <String, dynamic>{
      'out_price': instance.outPrice,
      'title': instance.title,
    };
