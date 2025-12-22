import 'package:dio/dio.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DiAuthModel {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: AppEndPoint.baseUrl));
}
