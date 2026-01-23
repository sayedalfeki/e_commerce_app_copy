import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/profile/data/profile_data_source_contract.dart';
import 'package:flower_app/app/feature/profile/domain/model/user_entity.dart';
import 'package:flower_app/app/feature/profile/domain/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../domain/request/change_password_request.dart';
import 'model/change_password_response.dart';

@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl extends ProfileRepoContract {
  final ProfileDataSourceContract _profileDataSourceContract;
  ProfileRepoImpl(this._profileDataSourceContract);
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
  Future<BaseResponse<String>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  ) async {
    final response = await _profileDataSourceContract.changePassword(
      changePasswordRequest,
    );
    switch (response) {
      case SuccessResponse<ChangePasswordResponse>():
        return SuccessResponse(data: response.data.message ?? '');
      case ErrorResponse<ChangePasswordResponse>():
        return ErrorResponse(error: response.error);
    }
  }
}
