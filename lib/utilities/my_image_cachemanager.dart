import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:stealth_frontend/constants.dart';

class MyImageCacheManager {
  // profile image cache manager
  static CacheManager profileCacheManager = CacheManager(
    Config(
      Constants.userImageCacheKey,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 100,
    ),
  );
}
