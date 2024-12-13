// server exception
class ServerException implements Exception {
  final String message;
  // code
  final int statusCode;
  final dynamic details;

  ServerException(this.message, {this.statusCode = 500, this.details});
}
