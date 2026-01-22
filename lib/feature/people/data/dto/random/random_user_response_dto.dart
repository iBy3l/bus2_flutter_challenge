import 'random.dart';

class RandomUserResponseDto {
  final List<RandomUserDto> results;
  final RandomUserInfoDto info;

  const RandomUserResponseDto({required this.results, required this.info});

  factory RandomUserResponseDto.fromJson(Map<String, dynamic> json) {
    return RandomUserResponseDto(
      results: (json['results'] as List<dynamic>)
          .map((e) => RandomUserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: RandomUserInfoDto.fromJson(json['info'] as Map<String, dynamic>),
    );
  }
}
