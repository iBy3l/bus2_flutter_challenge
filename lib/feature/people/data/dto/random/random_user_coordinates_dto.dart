class RandomUserCoordinatesDto {
  final String latitude;
  final String longitude;

  const RandomUserCoordinatesDto({
    required this.latitude,
    required this.longitude,
  });

  factory RandomUserCoordinatesDto.fromJson(Map<String, dynamic> json) {
    return RandomUserCoordinatesDto(
      latitude: json['latitude']?.toString() ?? '',
      longitude: json['longitude']?.toString() ?? '',
    );
  }
}
