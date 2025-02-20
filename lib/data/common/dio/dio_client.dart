import "package:dio/dio.dart";
import "package:pretty_dio_logger/pretty_dio_logger.dart";

import "api_key_interceptor.dart";
import "dio_error_interceptor.dart";

class DioClient {
  late final Dio _dio;
  DioClient({
    required String apiKey,
    required String baseUrl,
    required Duration connectTimeout,
    required Duration sendTimeout,
    required Duration receiveTimeout,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            responseType: ResponseType.json,
            sendTimeout: sendTimeout,
            receiveTimeout: receiveTimeout,
            connectTimeout: connectTimeout,
          ),
        )..interceptors.addAll(
            [
              PrettyDioLogger(requestHeader: true, requestBody: true),
              ApiKeyInterceptor(apiKey),
              DioErrorInterceptor(),
            ],
          );

  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) =>
      _dio.get<T>(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

  Future<Response<T>> post<T>(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) =>
      _dio.post<T>(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
}
