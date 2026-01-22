import '../../../domain/domain.dart';
import '../../dto/dto.dart';

class PersonMapper {
  static PersonEntity fromApiJson(Map<String, dynamic> json) {
    final response = RandomUserResponseDto.fromJson(json);
    final dto = response.results.first;
    return fromApiDto(dto);
  }

  static PersonEntity fromApiDto(RandomUserDto dto) {
    return PersonEntity(
      uuid: dto.login.uuid,
      gender: dto.gender,
      nat: dto.nat,

      title: dto.name.title,
      firstName: dto.name.first,
      lastName: dto.name.last,

      email: dto.email,
      phone: dto.phone,
      cell: dto.cell,

      username: dto.login.username,

      dobDate: dto.dob.date,
      dobAge: dto.dob.age,

      registeredDate: dto.registered.date,
      registeredAge: dto.registered.age,

      idName: dto.id.name,
      idValue: dto.id.value,

      streetNumber: dto.location.street.number,
      streetName: dto.location.street.name,

      city: dto.location.city,
      state: dto.location.state,
      country: dto.location.country,
      postcode: dto.location.postcode?.toString() ?? '',

      latitude: dto.location.coordinates.latitude,
      longitude: dto.location.coordinates.longitude,

      timezoneOffset: dto.location.timezone.offset,
      timezoneDescription: dto.location.timezone.description,

      pictureLarge: dto.picture.large,
      pictureMedium: dto.picture.medium,
      pictureThumbnail: dto.picture.thumbnail,
    );
  }

  static Map<String, dynamic> toStorageMap(PersonEntity p) {
    return {
      'uuid': p.uuid,
      'gender': p.gender,
      'nat': p.nat,

      'title': p.title,
      'firstName': p.firstName,
      'lastName': p.lastName,

      'email': p.email,
      'phone': p.phone,
      'cell': p.cell,

      'username': p.username,

      'dobDate': p.dobDate.toIso8601String(),
      'dobAge': p.dobAge,

      'registeredDate': p.registeredDate.toIso8601String(),
      'registeredAge': p.registeredAge,

      'idName': p.idName,
      'idValue': p.idValue,

      'streetNumber': p.streetNumber,
      'streetName': p.streetName,

      'city': p.city,
      'state': p.state,
      'country': p.country,
      'postcode': p.postcode,

      'latitude': p.latitude,
      'longitude': p.longitude,

      'timezoneOffset': p.timezoneOffset,
      'timezoneDescription': p.timezoneDescription,

      'pictureLarge': p.pictureLarge,
      'pictureMedium': p.pictureMedium,
      'pictureThumbnail': p.pictureThumbnail,
    };
  }

  static PersonEntity fromStorageMap(Map<String, dynamic> map) {
    return PersonEntity(
      uuid: map['uuid']?.toString() ?? '',
      gender: map['gender']?.toString() ?? '',
      nat: map['nat']?.toString() ?? '',

      title: map['title']?.toString() ?? '',
      firstName: map['firstName']?.toString() ?? '',
      lastName: map['lastName']?.toString() ?? '',

      email: map['email']?.toString() ?? '',
      phone: map['phone']?.toString() ?? '',
      cell: map['cell']?.toString() ?? '',

      username: map['username']?.toString() ?? '',

      dobDate:
          DateTime.tryParse(map['dobDate']?.toString() ?? '') ?? DateTime(1970),
      dobAge: _toInt(map['dobAge']),

      registeredDate:
          DateTime.tryParse(map['registeredDate']?.toString() ?? '') ??
          DateTime(1970),
      registeredAge: _toInt(map['registeredAge']),

      idName: map['idName']?.toString() ?? '',
      idValue: map['idValue']?.toString() ?? '',

      streetNumber: _toInt(map['streetNumber']),
      streetName: map['streetName']?.toString() ?? '',

      city: map['city']?.toString() ?? '',
      state: map['state']?.toString() ?? '',
      country: map['country']?.toString() ?? '',
      postcode: map['postcode']?.toString() ?? '',

      latitude: map['latitude']?.toString() ?? '',
      longitude: map['longitude']?.toString() ?? '',

      timezoneOffset: map['timezoneOffset']?.toString() ?? '',
      timezoneDescription: map['timezoneDescription']?.toString() ?? '',

      pictureLarge: map['pictureLarge']?.toString() ?? '',
      pictureMedium: map['pictureMedium']?.toString() ?? '',
      pictureThumbnail: map['pictureThumbnail']?.toString() ?? '',
    );
  }

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    return int.tryParse(value.toString()) ?? 0;
  }
}
