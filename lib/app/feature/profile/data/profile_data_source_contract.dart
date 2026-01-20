import 'dart:io';

import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/profile/domain/request/update_profile_request.dart';

import '../../../config/base_response/base_response.dart';
import 'model/profile_photo_response.dart';

abstract class ProfileDataSourceContract {
  Future<BaseResponse<AuthDto>> getProfile();

  Future<BaseResponse<AuthDto>> updateProfile(UpdateProfileRequest request);

  Future<BaseResponse<ProfilePhotoResponse>> uploadPhoto(File file);
}
