// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_locations.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLocationsAdapter extends TypeAdapter<UserLocations> {
  @override
  final int typeId = 4;

  @override
  UserLocations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLocations(
      address: fields[1] as String,
      nameLocation: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserLocations obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nameLocation)
      ..writeByte(1)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
