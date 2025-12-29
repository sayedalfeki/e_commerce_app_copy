import 'package:flower_app/app/config/base_response/base_response.dart';

abstract class ForgetPasswordRepoContract {
  Future<BaseResponse<String>> forgetPassword(String email);
}
