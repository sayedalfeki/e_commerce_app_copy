import 'package:injectable/injectable.dart';
import '../../../../config/base_response/base_response.dart';
import '../forget_password_repo_contract.dart';
import '../request/verify_otp_request.dart';
import '../../data/model/verify_otp_response.dart';
@injectable
class VerifyOtpUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  VerifyOtpUseCase(this._forgetPasswordRepoContract);

  Future<BaseResponse<VerifyOtpResponse>> invoke(VerifyOtpRequest otpRequest) {
    return _forgetPasswordRepoContract.verifyOtp(otpRequest);
  }
}