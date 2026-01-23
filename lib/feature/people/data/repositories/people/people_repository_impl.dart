import '../../../data/data.dart';
import '../../../domain/domain.dart';

class PeopleRepositoryImpl implements PeopleRepository {
  final PeopleRemoteDataSource remoteDataSource;
  final PeopleLocalDataSource localDataSource;

  PeopleRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<PersonEntity> fetchRandomPerson() async {
    try {
      final dto = await remoteDataSource.fetchRandomPerson();
      final randomUserDto = RandomUserDto.fromJson(dto);
      return PersonMapper.toEntity(randomUserDto);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> savePerson(PersonEntity person) async {
    await localDataSource.savePerson(person);
  }

  @override
  Future<void> deletePerson(String uuid) async {
    await localDataSource.deletePerson(uuid);
  }

  @override
  Future<List<PersonEntity>> getSavedPeople() async {
    return await localDataSource.getSavedPeople();
  }

  @override
  Future<bool> isPersonSaved(String uuid) async {
    return await localDataSource.isPersonSaved(uuid);
  }
}
