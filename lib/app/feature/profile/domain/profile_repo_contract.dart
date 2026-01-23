import 'package:flower_app/app/config/base_response/base_response.dart';

import 'model/user_entity.dart';
import '../domain/request/change_password_request.dart';

abstract class ProfileRepoContract {
  Future<BaseResponse<UserEntity>> getProfile();
  Future<BaseResponse<String>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );
}
