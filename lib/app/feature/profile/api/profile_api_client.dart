import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../core/endpoint/app_endpoint.dart';
import '../../auth/data/model/auth_response.dart';
import '../data/model/change_password_response.dart';
import '../domain/request/change_password_request.dart';

part 'profile_api_client.g.dart';

@RestApi(baseUrl: AppEndPoint.baseUrl)
abstract class ProfileApiClient {
  factory ProfileApiClient(Dio dio, {String baseUrl}) = _ProfileApiClient;

  @GET(AppEndPoint.profile)
  Future<AuthDto> getProfile();
  @PATCH(AppEndPoint.changePassword)
  Future<ChangePasswordResponse> changePassword(
    @Body() ChangePasswordRequest resetPasswordRequest,
  );
}
