import 'package:equatable/equatable.dart';

// TODO(nunofelicio): Add properties to each failure, like related exceptions and stack traces, that can be used for logging in domain layer.
sealed class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectionFailure extends Failure {}

class ServerFailure extends Failure {}

class UnknownFailure extends Failure {}

class NotFound extends Failure {}
