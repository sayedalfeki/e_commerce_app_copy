import 'package:flower_app/app/feature/profile/domain/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../request/update_profile_request.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepoContract _profileRepoContract;

  UpdateProfileUseCase(this._profileRepoContract);

  Future<BaseResponse<String>> invoke(UpdateProfileRequest request) {
    return _profileRepoContract.updateProfile(request);
  }
}
