import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/start/domain/language_repo_contract.dart';
import 'package:flower_app/app/feature/start/domain/use_case/add_language_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_saved_language_use_case_test.mocks.dart';

void main() {
  LanguageRepoContract languageRepoContract = MockLanguageRepoContract();
  AddLanguageUseCase addLanguageUseCase = AddLanguageUseCase(
    languageRepoContract,
  );

  test(
    'when calling invoke function it must call add language repo function ',
    () async {
      provideDummy<BaseResponse<bool>>(SuccessResponse(data: true));
      when(
        languageRepoContract.addLanguage('ar'),
      ).thenAnswer((_) async => SuccessResponse(data: true));
      final result = await addLanguageUseCase.invoke('ar');
      expect(result, isA<SuccessResponse<bool>>());
      verify(languageRepoContract.addLanguage('ar')).called(1);
    },
  );
}
