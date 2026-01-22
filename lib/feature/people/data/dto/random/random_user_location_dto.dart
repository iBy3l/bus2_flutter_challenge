import 'random.dart';

class RandomUserLocationDto {
  final RandomUserStreetDto street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final RandomUserCoordinatesDto coordinates;
  final RandomUserTimezoneDto timezone;

  const RandomUserLocationDto({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory RandomUserLocationDto.fromJson(Map<String, dynamic> json) {
    return RandomUserLocationDto(
      street: RandomUserStreetDto.fromJson(
        json['street'] as Map<String, dynamic>,
      ),
      city: json['city']?.toString() ?? '',
      state: json['state']?.toString() ?? '',
      country: json['country']?.toString() ?? '',
      postcode: json['postcode'],
      coordinates: RandomUserCoordinatesDto.fromJson(
        json['coordinates'] as Map<String, dynamic>,
      ),
      timezone: RandomUserTimezoneDto.fromJson(
        json['timezone'] as Map<String, dynamic>,
      ),
    );
  }
}
