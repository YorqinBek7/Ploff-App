// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrandAdapter extends TypeAdapter<Brand> {
  @override
  final int typeId = 3;

  @override
  Brand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Brand(
      id: fields[0] as String,
      image: fields[3] as String,
      parent_id: fields[2] as String,
      slug: fields[1] as String,
      description: fields[4] as Description,
      title: fields[5] as Title,
      is_active: fields[7] as bool,
      order_no: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Brand obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.parent_id)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.order_no)
      ..writeByte(7)
      ..write(obj.is_active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      parent_id: json['parent_id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description:
          Description.fromJson(json['description'] as Map<String, dynamic>),
      title: Title.fromJson(json['title'] as Map<String, dynamic>),
      is_active: json['is_active'] as bool? ?? false,
      order_no: json['order_no'] as String? ?? '',
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'parent_id': instance.parent_id,
      'image': instance.image,
      'description': instance.description,
      'title': instance.title,
      'order_no': instance.order_no,
      'is_active': instance.is_active,
    };
