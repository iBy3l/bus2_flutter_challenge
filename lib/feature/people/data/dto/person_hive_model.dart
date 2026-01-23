import 'package:hive/hive.dart';

import '../../domain/entities/person/person_entity.dart';

part 'person_hive_model.g.dart';

@HiveType(typeId: 0)
class PersonHiveModel {
  @HiveField(0)
  final String uuid;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String firstName;
  @HiveField(3)
  final String lastName;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String pictureLarge;
  @HiveField(6)
  final String pictureMedium;
  @HiveField(7)
  final String pictureThumbnail;
  @HiveField(8)
  final String gender;
  @HiveField(9)
  final String nat;
  @HiveField(10)
  final String phone;
  @HiveField(11)
  final String cell;
  @HiveField(12)
  final String username;
  @HiveField(13)
  final DateTime dobDate;
  @HiveField(14)
  final int dobAge;
  @HiveField(15)
  final DateTime registeredDate;
  @HiveField(16)
  final int registeredAge;
  @HiveField(17)
  final String idName;
  @HiveField(18)
  final String idValue;
  @HiveField(19)
  final int streetNumber;
  @HiveField(20)
  final String streetName;
  @HiveField(21)
  final String city;
  @HiveField(22)
  final String state;
  @HiveField(23)
  final String country;
  @HiveField(24)
  final String postcode;
  @HiveField(25)
  final String latitude;
  @HiveField(26)
  final String longitude;
  @HiveField(27)
  final String timezoneOffset;
  @HiveField(28)
  final String timezoneDescription;

  PersonHiveModel({
    required this.uuid,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.pictureLarge,
    required this.pictureMedium,
    required this.pictureThumbnail,
    required this.gender,
    required this.nat,
    required this.phone,
    required this.cell,
    required this.username,
    required this.dobDate,
    required this.dobAge,
    required this.registeredDate,
    required this.registeredAge,
    required this.idName,
    required this.idValue,
    required this.streetNumber,
    required this.streetName,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.latitude,
    required this.longitude,
    required this.timezoneOffset,
    required this.timezoneDescription,
  });

  factory PersonHiveModel.fromEntity(PersonEntity entity) {
    return PersonHiveModel(
      uuid: entity.uuid,
      title: entity.title,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      pictureLarge: entity.pictureLarge,
      pictureMedium: entity.pictureMedium,
      pictureThumbnail: entity.pictureThumbnail,
      gender: entity.gender,
      nat: entity.nat,
      phone: entity.phone,
      cell: entity.cell,
      username: entity.username,
      dobDate: entity.dobDate,
      dobAge: entity.dobAge,
      registeredDate: entity.registeredDate,
      registeredAge: entity.registeredAge,
      idName: entity.idName,
      idValue: entity.idValue,
      streetNumber: entity.streetNumber,
      streetName: entity.streetName,
      city: entity.city,
      state: entity.state,
      country: entity.country,
      postcode: entity.postcode,
      latitude: entity.latitude,
      longitude: entity.longitude,
      timezoneOffset: entity.timezoneOffset,
      timezoneDescription: entity.timezoneDescription,
    );
  }

  PersonEntity toEntity() {
    return PersonEntity(
      uuid: uuid,
      title: title,
      firstName: firstName,
      lastName: lastName,
      email: email,
      pictureLarge: pictureLarge,
      pictureMedium: pictureMedium,
      pictureThumbnail: pictureThumbnail,
      gender: gender,
      nat: nat,
      phone: phone,
      cell: cell,
      username: username,
      dobDate: dobDate,
      dobAge: dobAge,
      registeredDate: registeredDate,
      registeredAge: registeredAge,
      idName: idName,
      idValue: idValue,
      streetNumber: streetNumber,
      streetName: streetName,
      city: city,
      state: state,
      country: country,
      postcode: postcode,
      latitude: latitude,
      longitude: longitude,
      timezoneOffset: timezoneOffset,
      timezoneDescription: timezoneDescription,
    );
  }
}
