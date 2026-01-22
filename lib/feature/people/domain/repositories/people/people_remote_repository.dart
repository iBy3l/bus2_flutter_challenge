import '../../../data/data.dart';

abstract class PeopleRemoteRepository {
  Future<RandomUserDto> fetchRandomPerson();
}
