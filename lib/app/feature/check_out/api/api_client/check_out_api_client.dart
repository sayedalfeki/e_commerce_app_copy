import 'package:dio/dio.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:flower_app/app/feature/check_out/data/models/user_address_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'check_out_api_client.g.dart';
@injectable
@RestApi()
abstract class CheckOutApiClient {
  @factoryMethod
  factory CheckOutApiClient(Dio dio)=_CheckOutApiClient;

  @GET(AppEndPoint.addresses)
  Future<UserAddressResponse> getUserAddresses();
}