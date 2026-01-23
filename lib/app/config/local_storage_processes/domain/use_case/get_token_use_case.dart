import 'package:flower_app/app/config/local_storage_processes/domain/token_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../base_response/base_response.dart';

@injectable
class GetTokenUseCase {
  final TokenRepoContract _contract;

  GetTokenUseCase(this._contract);

  Future<BaseResponse<String?>> invoke() async {
    return await _contract.getToken();
  }
}
