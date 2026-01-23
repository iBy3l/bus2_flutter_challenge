import '../../entities/entities.dart';
import '../../repositories/repositories.dart';

class GetRandomPersonUseCase {
  final PeopleRepository repository;

  GetRandomPersonUseCase(this.repository);

  Future<PersonEntity> call() async {
    return await repository.fetchRandomPerson();
  }
}
