import '../../../../../core/core.dart';

class RandomUserStreetDto {
  final int number;
  final String name;

  const RandomUserStreetDto({required this.number, required this.name});

  factory RandomUserStreetDto.fromJson(Map<String, dynamic> json) {
    return RandomUserStreetDto(
      number: toInt(json['number']),
      name: json['name']?.toString() ?? '',
    );
  }
}
