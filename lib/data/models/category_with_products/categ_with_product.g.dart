// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categ_with_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategProductsAdapter extends TypeAdapter<CategProducts> {
  @override
  final int typeId = 1;

  @override
  CategProducts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategProducts(
      id: fields[0] as String,
      slug: fields[1] as String,
      parent_id: fields[2] as String,
      description: fields[3] as Description,
      title1: fields[4] as Title,
      order_no: fields[5] as String,
      active: fields[6] as bool,
      products: (fields[7] as List).cast<CategWithProduct>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategProducts obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.parent_id)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.title1)
      ..writeByte(5)
      ..write(obj.order_no)
      ..writeByte(6)
      ..write(obj.active)
      ..writeByte(7)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategProducts _$CategProductsFromJson(Map<String, dynamic> json) =>
    CategProducts(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      parent_id: json['parent_id'] as String? ?? '',
      description:
          Description.fromJson(json['description'] as Map<String, dynamic>),
      title1: Title.fromJson(json['title'] as Map<String, dynamic>),
      order_no: json['order_no'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      products: (json['products'] as List<dynamic>)
          .map((e) => CategWithProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategProductsToJson(CategProducts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'parent_id': instance.parent_id,
      'description': instance.description,
      'title': instance.title1,
      'order_no': instance.order_no,
      'active': instance.active,
      'products': instance.products,
    };
