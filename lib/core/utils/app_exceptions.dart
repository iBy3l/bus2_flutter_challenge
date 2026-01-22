abstract class AppException implements Exception {
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  const AppException(this.message, {this.cause, this.stackTrace});

  @override
  String toString() => '$runtimeType: $message';
}

class NetworkException extends AppException {
  const NetworkException(super.message, {super.cause, super.stackTrace});
}

class TimeoutException extends AppException {
  const TimeoutException(super.message, {super.cause, super.stackTrace});
}

class ServerException extends AppException {
  final int statusCode;

  const ServerException(
    this.statusCode,
    String message, {
    super.cause,
    super.stackTrace,
  }) : super(message);
}

class ParseException extends AppException {
  const ParseException(super.message, {super.cause, super.stackTrace});
}

class EmptyResponseException extends AppException {
  const EmptyResponseException(super.message, {super.cause, super.stackTrace});
}

class UnknownException extends AppException {
  const UnknownException(super.message, {super.cause, super.stackTrace});
}
