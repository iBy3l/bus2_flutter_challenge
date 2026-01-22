import '../../../../../core/core.dart';

class RandomUserInfoDto {
  final String seed;
  final int results;
  final int page;
  final String version;

  const RandomUserInfoDto({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  factory RandomUserInfoDto.fromJson(Map<String, dynamic> json) {
    return RandomUserInfoDto(
      seed: json['seed']?.toString() ?? '',
      results: toInt(json['results']),
      page: toInt(json['page']),
      version: json['version']?.toString() ?? '',
    );
  }
}
