import 'package:flower_app/app/feature/address/domain/address_repo_contract.dart';
import 'package:flower_app/app/feature/address/domain/model/user_address_entity.dart';

import '../../../../config/base_response/base_response.dart';

class GetUserAddressesUseCase {
  final AddressRepoContract _addressRepoContract;

  GetUserAddressesUseCase(this._addressRepoContract);

  Future<BaseResponse<List<UserAddressEntity>>> invoke() {
    return _addressRepoContract.getUserAddresses();
  }
}
