import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:ttm01_flutter_dependency_injection/common/logger.dart';

import 'logger_test.mocks.dart';

@GenerateMocks([Logger])
void main() {
  late MockLogger mockLogger;

  setUp(() {
    mockLogger = MockLogger();
  });

  group('Logger Tests', () {
    test('should log message', () {
      const message = 'Test message';
      logMessage(mockLogger, message);
      verify(mockLogger.i(message)).called(1);
    });

    test('should log message', () {
      const message = 'Test message error';
      logMessageError(mockLogger, message);
      verify(mockLogger.e(message)).called(1);
    });
  });
}
