import '../../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../dto/dto.dart';

abstract class PeopleLocalDataSource {
  Future<void> savePerson(PersonEntity person);
  Future<void> deletePerson(String uuid);
  Future<List<PersonEntity>> getSavedPeople();
  Future<bool> isPersonSaved(String uuid);
  Future<void> init();
}

class PeopleLocalDataSourceImpl implements PeopleLocalDataSource {
  final Storage<PersonHiveModel> storage;

  PeopleLocalDataSourceImpl(this.storage);

  @override
  Future<void> init() async {
    await storage.init();
  }

  @override
  Future<void> savePerson(PersonEntity person) async {
    final hiveModel = PersonHiveModel.fromEntity(person);
    await storage.put(person.uuid, hiveModel);
  }

  @override
  Future<void> deletePerson(String uuid) async {
    await storage.delete(uuid);
  }

  @override
  Future<List<PersonEntity>> getSavedPeople() async {
    final items = await storage.getAll();
    return items.map((e) => e.toEntity()).toList();
  }

  @override
  Future<bool> isPersonSaved(String uuid) async {
    return storage.containsKey(uuid);
  }
}
