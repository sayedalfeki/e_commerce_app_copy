import 'package:dio/dio.dart';
import 'package:flower_app/app/config/local_storage_processes/local_storage_processes.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../feature/forget_password/api/forget_password_api_client.dart';
import '../../feature/profile/api/profile_api_client.dart';

@module
abstract class DiAuthModel {

  @lazySingleton
  ForgetPasswordApiClient provideForgetPasswordApiClient(Dio dio) =>
      ForgetPasswordApiClient(dio, baseUrl: AppEndPoint.baseUrl);

  @lazySingleton
  ProfileApiClient provideProfileApiClient(Dio dio) =>
      ProfileApiClient(dio, baseUrl: AppEndPoint.baseUrl);

  @lazySingleton
  Dio provideDio(
      BaseOptions baseOptions,
      PrettyDioLogger logger,
      ) {
    final Dio dio = Dio(BaseOptions(baseUrl: AppEndPoint.baseUrl));
    dio.interceptors.add(logger);
    dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
      String? token = await LocalStorageProcesses.readTokin();

      //String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjk0ZDZlMDhlMzY0ZWY2MTQwNDJjZTYxIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3Njg4Mjc0NTB9.Ju-7nFiZPw4gysXDLbvc6nfxF4_TPXiSxEX0QYVML4g";
       if (token != null && token.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $token";
       }

       return handler.next(options);
      },
    ),
  );

    return dio;
  }

  @lazySingleton
  BaseOptions provideBaseOptions() => BaseOptions(
    sendTimeout: Duration(seconds: 60),
    receiveTimeout: Duration(seconds: 60),
    connectTimeout: Duration(seconds: 60),
  );

  @lazySingleton
  PrettyDioLogger providePrettyDioLogger() => PrettyDioLogger(
    requestHeader: kDebugMode,
    requestBody: kDebugMode,
    responseBody: kDebugMode,
    responseHeader: kDebugMode,
  );
}
