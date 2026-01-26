import 'package:flower_app/app/feature/start/domain/language_repo_contract.dart';
import 'package:flower_app/app/feature/start/domain/use_case/get_saved_language_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_saved_language_use_case_test.mocks.dart';

void main() {
  LanguageRepoContract languageRepoContract = MockLanguageRepoContract();
  GetSavedLanguageUseCase getSavedLanguageUseCase = GetSavedLanguageUseCase(
    languageRepoContract,
  );

  test(
    'when calling invoke function it must call get language repo function ',
    () {
      when(languageRepoContract.getLanguage()).thenReturn('ar');
      final result = getSavedLanguageUseCase.invoke();
      expect(result, equals('ar'));
      verify(languageRepoContract.getLanguage()).called(1);
    },
  );
}
