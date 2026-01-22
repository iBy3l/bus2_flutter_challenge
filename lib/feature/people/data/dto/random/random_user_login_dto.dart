class RandomUserLoginDto {
  final String uuid;
  final String username;

  const RandomUserLoginDto({required this.uuid, required this.username});

  factory RandomUserLoginDto.fromJson(Map<String, dynamic> json) {
    return RandomUserLoginDto(
      uuid: json['uuid']?.toString() ?? '',
      username: json['username']?.toString() ?? '',
    );
  }
}
