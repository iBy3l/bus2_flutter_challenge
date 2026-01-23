// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonHiveModelAdapter extends TypeAdapter<PersonHiveModel> {
  @override
  final int typeId = 0;

  @override
  PersonHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonHiveModel(
      uuid: fields[0] as String,
      title: fields[1] as String,
      firstName: fields[2] as String,
      lastName: fields[3] as String,
      email: fields[4] as String,
      pictureLarge: fields[5] as String,
      pictureMedium: fields[6] as String,
      pictureThumbnail: fields[7] as String,
      gender: fields[8] as String,
      nat: fields[9] as String,
      phone: fields[10] as String,
      cell: fields[11] as String,
      username: fields[12] as String,
      dobDate: fields[13] as DateTime,
      dobAge: fields[14] as int,
      registeredDate: fields[15] as DateTime,
      registeredAge: fields[16] as int,
      idName: fields[17] as String,
      idValue: fields[18] as String,
      streetNumber: fields[19] as int,
      streetName: fields[20] as String,
      city: fields[21] as String,
      state: fields[22] as String,
      country: fields[23] as String,
      postcode: fields[24] as String,
      latitude: fields[25] as String,
      longitude: fields[26] as String,
      timezoneOffset: fields[27] as String,
      timezoneDescription: fields[28] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonHiveModel obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.pictureLarge)
      ..writeByte(6)
      ..write(obj.pictureMedium)
      ..writeByte(7)
      ..write(obj.pictureThumbnail)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.nat)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.cell)
      ..writeByte(12)
      ..write(obj.username)
      ..writeByte(13)
      ..write(obj.dobDate)
      ..writeByte(14)
      ..write(obj.dobAge)
      ..writeByte(15)
      ..write(obj.registeredDate)
      ..writeByte(16)
      ..write(obj.registeredAge)
      ..writeByte(17)
      ..write(obj.idName)
      ..writeByte(18)
      ..write(obj.idValue)
      ..writeByte(19)
      ..write(obj.streetNumber)
      ..writeByte(20)
      ..write(obj.streetName)
      ..writeByte(21)
      ..write(obj.city)
      ..writeByte(22)
      ..write(obj.state)
      ..writeByte(23)
      ..write(obj.country)
      ..writeByte(24)
      ..write(obj.postcode)
      ..writeByte(25)
      ..write(obj.latitude)
      ..writeByte(26)
      ..write(obj.longitude)
      ..writeByte(27)
      ..write(obj.timezoneOffset)
      ..writeByte(28)
      ..write(obj.timezoneDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
