import 'dart:io';

import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/profile/data/model/change_password_response.dart';
import 'package:flower_app/app/feature/profile/data/model/profile_photo_response.dart';
import 'package:flower_app/app/feature/profile/data/profile_data_source_contract.dart';
import 'package:flower_app/app/feature/profile/data/profile_repo_impl.dart';
import 'package:flower_app/app/feature/profile/domain/request/change_password_request.dart';
import 'package:flower_app/app/feature/profile/domain/request/update_profile_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_repo_impl_test.mocks.dart';

@GenerateMocks([ProfileDataSourceContract])
void main() {
  late ProfileRepoImpl profileRepo;
  late ProfileDataSourceContract profileDataSourceContract;
  late ChangePasswordRequest changePasswordRequest;
  late ChangePasswordResponse changePasswordResponse;
  late AuthDto authDto;
  late UpdateProfileRequest updateProfileRequest;
  late ProfilePhotoResponse profilePhotoResponse;
  late File file;
  setUpAll(() {
    profileDataSourceContract = MockProfileDataSourceContract();
    profileRepo = ProfileRepoImpl(profileDataSourceContract);

    authDto = AuthDto(
      message: 'success',
      user: User(email: 's@yahoo.com'),
    );
    changePasswordRequest = ChangePasswordRequest(
      newPassword: 'password',
      password: '123',
    );
    updateProfileRequest = UpdateProfileRequest(email: 's@yahoo.com');
    profilePhotoResponse = ProfilePhotoResponse(message: 'success');
    file = File('test/resources/fake_image.png');
    changePasswordResponse = ChangePasswordResponse();
  });

  test(
    'when calling change password it should get data from datasource',
    () async {
      provideDummy<BaseResponse<ChangePasswordResponse>>(
        SuccessResponse(data: changePasswordResponse),
      );
      when(
        profileDataSourceContract.changePassword(changePasswordRequest),
      ).thenAnswer(
        (_) => Future.value(SuccessResponse(data: changePasswordResponse)),
      );
      await profileRepo.changePassword(changePasswordRequest);
      verify(profileDataSourceContract.changePassword(changePasswordRequest));
    },
  );
  test('when calling getProfile it should get data from datasource', () async {
    provideDummy<BaseResponse<AuthDto>>(SuccessResponse(data: authDto));
    when(
      profileDataSourceContract.getProfile(),
    ).thenAnswer((_) => Future.value(SuccessResponse(data: authDto)));
    await profileRepo.getProfile();
    verify(profileDataSourceContract.getProfile());
  });
  test(
    'when calling updateProfile it should get data from datasource',
    () async {
      provideDummy<BaseResponse<AuthDto>>(SuccessResponse(data: authDto));
      when(
        profileDataSourceContract.updateProfile(updateProfileRequest),
      ).thenAnswer((_) => Future.value(SuccessResponse(data: authDto)));
      await profileRepo.updateProfile(updateProfileRequest);
      verify(profileDataSourceContract.updateProfile(updateProfileRequest));
    },
  );
  test('when calling uploadPhoto it should get data from datasource', () async {
    provideDummy<BaseResponse<ProfilePhotoResponse>>(
      SuccessResponse(data: profilePhotoResponse),
    );
    when(profileDataSourceContract.uploadPhoto(file)).thenAnswer(
      (_) => Future.value(SuccessResponse(data: profilePhotoResponse)),
    );
    await profileRepo.uploadPhoto(file);
    verify(profileDataSourceContract.uploadPhoto(file));
  });
}
