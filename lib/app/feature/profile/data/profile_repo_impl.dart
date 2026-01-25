import 'dart:io';

import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/profile/data/model/profile_photo_response.dart';
import 'package:flower_app/app/feature/profile/data/profile_data_source_contract.dart';
import 'package:flower_app/app/feature/profile/domain/model/user_entity.dart';
import 'package:flower_app/app/feature/profile/domain/profile_repo_contract.dart';
import 'package:flower_app/app/feature/profile/domain/request/update_profile_request.dart';
import 'package:injectable/injectable.dart';

import '../../../config/local_storage_processes/domain/storage_data_source_contract.dart';
import '../domain/request/change_password_request.dart';
import 'model/change_password_response.dart';

@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl extends ProfileRepoContract {
  final ProfileDataSourceContract _profileDataSourceContract;
  final StorageDataSourceContract _storageDataSourceContract;

  ProfileRepoImpl(this._profileDataSourceContract,
      this._storageDataSourceContract);
  @override
  Future<BaseResponse<UserEntity>> getProfile() async {
    final response = await _profileDataSourceContract.getProfile();
    switch (response) {
      case SuccessResponse<AuthDto>():
        return SuccessResponse(data: response.data.toUserEntity());
      case ErrorResponse<AuthDto>():
        return ErrorResponse(error: response.error);
    }
  }

  @override
  Future<BaseResponse<String>> uploadPhoto(File file) async {
    final response = await _profileDataSourceContract.uploadPhoto(file);
    switch (response) {
      case SuccessResponse<ProfilePhotoResponse>():
        return SuccessResponse(data: response.data.message ?? "");
      case ErrorResponse<ProfilePhotoResponse>():
        return ErrorResponse(error: response.error);
    }
  }

  @override
  Future<BaseResponse<String>> updateProfile(
      UpdateProfileRequest request) async {
    final response = await _profileDataSourceContract.updateProfile(request);
    switch (response) {
      case SuccessResponse<AuthDto>():
        return SuccessResponse(data: response.data.message ?? "");
      case ErrorResponse<AuthDto>():
        return ErrorResponse(error: response.error);
    }
  }

  @override
  Future<BaseResponse<String>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  ) async {
    final response = await _profileDataSourceContract.changePassword(
      changePasswordRequest,
    );
    switch (response) {
      case SuccessResponse<ChangePasswordResponse>():
        _storageDataSourceContract.clearToken();
        _storageDataSourceContract.clearRememberMe();
        return SuccessResponse(data: response.data.message ?? '');
      case ErrorResponse<ChangePasswordResponse>():
        return ErrorResponse(error: response.error);
    }
  }
}
