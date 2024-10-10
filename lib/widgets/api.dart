import 'package:dio/dio.dart';
import 'package:flutter_example/utils/config.dart';

Dio get dio {
  BaseOptions options = BaseOptions(
    baseUrl: Config().baseUrl,
    // connectTimeout: const Duration(seconds: 5),
    // receiveTimeout: const Duration(seconds: 3),
  );
  Dio dio = Dio(options);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // Do something before request is sent.
        // If you want to resolve the request with custom data,
        // you can resolve a `Response` using `handler.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject with a `DioError` using `handler.reject(dioError)`.
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Do something with response data.
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object using `handler.reject(dioError)`.
        return handler.next(response);
      },
      onError: (error, handler) {
        // Do something with response error.
        // If you want to resolve the request with some custom data,
        // you can resolve a `Response` object using `handler.resolve(response)`.
        // throw DioException(
        //   requestOptions: error.requestOptions,
        //   response: error.response,
        //   type: DioExceptionType.badResponse,
        //   error: error.error,
        // );
        return handler.next(error);
      },
    ),
  );
  return dio;
}
