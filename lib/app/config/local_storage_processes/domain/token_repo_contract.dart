import 'package:flower_app/app/config/base_response/base_response.dart';

abstract class TokenRepoContract {
  Future<BaseResponse<String?>> getToken();

  Future<BaseResponse<bool>> clearToken();

  Future<BaseResponse<bool>> getRememberMe();
}
