// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categ_products.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategWithProductAdapter extends TypeAdapter<CategWithProduct> {
  @override
  final int typeId = 0;

  @override
  CategWithProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategWithProduct(
      id: fields[0] as String,
      order_no: fields[5] as String,
      active: fields[17] as bool,
      categories: (fields[6] as List).cast<String>(),
      out_price: fields[1] as int,
      currency: fields[2] as String,
      string: fields[3] as String,
      type: fields[4] as String,
      brand_id: fields[7] as String,
      rate_id: fields[8] as String,
      image: fields[9] as String,
      active_in_menu: fields[10] as bool,
      has_modifier: fields[11] as bool,
      from_time: fields[12] as String,
      to_time: fields[13] as String,
      off_always: fields[14] as bool,
      title: fields[15] as Title,
      description: fields[16] as Description,
      iiko_id: fields[18] as String,
      jowi_id: fields[19] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategWithProduct obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.out_price)
      ..writeByte(2)
      ..write(obj.currency)
      ..writeByte(3)
      ..write(obj.string)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.order_no)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.brand_id)
      ..writeByte(8)
      ..write(obj.rate_id)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.active_in_menu)
      ..writeByte(11)
      ..write(obj.has_modifier)
      ..writeByte(12)
      ..write(obj.from_time)
      ..writeByte(13)
      ..write(obj.to_time)
      ..writeByte(14)
      ..write(obj.off_always)
      ..writeByte(15)
      ..write(obj.title)
      ..writeByte(16)
      ..write(obj.description)
      ..writeByte(17)
      ..write(obj.active)
      ..writeByte(18)
      ..write(obj.iiko_id)
      ..writeByte(19)
      ..write(obj.jowi_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategWithProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategWithProduct _$CategWithProductFromJson(Map<String, dynamic> json) =>
    CategWithProduct(
      id: json['id'] as String? ?? '',
      order_no: json['order_no'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      out_price: json['out_price'] as int? ?? 0,
      currency: json['currency'] as String? ?? '',
      string: json['string'] as String? ?? '',
      type: json['type'] as String? ?? '',
      brand_id: json['brand_id'] as String? ?? '',
      rate_id: json['rate_id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      active_in_menu: json['active_in_menu'] as bool? ?? false,
      has_modifier: json['has_modifier'] as bool? ?? false,
      from_time: json['from_time'] as String? ?? '',
      to_time: json['to_time'] as String? ?? '',
      off_always: json['off_always'] as bool? ?? false,
      title: Title.fromJson(json['title'] as Map<String, dynamic>),
      description:
          Description.fromJson(json['description'] as Map<String, dynamic>),
      iiko_id: json['iiko_id'] as String? ?? '',
      jowi_id: json['jowi_id'] as String? ?? '',
    );

Map<String, dynamic> _$CategWithProductToJson(CategWithProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'out_price': instance.out_price,
      'currency': instance.currency,
      'string': instance.string,
      'type': instance.type,
      'order_no': instance.order_no,
      'categories': instance.categories,
      'brand_id': instance.brand_id,
      'rate_id': instance.rate_id,
      'image': instance.image,
      'active_in_menu': instance.active_in_menu,
      'has_modifier': instance.has_modifier,
      'from_time': instance.from_time,
      'to_time': instance.to_time,
      'off_always': instance.off_always,
      'title': instance.title,
      'description': instance.description,
      'active': instance.active,
      'iiko_id': instance.iiko_id,
      'jowi_id': instance.jowi_id,
    };
