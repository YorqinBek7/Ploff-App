// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TitleAdapter extends TypeAdapter<Title1> {
  @override
  final int typeId = 6;

  @override
  Title1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Title1(
      en: fields[2] as String,
      ru: fields[1] as String,
      uz: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Title1 obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uz)
      ..writeByte(1)
      ..write(obj.ru)
      ..writeByte(2)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TitleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Title1 _$TitleFromJson(Map<String, dynamic> json) => Title1(
      en: json['en'] as String? ?? '',
      ru: json['ru'] as String? ?? '',
      uz: json['uz'] as String? ?? '',
    );

Map<String, dynamic> _$TitleToJson(Title1 instance) => <String, dynamic>{
      'uz': instance.uz,
      'ru': instance.ru,
      'en': instance.en,
    };
