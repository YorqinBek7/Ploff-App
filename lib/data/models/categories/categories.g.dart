// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      title: Title.fromJson(json['title'] as Map<String, dynamic>),
      description:
          Description.fromJson(json['description'] as Map<String, dynamic>),
      image: json['image'] as String? ?? '',
      parent_id: json['parent_id'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      order_no: json['order_no'] as String? ?? '',
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'parent_id': instance.parent_id,
      'image': instance.image,
      'description': instance.description,
      'title': instance.title,
      'order_no': instance.order_no,
      'active': instance.active,
    };
