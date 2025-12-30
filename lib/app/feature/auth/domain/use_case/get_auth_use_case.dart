import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/domain/model/auth_model.dart';
import 'package:flower_app/app/feature/auth/domain/repo/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAuthUseCase {
  final AuthRepoContract authRepo;
  GetAuthUseCase(this.authRepo);

  Future<BaseResponse<AuthModel>> login(String email, String password) {
    return authRepo.login(email, password);
  }
}
