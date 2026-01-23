import 'package:flower_app/app/config/api_utils/api_utils.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/core/consts/app_consts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/storage_data_source_contract.dart';

@Injectable(as: StorageDataSourceContract)
class StorageLocalDataSourceImpl extends StorageDataSourceContract {
  final FlutterSecureStorage _storage;
  final SharedPreferences _sharedPreferences;

  StorageLocalDataSourceImpl(this._storage, this._sharedPreferences);

  @override
  Future<BaseResponse<bool>> addRememberMe(bool rememberMe) => executeApi(
    () => _sharedPreferences.setBool(AppConsts.rememberMeKey, rememberMe),
  );

  @override
  Future<BaseResponse<bool>> addToken(String token) => executeApi(() async {
    await _storage.write(key: AppConsts.tokenKey, value: token);
    return true;
  });

  @override
  Future<BaseResponse<bool>> getRememberMe() => executeApi(() async {
    final result = _sharedPreferences.getBool(AppConsts.rememberMeKey);
    return Future.value(result);
  });

  @override
  Future<BaseResponse<String?>> getToken() =>
      executeApi(() async => await _storage.read(key: AppConsts.tokenKey));

  @override
  Future<BaseResponse<bool>> clearToken() => executeApi(() async {
    await _storage.delete(key: AppConsts.tokenKey);
    return true;
  });

  @override
  Future<BaseResponse<bool>> clearRememberMe() => executeApi(() async {
    await _sharedPreferences.remove(AppConsts.rememberMeKey);
    return true;
  });
}
