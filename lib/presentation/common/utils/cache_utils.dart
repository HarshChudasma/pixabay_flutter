import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Cache urils manager

class CacheUtils {
  static CacheManager cacheManager(
      String key, {
        Duration stalePeriod = const Duration(days: 7),
      }) {
    return CacheManager(
      Config(
        key,
        stalePeriod: stalePeriod,
      ),
    );
  }
}
