import '../../../../../core/core.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';

class PeopleRemoteRepositoryImpl implements PeopleRemoteRepository {
  final PeopleRemoteDataSource remoteDataSource;

  PeopleRemoteRepositoryImpl(this.remoteDataSource);

  @override
  Future<RandomUserDto> fetchRandomPerson() async {
    try {
      final dto = await remoteDataSource.fetchRandomPerson();
      return RandomUserDto.fromJson(dto);
    } on NetworkException {
      rethrow;
    } on TimeoutException {
      rethrow;
    } on ServerException catch (e) {
      if (e.statusCode == 429) {
        throw ServerException(
          e.statusCode,
          'Muitas requisições (429). Aguarde alguns segundos.',
          cause: e.cause,
          stackTrace: e.stackTrace,
        );
      }
      if (e.statusCode >= 500) {
        throw ServerException(
          e.statusCode,
          'Servidor indisponível no momento (erro ${e.statusCode}).',
          cause: e.cause,
          stackTrace: e.stackTrace,
        );
      }
      rethrow;
    } on ParseException {
      rethrow;
    } on EmptyResponseException {
      rethrow;
    } on AppException {
      rethrow;
    } catch (e, st) {
      throw UnknownException(
        'Erro inesperado no repository remoto.',
        cause: e,
        stackTrace: st,
      );
    }
  }
}
