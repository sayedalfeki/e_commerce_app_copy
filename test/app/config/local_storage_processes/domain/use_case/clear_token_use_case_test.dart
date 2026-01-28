import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/local_storage_processes/domain/token_repo_contract.dart';
import 'package:flower_app/app/config/local_storage_processes/domain/use_case/logout_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'clear_token_use_case_test.mocks.dart';

@GenerateMocks([TokenRepoContract])
void main() {
  late TokenRepoContract mockRepo;
  late LogoutUserUseCase useCase;

  setUp(() {
    mockRepo = MockTokenRepoContract();
    useCase = LogoutUserUseCase(mockRepo);
  });

  test('invoke should call clearToken on repo', () async {
    // arrange
    provideDummy<BaseResponse<bool>>(SuccessResponse(data: true));

    when(
      mockRepo.clearToken(),
    ).thenAnswer((_) async => SuccessResponse(data: true));

    // act
    final result = await useCase.invoke() as SuccessResponse<bool>;

    // assert
    verify(mockRepo.clearToken());
    expect(result, isA<SuccessResponse<bool>>());
    expect(result.data, true);
  });
}
