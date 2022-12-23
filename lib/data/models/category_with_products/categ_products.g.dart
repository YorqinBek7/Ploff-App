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
      orderNo: fields[5] as String,
      active: fields[17] as bool,
      categories: (fields[6] as List).cast<String>(),
      outPrice: fields[1] as int,
      currency: fields[2] as String,
      string: fields[3] as String,
      type: fields[4] as String,
      brandId: fields[7] as String,
      rateId: fields[8] as String,
      image: fields[9] as String,
      activeInMenu: fields[10] as bool,
      hasModifier: fields[11] as bool,
      fromTime: fields[12] as String,
      toTime: fields[13] as String,
      offAlways: fields[14] as bool,
      title: fields[15] as TitleModel,
      description: fields[16] as Description,
      iikoId: fields[18] as String,
      jowiId: fields[19] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategWithProduct obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.outPrice)
      ..writeByte(2)
      ..write(obj.currency)
      ..writeByte(3)
      ..write(obj.string)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.orderNo)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.brandId)
      ..writeByte(8)
      ..write(obj.rateId)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.activeInMenu)
      ..writeByte(11)
      ..write(obj.hasModifier)
      ..writeByte(12)
      ..write(obj.fromTime)
      ..writeByte(13)
      ..write(obj.toTime)
      ..writeByte(14)
      ..write(obj.offAlways)
      ..writeByte(15)
      ..write(obj.title)
      ..writeByte(16)
      ..write(obj.description)
      ..writeByte(17)
      ..write(obj.active)
      ..writeByte(18)
      ..write(obj.iikoId)
      ..writeByte(19)
      ..write(obj.jowiId);
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
      orderNo: json['order_no'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      outPrice: json['out_price'] as int? ?? 0,
      currency: json['currency'] as String? ?? '',
      string: json['string'] as String? ?? '',
      type: json['type'] as String? ?? '',
      brandId: json['brand_id'] as String? ?? '',
      rateId: json['rate_id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      activeInMenu: json['active_in_menu'] as bool? ?? false,
      hasModifier: json['has_modifier'] as bool? ?? false,
      fromTime: json['from_time'] as String? ?? '',
      toTime: json['to_time'] as String? ?? '',
      offAlways: json['off_always'] as bool? ?? false,
      title: TitleModel.fromJson(json['title'] as Map<String, dynamic>),
      description:
          Description.fromJson(json['description'] as Map<String, dynamic>),
      iikoId: json['iiko_id'] as String? ?? '',
      jowiId: json['jowi_id'] as String? ?? '',
    );

Map<String, dynamic> _$CategWithProductToJson(CategWithProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'out_price': instance.outPrice,
      'currency': instance.currency,
      'string': instance.string,
      'type': instance.type,
      'order_no': instance.orderNo,
      'categories': instance.categories,
      'brand_id': instance.brandId,
      'rate_id': instance.rateId,
      'image': instance.image,
      'active_in_menu': instance.activeInMenu,
      'has_modifier': instance.hasModifier,
      'from_time': instance.fromTime,
      'to_time': instance.toTime,
      'off_always': instance.offAlways,
      'title': instance.title,
      'description': instance.description,
      'active': instance.active,
      'iiko_id': instance.iikoId,
      'jowi_id': instance.jowiId,
    };
