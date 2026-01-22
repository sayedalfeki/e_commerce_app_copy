import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';

import '../../../config/base_response/base_response.dart';

import 'package:flower_app/app/config/base_response/base_response.dart';

import '../domain/request/change_password_request.dart';
import 'model/change_password_response.dart';

abstract class ProfileDataSourceContract {
  Future<BaseResponse<AuthDto>> getProfile();
  Future<BaseResponse<ChangePasswordResponse>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );
}
