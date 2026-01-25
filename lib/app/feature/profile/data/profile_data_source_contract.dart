import 'dart:io';

import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/profile/data/model/logout_dto.dart';
import 'package:flower_app/app/feature/profile/domain/request/update_profile_request.dart';

import '../../../config/base_response/base_response.dart';
import 'model/profile_photo_response.dart';

import 'package:flower_app/app/config/base_response/base_response.dart';

import '../domain/request/change_password_request.dart';
import 'model/change_password_response.dart';

abstract class ProfileDataSourceContract {
  Future<BaseResponse<AuthDto>> getProfile();
  Future<BaseResponse<ChangePasswordResponse>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );

  Future<BaseResponse<AuthDto>> updateProfile(UpdateProfileRequest request);

  Future<BaseResponse<ProfilePhotoResponse>> uploadPhoto(File file);
  Future<BaseResponse<LogoutDto>> logout();
}
