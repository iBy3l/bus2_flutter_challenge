class RandomUserIdDto {
  final String name;
  final String value;

  const RandomUserIdDto({required this.name, required this.value});

  factory RandomUserIdDto.fromJson(Map<String, dynamic> json) {
    return RandomUserIdDto(
      name: json['name']?.toString() ?? '',
      value: json['value']?.toString() ?? '',
    );
  }
}
