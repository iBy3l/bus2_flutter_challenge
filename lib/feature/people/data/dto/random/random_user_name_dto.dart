class RandomUserNameDto {
  final String title;
  final String first;
  final String last;

  const RandomUserNameDto({
    required this.title,
    required this.first,
    required this.last,
  });

  factory RandomUserNameDto.fromJson(Map<String, dynamic> json) {
    return RandomUserNameDto(
      title: json['title']?.toString() ?? '',
      first: json['first']?.toString() ?? '',
      last: json['last']?.toString() ?? '',
    );
  }
}
