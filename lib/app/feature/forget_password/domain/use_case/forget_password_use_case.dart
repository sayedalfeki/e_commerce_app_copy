import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../data/model/forget_password_response.dart';
import '../forget_password_repo_contract.dart';
import '../request/forget_password_request.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  ForgetPasswordUseCase(this._forgetPasswordRepoContract);

  Future<BaseResponse<ForgetPasswordResponse>> invoke(
    ForgetPasswordRequest forgetPasswordRequest,
  ) {
    return _forgetPasswordRepoContract.forgetPassword(forgetPasswordRequest);
  }
}
