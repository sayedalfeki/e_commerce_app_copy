import 'package:dio/dio.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/get_home_tab_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'home_tab_api_client.g.dart';
@injectable
@RestApi()
abstract class HomeTabApiClient {
  @factoryMethod
  factory HomeTabApiClient(Dio dio)=_HomeTabApiClient;
  @GET(AppEndPoint.home)
  Future<GetHomeTabResponse> getHomeTabDetails();
}