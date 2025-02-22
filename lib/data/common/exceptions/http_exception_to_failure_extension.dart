import '../../../core/errors/failures.dart';
import 'http_exception.dart';

extension HttpExceptionToFailureExtension on HttpException {
  Failure toFailure() => switch (this) {
        ConnectionTimeoutException() => ConnectionFailure(),
        SendTimeoutException() => ConnectionFailure(),
        ReceiveTimeoutException() => ConnectionFailure(),
        ConnectionErrorException() => ConnectionFailure(),
        _ => ServerFailure()
      };
}
