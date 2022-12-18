// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
      id: json['id'] as String? ?? '',
      title: Title1.fromJson(json['title'] as Map<String, dynamic>),
      about: json['about'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      created_at: json['created_at'] as String? ?? '',
      position: json['position'] as String? ?? '',
      shipper_id: json['shipper_id'] as String? ?? '',
      updated_at: json['updated_at'] as String? ?? '',
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
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'shipper_id': instance.shipper_id,
      'about': instance.about,
    };
