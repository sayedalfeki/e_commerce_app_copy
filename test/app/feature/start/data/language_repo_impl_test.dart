import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/start/data/language_repo_impl.dart';
import 'package:flower_app/app/feature/start/domain/language_data_source_contract.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'language_repo_impl_test.mocks.dart';

@GenerateMocks([LanguageDataSourceContract])
void main() {
  late LanguageRepoImpl languageRepoContract;
  late LanguageDataSourceContract languageDataSourceContract;
  setUpAll(() {
    languageDataSourceContract = MockLanguageDataSourceContract();
    languageRepoContract = LanguageRepoImpl(languageDataSourceContract);
  });
  test(
    'when calling add language it should return data from data source',
    () async {
      provideDummy<BaseResponse<bool>>(SuccessResponse(data: true));
      when(
        languageDataSourceContract.addLanguage('ar'),
      ).thenAnswer((_) async => SuccessResponse(data: true));
      final result = await languageRepoContract.addLanguage('ar');
      expect(result, isA<SuccessResponse<bool>>());
      verify(languageDataSourceContract.addLanguage('ar')).called(1);
    },
  );
  test('when calling get language it should return data from data source', () {
    when(languageDataSourceContract.getLanguage()).thenReturn('ar');
    final result = languageRepoContract.getLanguage();
    expect(result, equals('ar'));
    verify(languageDataSourceContract.getLanguage()).called(1);
  });
}
