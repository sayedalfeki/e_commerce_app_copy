import 'package:dio/dio.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:flower_app/app/feature/occasions/data/model/all_occasions_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/model/products/products_respons.dart';

part 'occasions_api_clients.g.dart';

@RestApi()
abstract class OccasionsApiClient {
  factory OccasionsApiClient(Dio dio, {String baseUrl}) = _OccasionsApiClient;

  @GET(AppEndPoint.allOccasions)
  Future<AllOccasionResponse> getAllOccasions();

  @GET(AppEndPoint.products)
  Future<ProductsResponse> getAllProductsByOccasion(
      @Query("occasion") String occasionId);
}
