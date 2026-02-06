import 'package:dio/dio.dart';
import 'package:flower_app/app/feature/occasion/data/api_client/occasion_api_client.dart';
import 'package:flower_app/app/feature/occasion/data/api_client/product_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class OccasionApiModule {
  @injectable
  OccasionApiClient occasionApiClient(Dio dio) => OccasionApiClient(dio);

  @injectable
  ProductApiClient productApiClient(Dio dio) => ProductApiClient(dio);
}
