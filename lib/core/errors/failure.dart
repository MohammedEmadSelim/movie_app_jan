abstract class Failure implements Exception {
  final String message;
  const Failure(this.message);
  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}
