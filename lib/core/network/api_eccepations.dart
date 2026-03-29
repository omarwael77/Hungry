// ignore_for_file: unreachable_switch_default

import 'api_error.dart';
import 'package:dio/dio.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {

   
    String? serverMessage;

    if (error.response?.data is Map) {
      serverMessage =
          error.response?.data['message'] ??
          error.response?.data['error'];
    }

    switch (error.type) {

      case DioExceptionType.connectionTimeout:
        return ApiError(
          message: "Connection timeout. Please try again.",
        );

      case DioExceptionType.sendTimeout:
        return ApiError(
          message: "Request timeout while sending data.",
        );

      case DioExceptionType.receiveTimeout:
        return ApiError(
          message: "Server took too long to respond.",
        );

      case DioExceptionType.badCertificate:
        return ApiError(
          message: "Bad SSL certificate.",
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;

        
        if (serverMessage != null && serverMessage.isNotEmpty) {
          return ApiError(message: serverMessage);
        }

        switch (statusCode) {
          case 400:
            return ApiError(message: "Bad request.");
          case 401:
            return ApiError(message: "Unauthorized. Please login again.");
          case 403:
            return ApiError(message: "Access denied.");
          case 404:
            return ApiError(message: "Resource not found.");
          case 500:
            return ApiError(message: "Internal server error.");
          default:
            return ApiError(message: "Unexpected server error.");
        }

      case DioExceptionType.cancel:
        return ApiError(
          message: "Request was cancelled.",
        );

      case DioExceptionType.connectionError:
        return ApiError(
          message: "No internet connection.",
        );

      case DioExceptionType.unknown:
      default:
        return ApiError(
          message: "Something went wrong. Please try again.",
        );
    }
  }
}
