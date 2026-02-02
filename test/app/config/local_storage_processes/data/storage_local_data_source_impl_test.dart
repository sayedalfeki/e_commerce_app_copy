import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/local_storage_processes/data/storage_local_data_source_impl.dart';
import 'package:flower_app/app/core/consts/app_consts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'storage_local_data_source_impl_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage, SharedPreferences])
void main() {
  late FlutterSecureStorage mockSecureStorage;
  late SharedPreferences mockSharedPreferences;
  late StorageLocalDataSourceImpl dataSource;
  setUpAll(() {
    mockSecureStorage = MockFlutterSecureStorage();
    mockSharedPreferences = MockSharedPreferences();
    dataSource = StorageLocalDataSourceImpl(
      mockSecureStorage,
      mockSharedPreferences,
    );
  });

  test('addRememberMe should save value in SharedPreferences', () async {
    // arrange
    when(
      mockSharedPreferences.setBool(AppConsts.rememberMeKey, true),
    ).thenAnswer((_) async => Future.value(true));

    // act
    final result = await dataSource.addRememberMe(true);

    // assert
    expect(result, isA<SuccessResponse<bool>>());
  });
  test('getRememberMe should return stored value', () {
    // arrange
    when(
      mockSharedPreferences.getBool(AppConsts.rememberMeKey),
    ).thenReturn(true);

    // act
    final result = dataSource.getRememberMe();

    expect(result, true);
  });
  test('addToken should write token to secure storage', () async {
    // arrange
    when(
      mockSecureStorage.write(key: AppConsts.tokenKey, value: 'value'),
    ).thenAnswer((_) async {
      return;
    });

    // act
    final result = await dataSource.addToken('value') as SuccessResponse<bool>;

    expect(result.data, true);
  });
  test('getToken should read token from secure storage', () async {
    // arrange
    when(
      mockSecureStorage.read(key: AppConsts.tokenKey),
    ).thenAnswer((_) async => 'ABC123');

    // act
    final result = await dataSource.getToken();

    // assert
    expect(result, 'ABC123');
  });
  test('clearToken should delete all secure storage', () async {
    // arrange
    when(mockSecureStorage.deleteAll()).thenAnswer((_) async {
      return;
    });

    // act
    final result = await dataSource.clearToken() as SuccessResponse<bool>;

    // assert

    expect(result.data, true);
  });
  test('clearRememberMe should remove rememberMe key', () async {
    // arrange
    when(
      mockSharedPreferences.remove(AppConsts.rememberMeKey),
    ).thenAnswer((_) async => true);

    // act
    final result = await dataSource.clearRememberMe() as SuccessResponse<bool>;

    expect(result.data, true);
  });
}
