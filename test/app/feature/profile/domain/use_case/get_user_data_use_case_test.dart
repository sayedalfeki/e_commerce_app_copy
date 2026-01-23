import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/profile/domain/model/user_entity.dart';
import 'package:flower_app/app/feature/profile/domain/profile_repo_contract.dart';
import 'package:flower_app/app/feature/profile/domain/use_case/get_user_data_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_data_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepoContract])
void main() {
  late ProfileRepoContract profileRepo;
  late GetUserDataUseCase getUserDataUseCase;
  late UserEntity userEntity;
  setUpAll(() {
    profileRepo = MockProfileRepoContract();
    getUserDataUseCase = GetUserDataUseCase(profileRepo);
    userEntity = UserEntity(email: 's@yahoo.com');
  });

  test(
    'when calling get user data it should get data from repository',
    () async {
      provideDummy<BaseResponse<UserEntity>>(SuccessResponse(data: userEntity));
      when(
        profileRepo.getProfile(),
      ).thenAnswer((_) => Future.value(SuccessResponse(data: userEntity)));
      await getUserDataUseCase.invoke();
      verify(profileRepo.getProfile());
    },
  );
}
