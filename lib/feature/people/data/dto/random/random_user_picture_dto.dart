class RandomUserPictureDto {
  final String large;
  final String medium;
  final String thumbnail;

  const RandomUserPictureDto({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory RandomUserPictureDto.fromJson(Map<String, dynamic> json) {
    return RandomUserPictureDto(
      large: json['large']?.toString() ?? '',
      medium: json['medium']?.toString() ?? '',
      thumbnail: json['thumbnail']?.toString() ?? '',
    );
  }
}
