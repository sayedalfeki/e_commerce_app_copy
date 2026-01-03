
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/forget_password/domain/request/forget_password_request.dart';
import 'package:flower_app/app/feature/forget_password/domain/request/reset_password_request.dart';
import 'package:flower_app/app/feature/forget_password/domain/request/verify_otp_request.dart';

import '../data/model/forget_password_response.dart';
import '../data/model/reset_password_response.dart';
import '../data/model/verify_otp_response.dart';
abstract class ForgetPasswordRepoContract {
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest);

  Future<BaseResponse<VerifyOtpResponse>> verifyOtp(
      VerifyOtpRequest otpRequest);

  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
}