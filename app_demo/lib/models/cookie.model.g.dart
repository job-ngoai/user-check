// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cookie.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CookieModelAdapter extends TypeAdapter<CookieModel> {
  @override
  final int typeId = 1;

  @override
  CookieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CookieModel(
      sb: fields[0] as String?,
      fr: fields[1] as String?,
      datr: fields[2] as String?,
      xs: fields[3] as String?,
      cUser: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CookieModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.sb)
      ..writeByte(1)
      ..write(obj.fr)
      ..writeByte(2)
      ..write(obj.datr)
      ..writeByte(3)
      ..write(obj.xs)
      ..writeByte(4)
      ..write(obj.cUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CookieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
