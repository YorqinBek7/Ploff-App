// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoriesAdapter extends TypeAdapter<Categories> {
  @override
  final int typeId = 3;

  @override
  Categories read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categories(
      id: fields[0] as String,
      slug: fields[1] as String,
      title: fields[5] as Title1,
      description: fields[4] as Description,
      image: fields[3] as String,
      parent_id: fields[2] as String,
      active: fields[7] as bool,
      order_no: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Categories obj) {
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
      ..write(obj.active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      title: Title1.fromJson(json['title'] as Map<String, dynamic>),
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
