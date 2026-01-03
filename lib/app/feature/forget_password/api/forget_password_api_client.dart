import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../core/endpoint/app_endpoint.dart';
import '../data/model/forget_password_response.dart';
import '../data/model/reset_password_response.dart';
import '../data/model/verify_otp_response.dart';
import '../domain/request/forget_password_request.dart';
import '../domain/request/reset_password_request.dart';
import '../domain/request/verify_otp_request.dart';

part 'forget_password_api_client.g.dart';

@RestApi(baseUrl: AppEndPoint.baseUrl)
abstract class ForgetPasswordApiClient {
  factory ForgetPasswordApiClient(Dio dio, {String baseUrl}) =
      _ForgetPasswordApiClient;

  @POST(AppEndPoint.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequest forgetPasswordRequest,
  );

  @POST(AppEndPoint.verifyOtp)
  Future<VerifyOtpResponse> verifyOtp(
    @Body() VerifyOtpRequest verifyOtpRequest,
  );

  @PUT(AppEndPoint.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest resetPasswordRequest,
  );
}
