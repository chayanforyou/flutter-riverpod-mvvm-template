import 'package:dio/dio.dart';
import 'package:flutter_assignment/data/network/error_handler.dart';
import 'package:flutter_assignment/utils/toast.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final headers = await getCustomHeaders();
    options.headers.addAll(headers);
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final error = handleDioError(err);
    Toast.showError(error);
    handler.next(err);
  }

  Future<Map<String, String>> getCustomHeaders() async {
    var headers = {'content-type': 'application/json'};
    return headers;
  }
}
