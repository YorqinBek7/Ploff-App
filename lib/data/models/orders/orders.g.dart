// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrdersAdapter extends TypeAdapter<Orders> {
  @override
  final int typeId = 5;

  @override
  Orders read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Orders(
      orderedProducts: (fields[4] as List).cast<CategWithProduct>(),
      address: fields[0] as String,
      date: fields[2] as String,
      paymentType: fields[3] as String,
      time: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Orders obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.paymentType)
      ..writeByte(4)
      ..write(obj.orderedProducts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrdersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
