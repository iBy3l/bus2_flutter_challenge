import '../../../../../core/core.dart';

class RandomUserRegisteredDto {
  final DateTime date;
  final int age;

  const RandomUserRegisteredDto({required this.date, required this.age});

  factory RandomUserRegisteredDto.fromJson(Map<String, dynamic> json) {
    return RandomUserRegisteredDto(
      date: DateTime.tryParse(json['date']?.toString() ?? '') ?? DateTime(1970),
      age: toInt(json['age']),
    );
  }
}
