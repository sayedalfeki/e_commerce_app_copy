import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';

import '../base_error/custom_exceptions.dart';
import '../base_error/server_error_response.dart';

Future<BaseResponse<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return SuccessResponse(data: result);
  } on DioException catch (exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        {
          return ErrorResponse(error: ConnectionError());
        }
      default:
        {
          final data = exception.response?.data;
          final json = data is String ? jsonDecode(data) : data;
          final response = ServerErrorResponse.fromJson(json);
          return ErrorResponse(error: ServerError(message: response.error));
        }
    }
  } catch (exception) {
    return ErrorResponse(error: UnexpectedError());
  }
}
