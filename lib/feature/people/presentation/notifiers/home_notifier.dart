import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../domain/domain.dart';

class HomeNotifier extends ChangeNotifier {
  final GetRandomPersonUseCase getRandomPerson;
  final SavePersonUseCase savePerson;

  final List<PersonEntity> _people = [];
  List<PersonEntity> get people => _people;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Ticker? _ticker;
  final Duration _interval = const Duration(seconds: 5);
  Duration _lastTrigger = Duration.zero;

  HomeNotifier({required this.getRandomPerson, required this.savePerson});

  void init(TickerProvider tickerProvider) {
    fetchAndSavePerson();

    _ticker = tickerProvider.createTicker(_onTick);
    _ticker?.start();
  }

  void _onTick(Duration elapsed) {
    if (elapsed - _lastTrigger >= _interval) {
      _lastTrigger = elapsed;
      fetchAndSavePerson();
    }
  }

  Future<void> fetchAndSavePerson() async {
    _isLoading = true;
    notifyListeners();

    try {
      final person = await getRandomPerson();
      await savePerson(person);

      _people.insert(0, person);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }
}
