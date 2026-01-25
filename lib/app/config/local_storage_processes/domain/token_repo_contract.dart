import 'package:flower_app/app/config/base_response/base_response.dart';

abstract class TokenRepoContract {
  Future<BaseResponse<bool>> clearToken();

  bool? getRememberMe();
}
