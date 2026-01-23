import 'package:injectable/injectable.dart';

import '../../../base_response/base_response.dart';
import '../token_repo_contract.dart';

@injectable
class GetRememberMeUseCase {
  final TokenRepoContract _tokenRepoContract;

  GetRememberMeUseCase(this._tokenRepoContract);

  Future<BaseResponse<bool>> invoke() => _tokenRepoContract.getRememberMe();
}
