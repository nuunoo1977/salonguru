import 'package:dio/dio.dart';

import '../exceptions/http_exception.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeoutException();
      case DioExceptionType.sendTimeout:
        throw SendTimeoutException();
      case DioExceptionType.receiveTimeout:
        throw ReceiveTimeoutException();
      case DioExceptionType.badCertificate:
        throw BadCertificateException();
      case DioExceptionType.connectionError:
        throw ConnectionErrorException();
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException();
          case 401:
            throw UnauthorizedException();
          case 403:
            throw ForbiddenException();
          case 404:
            throw NotFoundException();
          case 409:
            throw ConflictException();
          case 500:
            throw InternalServerErrorException();
        }
        break;
      case DioExceptionType.cancel:
        throw CancelException();
      case DioExceptionType.unknown:
        throw UnknownException();
    }
    return handler.next(err);
  }
}
