import 'package:dio/dio.dart';
import 'package:hungry_resturant/core/network/api_eccepations.dart';
import 'package:hungry_resturant/core/network/dio_client.dart';
import 'package:hungry_resturant/core/units/pref_helper.dart';


class ApiService {
  final DioClient _dioClient = DioClient();

  //! GET request
  Future<dynamic> get(String endPoint, {bool auth = false}) async {
    try {
      Options? options;
      if (auth) {
        final token = await PrefHelper.getToken();
        options = Options(headers:
         {"Authorization": "Bearer $token"});
      }
      final response = await _dioClient.dio.get(endPoint, options: options);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //! POST request
  Future<dynamic> post(String endPoint, dynamic body, {bool auth = false}) async {
    try {
      Options? options;
      if (auth) {
        final token = await PrefHelper.getToken();
        options = Options(
          headers: 
        {"Authorization": "Bearer $token"});
      }
      final response = await _dioClient.dio.post(endPoint, data: body, options: options);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //! PUT request
  Future<dynamic> put(String endPoint, dynamic body, {bool auth = false}) async {
    try {
      Options? options;
      if (auth) {
        final token = await PrefHelper.getToken();
        options = Options(headers: {"Authorization": "Bearer $token"});
      }
      final response = await _dioClient.dio.put(endPoint, data: body, options: options);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //! DELETE request
  Future<dynamic> delete(String endPoint, dynamic body, {bool auth = false}) async {
    try {
      Options? options;
      if (auth) {
        final token = await PrefHelper.getToken();
        options = Options(headers: {"Authorization": "Bearer $token"});
      }
      final response = await _dioClient.dio.delete(endPoint, data: body, options: options);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
