import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/core/consts/app_consts.dart';
import 'package:flower_app/app/feature/start/data/language_local_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language_local_data_source_impl_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late SharedPreferences sharedPreferences;
  late LanguageLocalDataSourceImpl languageLocalDataSourceImpl;
  setUpAll(() {
    sharedPreferences = MockSharedPreferences();
    languageLocalDataSourceImpl = LanguageLocalDataSourceImpl(
      sharedPreferences,
    );
  });
  test('when call add language it should return true', () async {
    when(
      sharedPreferences.setString(AppConsts.languageKey, 'ar'),
    ).thenAnswer((_) async => true);
    final result =
        await languageLocalDataSourceImpl.addLanguage('ar')
            as SuccessResponse<bool>;
    expect(result, isA<SuccessResponse<bool>>());
    expect(result.data, equals(true));
  });
  test('when call get language it should return saved language', () {
    when(sharedPreferences.getString(AppConsts.languageKey)).thenReturn('ar');
    final result = languageLocalDataSourceImpl.getLanguage();

    expect(result, equals('ar'));
  });
}
