import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';

import '../../../config/base_response/base_response.dart';

abstract class ProfileDataSourceContract {
  Future<BaseResponse<AuthDto>> getProfile();
}
