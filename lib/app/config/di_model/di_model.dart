import 'package:dio/dio.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../feature/forget_password/api/forget_password_api_client.dart';
import '../../feature/occasions/api/occasions_api_client/occasions_api_clients.dart';

@module
abstract class DiModel {

  @lazySingleton
  ForgetPasswordApiClient provideForgetPasswordApiClient(Dio dio) =>
      ForgetPasswordApiClient(dio, baseUrl: AppEndPoint.baseUrl);

  @lazySingleton
  OccasionsApiClient provideOccasionsApiClient(Dio dio) =>
      OccasionsApiClient(dio, baseUrl: AppEndPoint.baseUrl);
  @lazySingleton
  Dio provideDio(
      BaseOptions baseOptions,
      PrettyDioLogger logger,
      ) {
    final Dio dio = Dio(baseOptions);
    dio.interceptors.add(logger);
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
