import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class SavedPeopleNotifier extends ChangeNotifier {
  final GetSavedPeopleUseCase getSavedPeople;
  final DeletePersonUseCase deletePersonUseCase;
  final SavePersonUseCase savePersonUseCase;

  List<PersonEntity> _people = [];
  List<PersonEntity> get people => _people;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SavedPeopleNotifier({
    required this.getSavedPeople,
    required this.deletePersonUseCase,
    required this.savePersonUseCase,
  });

  Future<void> loadPeople() async {
    _isLoading = true;
    notifyListeners();
    try {
      _people = await getSavedPeople();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deletePerson(String uuid) async {
    try {
      await deletePersonUseCase(uuid);
      await loadPeople();
    } catch (e) {}
  }

  Future<void> savePerson(PersonEntity person) async {
    try {
      await savePersonUseCase(person);
      await loadPeople();
    } catch (e) {}
  }
}
