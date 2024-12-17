class ServerException implements Exception {
  final String errorMessage;
  final num statusCode;
  final String? errorKey;
  const ServerException({required this.statusCode, required this.errorMessage, this.errorKey});

  @override
  String toString() {
    return 'ServerException(statusCode: $statusCode, errorMessage: $errorMessage)';
  }
}

class ParsingException implements Exception {
  final String errorMessage;
  const ParsingException({required this.errorMessage});
}

class CacheException implements Exception{}