import 'package:dio/dio.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:flower_app/app/feature/product_details/data/models/product_details_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ProductDetailsApiClient {
  @factoryMethod
  factory ProductDetailsApiClient(Dio dio) = _ProductDetailsApiClient;

  @GET(AppEndPoint.products)
  Future<ProductDetailsDto> getProductDetails(@Path("productId") String productId);
}