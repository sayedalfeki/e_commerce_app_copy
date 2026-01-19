import 'package:flower_app/app/config/base_response/base_response.dart';

import 'model/user_entity.dart';

abstract class ProfileRepoContract {
  Future<BaseResponse<UserEntity>> getProfile();
}
