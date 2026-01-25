import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/profile/domain/model/logout_model.dart';
import 'package:flower_app/app/feature/profile/domain/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  final ProfileRepoContract profileRepoContract;
  LogoutUseCase(this.profileRepoContract);

  Future<BaseResponse<LogoutModel>> call() async {
    final response = await profileRepoContract.logout();
    return response;
  }
}