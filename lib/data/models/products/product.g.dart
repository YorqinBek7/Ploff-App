// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsAdapter extends TypeAdapter<Products> {
  @override
  final int typeId = 0;

  @override
  Products read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Products(
      active: fields[0] as bool,
      active_in_menu: fields[19] as bool,
      brand: fields[16] as Brand,
      categories: (fields[23] as List).cast<Categories>(),
      code: fields[11] as String,
      count: fields[7] as String,
      currency: fields[6] as String,
      description: fields[14] as Description,
      from_time: fields[20] as String,
      has_modifier: fields[2] as bool,
      id: fields[8] as String,
      iiko_id: fields[12] as String,
      image: fields[10] as String,
      in_price: fields[4] as int,
      is_divisible: fields[1] as bool,
      jowi_id: fields[13] as String,
      measurement: fields[17] as Measurement,
      off_always: fields[22] as bool,
      order: fields[3] as String,
      out_price: fields[5] as int,
      rate: fields[18] as Rate,
      slug: fields[9] as String,
      title: fields[15] as Title1,
      to_time: fields[21] as String,
      type: fields[24] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Products obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.active)
      ..writeByte(1)
      ..write(obj.is_divisible)
      ..writeByte(2)
      ..write(obj.has_modifier)
      ..writeByte(3)
      ..write(obj.order)
      ..writeByte(4)
      ..write(obj.in_price)
      ..writeByte(5)
      ..write(obj.out_price)
      ..writeByte(6)
      ..write(obj.currency)
      ..writeByte(7)
      ..write(obj.count)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.slug)
      ..writeByte(10)
      ..write(obj.image)
      ..writeByte(11)
      ..write(obj.code)
      ..writeByte(12)
      ..write(obj.iiko_id)
      ..writeByte(13)
      ..write(obj.jowi_id)
      ..writeByte(14)
      ..write(obj.description)
      ..writeByte(15)
      ..write(obj.title)
      ..writeByte(16)
      ..write(obj.brand)
      ..writeByte(17)
      ..write(obj.measurement)
      ..writeByte(18)
      ..write(obj.rate)
      ..writeByte(19)
      ..write(obj.active_in_menu)
      ..writeByte(20)
      ..write(obj.from_time)
      ..writeByte(21)
      ..write(obj.to_time)
      ..writeByte(22)
      ..write(obj.off_always)
      ..writeByte(23)
      ..write(obj.categories)
      ..writeByte(24)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      active: json['active'] as bool? ?? false,
      active_in_menu: json['active_in_menu'] as bool? ?? false,
      brand: Brand.fromJson(json['brand'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      code: json['code'] as String? ?? '',
      count: json['count'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      description:
          Description.fromJson(json['description'] as Map<String, dynamic>),
      from_time: json['from_time'] as String? ?? '',
      has_modifier: json['has_modifier'] as bool? ?? false,
      id: json['id'] as String? ?? '',
      iiko_id: json['iiko_id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      in_price: json['in_price'] as int? ?? 0,
      is_divisible: json['is_divisible'] as bool? ?? false,
      jowi_id: json['jowi_id'] as String? ?? '',
      measurement:
          Measurement.fromJson(json['measurement'] as Map<String, dynamic>),
      off_always: json['off_always'] as bool? ?? false,
      order: json['order'] as String? ?? '',
      out_price: json['out_price'] as int? ?? 0,
      rate: Rate.fromJson(json['rate'] as Map<String, dynamic>),
      slug: json['slug'] as String? ?? '',
      title: Title1.fromJson(json['title'] as Map<String, dynamic>),
      to_time: json['to_time'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'active': instance.active,
      'is_divisible': instance.is_divisible,
      'has_modifier': instance.has_modifier,
      'order': instance.order,
      'in_price': instance.in_price,
      'out_price': instance.out_price,
      'currency': instance.currency,
      'count': instance.count,
      'id': instance.id,
      'slug': instance.slug,
      'image': instance.image,
      'code': instance.code,
      'iiko_id': instance.iiko_id,
      'jowi_id': instance.jowi_id,
      'description': instance.description,
      'title': instance.title,
      'brand': instance.brand,
      'measurement': instance.measurement,
      'rate': instance.rate,
      'active_in_menu': instance.active_in_menu,
      'from_time': instance.from_time,
      'to_time': instance.to_time,
      'off_always': instance.off_always,
      'categories': instance.categories,
      'type': instance.type,
    };
