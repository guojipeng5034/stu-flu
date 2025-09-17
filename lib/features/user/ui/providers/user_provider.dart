import 'package:cptop/core/di/di.dart';
import 'package:cptop/features/user/data/api/user_api.dart';

/// User API Provider
/// Provides an instance of UserApi.
final userApiProvider = DI.createApiProvider<UserApi>(
  (dio) => UserApi(dio),
);
