class PersonEntity {
  final String uuid;

  final String gender;
  final String nat;

  final String title;
  final String firstName;
  final String lastName;

  final String email;
  final String phone;
  final String cell;

  final String username;

  final DateTime dobDate;
  final int dobAge;

  final DateTime registeredDate;
  final int registeredAge;

  final String idName;
  final String idValue;

  final int streetNumber;
  final String streetName;

  final String city;
  final String state;
  final String country;
  final String postcode;

  final String latitude;
  final String longitude;

  final String timezoneOffset;
  final String timezoneDescription;

  final String pictureLarge;
  final String pictureMedium;
  final String pictureThumbnail;

  const PersonEntity({
    required this.uuid,
    required this.gender,
    required this.nat,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
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
    required this.pictureLarge,
    required this.pictureMedium,
    required this.pictureThumbnail,
  });

  String get fullName => '$title $firstName $lastName'.trim();

  String get streetFull => '$streetName, $streetNumber';

  String get cityState => '$city - $state';
}
