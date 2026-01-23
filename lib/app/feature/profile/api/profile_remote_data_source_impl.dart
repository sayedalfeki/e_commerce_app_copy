import 'dart:io';

import 'package:flower_app/app/config/api_utils/api_utils.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/profile/api/profile_api_client.dart';
import 'package:flower_app/app/feature/profile/data/model/profile_photo_response.dart';
import 'package:flower_app/app/feature/profile/data/profile_data_source_contract.dart';
import 'package:flower_app/app/feature/profile/domain/request/update_profile_request.dart';
import 'package:injectable/injectable.dart';

import '../data/model/change_password_response.dart';
import '../domain/request/change_password_request.dart';
@Injectable(as: ProfileDataSourceContract)
class ProfileRemoteDataSourceImpl extends ProfileDataSourceContract {
  final ProfileApiClient _profileApiClient;

  ProfileRemoteDataSourceImpl(this._profileApiClient);

  @override
  Future<BaseResponse<AuthDto>> getProfile() =>
      executeApi(() => _profileApiClient.getProfile());

  @override
  Future<BaseResponse<ProfilePhotoResponse>> uploadPhoto(File file) =>
      executeApi(() => _profileApiClient.uploadPhoto(file),);

  @override
  Future<BaseResponse<AuthDto>> updateProfile(UpdateProfileRequest request) =>
      executeApi(() => _profileApiClient.updateProfile(request),);

  @override
  Future<BaseResponse<ChangePasswordResponse>> changePassword(
    ChangePasswordRequest request,
  ) {
    return executeApi(() => _profileApiClient.changePassword(request));
  }
}
