// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
      id: json['id'] as String? ?? '',
      title: TitleModel.fromJson(json['title'] as Map<String, dynamic>),
      about: json['about'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? '',
      position: json['position'] as String? ?? '',
      shipperId: json['shipper_id'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      url: json['url'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'position': instance.position,
      'url': instance.url,
      'image': instance.image,
      'active': instance.active,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'shipper_id': instance.shipperId,
      'about': instance.about,
    };
