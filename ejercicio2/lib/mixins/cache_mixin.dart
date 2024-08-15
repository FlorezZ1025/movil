import 'package:ejercicio2/models/character.dart';

mixin CacheMixin {
  final Map<String, dynamic> _cache = {};

  void saveToCache(String key, List<Character> value) {
    _cache[key] = value;
    print('Data saved to cache with key: $key');
  }

  List<Character> getFromCache(String key) {
    print('Fetching data from cache with key: $key');
    return _cache[key];
  }

  bool isCached(String key) {
    return _cache.containsKey(key);
  }
}
