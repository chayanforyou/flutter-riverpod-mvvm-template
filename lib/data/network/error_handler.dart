import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

String handleDioError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return "Request to API server was cancelled";
    case DioExceptionType.connectionTimeout:
      return "Connection timeout with API server";
    case DioExceptionType.connectionError:
      return "There is no internet connection";
    case DioExceptionType.receiveTimeout:
      return "Receive timeout in connection with API server";
    case DioExceptionType.sendTimeout:
      return "Send timeout in connection with API server";
    case DioExceptionType.badResponse:
      return _parseDioErrorResponse(dioError);
    case DioExceptionType.badCertificate:
      return "Bad certificate";
    case DioExceptionType.unknown:
      return "There is no internet connection";
  }
}

String _parseDioErrorResponse(DioException dioError) {
  final logger = Logger();

  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == 200) {
      statusCode = dioError.response?.data["statusCode"];
    }
    status = dioError.response?.data["status"];
    serverMessage = dioError.response?.data["message"];
  } catch (e, s) {
    logger.i("$e");
    logger.i(s.toString());

    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case 503:
      return "Service Temporarily Unavailable";
    case 404:
      return serverMessage ?? "";
    default:
      return serverMessage ?? "";
  }
}