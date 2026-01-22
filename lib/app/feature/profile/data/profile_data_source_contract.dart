import 'package:flower_app/app/config/base_response/base_response.dart';

import '../domain/request/change_password_request.dart';
import 'model/change_password_response.dart';

abstract class ProfileDataSourceContract {
  Future<BaseResponse<ChangePasswordResponse>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );
}
