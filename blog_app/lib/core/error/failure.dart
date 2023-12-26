/// Base failure class
abstract class Failure {}

class GenericFailure implements Failure {
  final String failureMessage;

  GenericFailure([this.failureMessage = 'Something went wrong.']);
  @override
  String toString() {
    return failureMessage.toString();
  }
}

class ServerFailure implements Failure {
  final String failureMessage;

  ServerFailure([this.failureMessage = 'Something went wrong.']);
  @override
  String toString() {
    return failureMessage.toString();
  }
}

class CacheFailure implements Failure {}

class NoDataFailure implements Failure {}
