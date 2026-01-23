import 'package:hive/hive.dart';

abstract class Storage<T> {
  Future<void> init();

  Future<void> put(String key, T value);

  Future<T?> get(String key);

  Future<bool> containsKey(String key);

  Future<void> delete(String key);

  Future<List<T>> getAll();

  Future<void> clear();
}

class HiveStorage<T> implements Storage<T> {
  final String boxName;

  Box<T>? _box;

  HiveStorage(this.boxName);

  @override
  Future<void> init() async {
    _box = await Hive.openBox<T>(boxName);
  }

  Box<T> get _validBox {
    if (_box == null || !_box!.isOpen) {
      throw HiveError('Hive box "$boxName" is not open');
    }
    return _box!;
  }

  @override
  Future<void> put(String key, T value) async {
    await _validBox.put(key, value);
  }

  @override
  Future<T?> get(String key) async {
    return _validBox.get(key);
  }

  @override
  Future<bool> containsKey(String key) async {
    return _validBox.containsKey(key);
  }

  @override
  Future<void> delete(String key) async {
    await _validBox.delete(key);
  }

  @override
  Future<List<T>> getAll() async {
    return _validBox.values.toList();
  }

  @override
  Future<void> clear() async {
    await _validBox.clear();
  }
}
