class ServerException implements Exception {
  final String? message;
  ServerException([this.message]);

  @override
  String toString() =>
      "ServerException: ${message ?? 'An error occurred on the server'}";
}

class CacheException implements Exception {
  final String? message;
  CacheException([this.message]);

  @override
  String toString() =>
      "CacheException: ${message ?? 'A caching error occurred'}";
}

class NetworkException implements Exception {
  final String? message;
  NetworkException([this.message]);

  @override
  String toString() =>
      "NetworkException: ${message ?? 'A network error occurred'}";
}
