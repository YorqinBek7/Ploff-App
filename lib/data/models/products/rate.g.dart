// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RateAdapter extends TypeAdapter<Rate> {
  @override
  final int typeId = 6;

  @override
  Rate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rate(
      id: fields[0] as String,
      slug: fields[1] as String,
      title: fields[4] as String,
      code: fields[2] as String,
      rate_amount: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Rate obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.rate_amount)
      ..writeByte(4)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rate _$RateFromJson(Map<String, dynamic> json) => Rate(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      title: json['title'] as String? ?? '',
      code: json['code'] as String? ?? '',
      rate_amount: json['rate_amount'] as String? ?? '',
    );

Map<String, dynamic> _$RateToJson(Rate instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'code': instance.code,
      'rate_amount': instance.rate_amount,
      'title': instance.title,
    };
