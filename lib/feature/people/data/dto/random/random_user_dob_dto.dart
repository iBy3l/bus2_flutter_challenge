import '../../../../../core/core.dart';

class RandomUserDobDto {
  final DateTime date;
  final int age;

  const RandomUserDobDto({required this.date, required this.age});

  factory RandomUserDobDto.fromJson(Map<String, dynamic> json) {
    return RandomUserDobDto(
      date: DateTime.tryParse(json['date']?.toString() ?? '') ?? DateTime(1970),
      age: toInt(json['age']),
    );
  }
}
