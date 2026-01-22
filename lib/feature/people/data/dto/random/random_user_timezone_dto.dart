class RandomUserTimezoneDto {
  final String offset;
  final String description;

  const RandomUserTimezoneDto({
    required this.offset,
    required this.description,
  });

  factory RandomUserTimezoneDto.fromJson(Map<String, dynamic> json) {
    return RandomUserTimezoneDto(
      offset: json['offset']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
    );
  }
}
