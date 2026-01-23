import '../../repositories/repositories.dart';

class DeletePersonUseCase {
  final PeopleRepository repository;

  DeletePersonUseCase(this.repository);

  Future<void> call(String uuid) async {
    await repository.deletePerson(uuid);
  }
}
