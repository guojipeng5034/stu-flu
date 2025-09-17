import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

void main() {
  group('DioClient Basic Tests', () {
    test('Dio should be configurable with basic options', () {
      final dio = Dio();
      dio.options.baseUrl = 'https://api.example.com';
      dio.options.connectTimeout = const Duration(seconds: 5);
      dio.options.receiveTimeout = const Duration(seconds: 3);

      expect(dio.options.baseUrl, 'https://api.example.com');
      expect(dio.options.connectTimeout, const Duration(seconds: 5));
      expect(dio.options.receiveTimeout, const Duration(seconds: 3));
    });

    test('Dio should support interceptors', () {
      final dio = Dio();
      final initialCount = dio.interceptors.length;
      final interceptor = LogInterceptor();
      dio.interceptors.add(interceptor);

      expect(dio.interceptors.length, initialCount + 1);
      expect(dio.interceptors.last, isA<LogInterceptor>());
    });

    test('Dio should support custom headers', () {
      final dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer token';

      expect(dio.options.headers['Content-Type'], 'application/json');
      expect(dio.options.headers['Authorization'], 'Bearer token');
    });
  });
}
