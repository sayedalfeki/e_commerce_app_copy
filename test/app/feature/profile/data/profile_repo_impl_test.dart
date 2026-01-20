import 'dart:io';

import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/profile/data/model/profile_photo_response.dart';
import 'package:flower_app/app/feature/profile/data/profile_data_source_contract.dart';
import 'package:flower_app/app/feature/profile/data/profile_repo_impl.dart';
import 'package:flower_app/app/feature/profile/domain/request/update_profile_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_repo_impl_test.mocks.dart';

@GenerateMocks([ProfileDataSourceContract])
void main() {
  late ProfileRepoImpl profileRepo;
  late ProfileDataSourceContract profileDataSourceContract;
  late AuthDto authDto;
  late UpdateProfileRequest updateProfileRequest;
  late ProfilePhotoResponse profilePhotoResponse;

  setUpAll(() {
    profileDataSourceContract = MockProfileDataSourceContract();
    profileRepo = ProfileRepoImpl(profileDataSourceContract);

    authDto = AuthDto(
      message: 'success',
      user: User(email: 's@yahoo.com'),
    );
    updateProfileRequest = UpdateProfileRequest(email: 's@yahoo.com');
    profilePhotoResponse = ProfilePhotoResponse(message: 'success');
  })});

  test('when calling getProfile it should get data from datasource', () async {
    provideDummy<BaseResponse<AuthDto>>(SuccessResponse(data: authDto));
    when(
      profileDataSourceContract.getProfile(),
    ).thenAnswer((_) => Future.value(SuccessResponse(data: authDto)));
    await profileRepo.getProfile();
    verify(profileDataSourceContract.getProfile());
  });
  test(
      'when calling updateProfile it should get data from datasource', () async {
    provideDummy<BaseResponse<String>>(SuccessResponse(data: 'success'));
    when(
      profileDataSourceContract.updateProfile(updateProfileRequest),
    ).thenAnswer((_) => Future.value(SuccessResponse(data: authDto)));
    await profileRepo.updateProfile(updateProfileRequest);
    verify(profileDataSourceContract.getProfile());
  });
  test('when calling uploadPhoto it should get data from datasource', () async {
    provideDummy<BaseResponse<ProfilePhotoResponse>>(
        SuccessResponse(data: profilePhotoResponse));
    when(
      profileDataSourceContract.uploadPhoto(File('')),
    ).thenAnswer((_) =>
        Future.value(SuccessResponse(data: profilePhotoResponse)));
    await profileRepo.uploadPhoto(File(''));
    verify(profileDataSourceContract.uploadPhoto(File('')));
  });
}
