import 'package:flower_app/app/feature/address/domain/address_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../model/user_address_entity.dart';

@injectable
class DeleteUserAddressUseCase {
  final AddressRepoContract _addressRepoContract;

  DeleteUserAddressUseCase(this._addressRepoContract);

  Future<BaseResponse<List<UserAddressEntity>>> invoke(String id) {
    return _addressRepoContract.deleteUserAddress(id);
  }
}
