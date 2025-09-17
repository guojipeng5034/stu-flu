import 'package:cptop/core/di/di.dart'; // For DI.dioProvider
import 'package:cptop/features/student/data/api/student_api.dart';
import 'package:cptop/features/student/data/services/student_service.dart'; // Import StudentService
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Student API Provider
/// Provides an instance of StudentApi.
final studentApiProvider = DI.createApiProvider<StudentApi>(
  (dio) => StudentApi(dio),
);

/// Student Service Provider
/// Provides an instance of StudentService.
final studentServiceProvider = FutureProvider<StudentService>((ref) async {
  final studentApi = await ref.watch(studentApiProvider.future);
  return StudentService(studentApi);
});
