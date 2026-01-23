import '../../entities/person/person_entity.dart';

abstract class PeopleRepository {
  Future<PersonEntity> fetchRandomPerson();
  Future<void> savePerson(PersonEntity person);
  Future<void> deletePerson(String uuid);
  Future<List<PersonEntity>> getSavedPeople();
  Future<bool> isPersonSaved(String uuid);
}
