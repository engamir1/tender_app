// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favtender_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavTenderModelAdapter extends TypeAdapter<FavTenderModel> {
  @override
  final int typeId = 1;

  @override
  FavTenderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavTenderModel(
      tender_title: fields[8] as String,
      entity: fields[9] as String,
      announcement_date: fields[10] as String,
      envelopes_opening_date: fields[11] as String,
      activity: fields[12] as String,
      insurance: fields[13] as String?,
      isFav: fields[14] as bool,
      id: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavTenderModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(8)
      ..write(obj.tender_title)
      ..writeByte(9)
      ..write(obj.entity)
      ..writeByte(10)
      ..write(obj.announcement_date)
      ..writeByte(11)
      ..write(obj.envelopes_opening_date)
      ..writeByte(12)
      ..write(obj.activity)
      ..writeByte(13)
      ..write(obj.insurance)
      ..writeByte(14)
      ..write(obj.isFav)
      ..writeByte(15)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavTenderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
