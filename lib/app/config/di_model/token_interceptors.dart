import 'package:dio/dio.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/local_storage_processes/domain/storage_data_source_contract.dart';
import 'package:injectable/injectable.dart';

class TokenInterceptor extends Interceptor {
  final StorageDataSourceContract secureStorageService;

  TokenInterceptor(this.secureStorageService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final result = await secureStorageService.getToken();
    switch (result) {
      case SuccessResponse<String?>():
        options.headers['Authorization'] = 'Bearer ${result.data}';
      // options.headers['token'] = token;
      case ErrorResponse<String?>():
        handler.next(options);
    }
    // if (token != null && token.isNotEmpty) {

    // } else {
    //   var token = TokenManager.token;
    //   options.headers['Authorization'] = 'Bearer $token';
    //   options.headers['token'] = token;
    // }

    return handler.next(options);
  }
}
