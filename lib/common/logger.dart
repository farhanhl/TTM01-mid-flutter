import 'package:logger/logger.dart';

void logMessage(Logger logger, String message) {
  logger.i(message);
}

void logMessageError(Logger logger, String message) {
  logger.e(message);
}
