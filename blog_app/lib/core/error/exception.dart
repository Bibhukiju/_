// Custom Exceptions
/// Used sever throws an an error
class ServerException implements Exception {
  String? message;
  ServerException([this.message = 'Something went wrong.']);

  @override
  String toString() {
    return message.toString();
  }
}

/// Used when there's no data
class NoDataException implements Exception {}

/// Used when local data storage throws an an error
class CacheException implements Exception {}
