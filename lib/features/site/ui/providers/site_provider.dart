import 'package:cptop/core/di/di.dart'; // For DI.dioProvider
import 'package:cptop/features/site/data/api/site_api.dart';
import 'package:cptop/features/site/data/services/site_service.dart'; // Import SiteService
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Site API Provider
/// Provides an instance of SiteApi.
final siteApiProvider = DI.createApiProvider<SiteApi>(
  (dio) => SiteApi(dio),
);

/// Site Service Provider
/// Provides an instance of SiteService.
final siteServiceProvider = FutureProvider<SiteService>((ref) async {
  final siteApi = await ref.watch(siteApiProvider.future);
  return SiteService(siteApi);
});
