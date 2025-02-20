// TODO(nunofelicio): Add exception details to each exception

sealed class HttpException implements Exception {}

class ConnectionTimeoutException extends HttpException {}

class SendTimeoutException extends HttpException {}

class ReceiveTimeoutException extends HttpException {}

class BadCertificateException extends HttpException {}

class BadResponseException extends HttpException {}

class CancelException extends HttpException {}

class ConnectionErrorException extends HttpException {}

class BadRequestException extends HttpException {}

class UnauthorizedException extends HttpException {}

class ForbiddenException extends HttpException {}

class NotFoundException extends HttpException {}

class ConflictException extends HttpException {}

class InternalServerErrorException extends HttpException {}

class UnknownException extends HttpException {}
