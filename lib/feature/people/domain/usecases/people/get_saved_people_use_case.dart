import '../../entities/entities.dart';
import '../../repositories/repositories.dart';

class GetSavedPeopleUseCase {
  final PeopleRepository repository;

  GetSavedPeopleUseCase(this.repository);

  Future<List<PersonEntity>> call() async {
    return await repository.getSavedPeople();
  }
}
