import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_assignment/data/network/interceptors/request_header.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioSingleton {
  static Dio? _instance;

  static Dio get instance {
    _instance ??= _createDio();
    return _instance!;
  }

  static Dio _createDio() {
    var dio = Dio()
      ..options.contentType = Headers.jsonContentType
      ..options.connectTimeout = const Duration(seconds: 60)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..interceptors.add(RequestHeaderInterceptor());

    // Add an interceptor to log requests and responses in debug mode.
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: false,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        ),
      );
    }
    return dio;
  }
}
