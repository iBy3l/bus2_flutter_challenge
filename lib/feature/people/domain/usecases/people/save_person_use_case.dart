import '../../entities/entities.dart';
import '../../repositories/repositories.dart';

class SavePersonUseCase {
  final PeopleRepository repository;

  SavePersonUseCase(this.repository);

  Future<void> call(PersonEntity person) async {
    await repository.savePerson(person);
  }
}
