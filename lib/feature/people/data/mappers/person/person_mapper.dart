import 'package:uuid/uuid.dart';

import '../../../domain/entities/person/person_entity.dart';
import '../../dto/random/random_user_dto.dart';

class PersonMapper {
  static PersonEntity toEntity(RandomUserDto dto) {
    return PersonEntity(
      uuid: const Uuid().v4(),
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
      postcode: dto.location.postcode.toString(),
      latitude: dto.location.coordinates.latitude,
      longitude: dto.location.coordinates.longitude,
      timezoneOffset: dto.location.timezone.offset,
      timezoneDescription: dto.location.timezone.description,
      pictureLarge: dto.picture.large,
      pictureMedium: dto.picture.medium,
      pictureThumbnail: dto.picture.thumbnail,
    );
  }
}
