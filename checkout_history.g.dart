
part of 'checkout_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckoutHistoryAdapter extends TypeAdapter<CheckoutHistory> {
  @override
  final int typeId = 1;

  @override
  CheckoutHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckoutHistory(
      productName: fields[0] as String,
      price: fields[1] as double,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CheckoutHistory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckoutHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
