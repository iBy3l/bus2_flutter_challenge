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
  final ValueNotifier<double> timeProgress = ValueNotifier(1.0);

  HomeNotifier({required this.getRandomPerson, required this.savePerson});

  void init(TickerProvider tickerProvider) {
    fetchAndSavePerson();

    _ticker = tickerProvider.createTicker(_onTick);
    _ticker?.start();
  }

  void _onTick(Duration elapsed) {
    if (_isLoading) {
      _lastTrigger = elapsed;
      timeProgress.value = 1.0;
      return;
    }

    final elapsedSinceLast = elapsed - _lastTrigger;

    double progress =
        1.0 - (elapsedSinceLast.inMilliseconds / _interval.inMilliseconds);
    timeProgress.value = progress.clamp(0.0, 1.0);

    if (elapsedSinceLast >= _interval) {
      _lastTrigger = elapsed;
      timeProgress.value = 0.0;
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
      timeProgress.value = 1.0;

      notifyListeners();
    }
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }
}
