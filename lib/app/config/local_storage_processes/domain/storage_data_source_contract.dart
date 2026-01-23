import '../../base_response/base_response.dart';

abstract class StorageDataSourceContract {
  Future<BaseResponse<String?>> getToken();

  Future<BaseResponse<bool>> addToken(String token);

  Future<BaseResponse<bool>> addRememberMe(bool rememberMe);

  Future<BaseResponse<bool>> getRememberMe();

  Future<BaseResponse<bool>> clearToken();

  Future<BaseResponse<bool>> clearRememberMe();
}
