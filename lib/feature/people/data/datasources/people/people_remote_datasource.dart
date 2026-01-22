import '../../../../../core/core.dart';

abstract class PeopleRemoteDataSource {
  Future<Map<String, dynamic>> fetchRandomPerson();
}

class PeopleRemoteDataSourceImpl implements PeopleRemoteDataSource {
  final AppHttpClient http;

  PeopleRemoteDataSourceImpl(this.http);

  static final Uri _uri = Uri.parse('https://randomuser.me/api/');

  @override
  Future<Map<String, dynamic>> fetchRandomPerson() async {
    try {
      final json = await http.getJson(_uri);

      if (json['results'].isEmpty) {
        throw const EmptyResponseException('API retornou results vazio.');
      }

      return json['results'].first;
    } on AppException {
      rethrow;
    } catch (e, st) {
      throw ParseException(
        'Falha ao converter JSON para DTO.',
        cause: e,
        stackTrace: st,
      );
    }
  }
}
