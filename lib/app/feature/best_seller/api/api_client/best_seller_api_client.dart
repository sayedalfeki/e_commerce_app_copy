import 'package:dio/dio.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:flower_app/app/feature/best_seller/data/models/best_seller_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'best_seller_api_client.g.dart';
@injectable
@RestApi()
abstract class BestSellerApiClient {
  @factoryMethod
  factory BestSellerApiClient(Dio dio)=_BestSellerApiClient;
  @GET(AppEndPoint.bestSeller)
  Future<BestSellerResponse> getBestSellers();
}