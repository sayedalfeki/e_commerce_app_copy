import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:injectable/injectable.dart';

import '../domain/storage_data_source_contract.dart';
import '../domain/token_repo_contract.dart';

@Injectable(as: TokenRepoContract)
class TokenRepoImpl extends TokenRepoContract {
  final StorageDataSourceContract _contract;

  TokenRepoImpl(this._contract);

  @override
  Future<BaseResponse<String?>> getToken() {
    return _contract.getToken();
  }

  @override
  Future<BaseResponse<bool>> clearToken() {
    return _contract.clearToken();
  }

  @override
  Future<BaseResponse<bool>> getRememberMe() {
    return _contract.getRememberMe();
  }
}
