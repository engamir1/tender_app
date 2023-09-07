// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tender_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TenderModelAdapter extends TypeAdapter<TenderModel> {
  @override
  final int typeId = 0;

  @override
  TenderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TenderModel(
      tender_title: fields[0] as String,
      entity: fields[1] as String,
      announcement_date: fields[2] as String,
      envelopes_opening_date: fields[3] as String,
      activity: fields[4] as String,
      insurance: fields[5] as String?,
      isFav: fields[6] as bool,
      id: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TenderModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.tender_title)
      ..writeByte(1)
      ..write(obj.entity)
      ..writeByte(2)
      ..write(obj.announcement_date)
      ..writeByte(3)
      ..write(obj.envelopes_opening_date)
      ..writeByte(4)
      ..write(obj.activity)
      ..writeByte(5)
      ..write(obj.insurance)
      ..writeByte(6)
      ..write(obj.isFav)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TenderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
