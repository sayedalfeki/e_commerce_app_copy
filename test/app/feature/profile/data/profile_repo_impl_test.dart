import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/profile/data/profile_data_source_contract.dart';
import 'package:flower_app/app/feature/profile/data/profile_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_repo_impl_test.mocks.dart';

@GenerateMocks([ProfileDataSourceContract])
void main() {
  late ProfileRepoImpl profileRepo;
  late ProfileDataSourceContract profileDataSourceContract;
  late AuthDto authDto;
  setUpAll(() {
    profileDataSourceContract = MockProfileDataSourceContract();
    profileRepo = ProfileRepoImpl(profileDataSourceContract);

    authDto = AuthDto(
      message: 'success',
      user: User(email: 's@yahoo.com'),
    );
  });

  test('when calling getProfile it should get data from datasource', () async {
    provideDummy<BaseResponse<AuthDto>>(SuccessResponse(data: authDto));
    when(
      profileDataSourceContract.getProfile(),
    ).thenAnswer((_) => Future.value(SuccessResponse(data: authDto)));
    await profileRepo.getProfile();
    verify(profileDataSourceContract.getProfile());
  });
}
