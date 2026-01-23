import 'package:flower_app/app/feature/profile/domain/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../model/user_entity.dart';

@injectable
class GetUserDataUseCase {
  final ProfileRepoContract _profileRepoContract;

  GetUserDataUseCase(this._profileRepoContract);

  Future<BaseResponse<UserEntity>> invoke() {
    return _profileRepoContract.getProfile();
  }
}
