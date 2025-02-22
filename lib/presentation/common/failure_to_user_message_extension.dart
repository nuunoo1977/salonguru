import '../../core/errors/failures.dart';

// TODO(nunofelicio): Implement localization for these messages

extension FailureToUserMessage on Failure {
  String toUserMessage() => switch (this) {
        ConnectionFailure() =>
          "There was an error connecting to the server. Please check your internet connection and try again.",
        ServerFailure() =>
          "There was an unexpected error. Please try again later. Please try again later.",
        UnknownFailure() => "There was an unexpected error. Please try again later.",
        NotFound() => "The product was not found.",
      };
}
