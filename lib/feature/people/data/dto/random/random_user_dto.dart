import 'random.dart';

class RandomUserDto {
  final String gender;
  final RandomUserNameDto name;
  final RandomUserLocationDto location;
  final String email;
  final RandomUserLoginDto login;
  final RandomUserDobDto dob;
  final RandomUserRegisteredDto registered;
  final String phone;
  final String cell;
  final RandomUserIdDto id;
  final RandomUserPictureDto picture;
  final String nat;

  const RandomUserDto({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  factory RandomUserDto.fromJson(Map<String, dynamic> json) {
    return RandomUserDto(
      gender: json['gender']?.toString() ?? '',
      name: RandomUserNameDto.fromJson(json['name'] as Map<String, dynamic>),
      location: RandomUserLocationDto.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      email: json['email']?.toString() ?? '',
      login: RandomUserLoginDto.fromJson(json['login'] as Map<String, dynamic>),
      dob: RandomUserDobDto.fromJson(json['dob'] as Map<String, dynamic>),
      registered: RandomUserRegisteredDto.fromJson(
        json['registered'] as Map<String, dynamic>,
      ),
      phone: json['phone']?.toString() ?? '',
      cell: json['cell']?.toString() ?? '',
      id: RandomUserIdDto.fromJson(json['id'] as Map<String, dynamic>),
      picture: RandomUserPictureDto.fromJson(
        json['picture'] as Map<String, dynamic>,
      ),
      nat: json['nat']?.toString() ?? '',
    );
  }
}
