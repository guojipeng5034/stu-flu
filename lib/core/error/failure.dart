abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}
